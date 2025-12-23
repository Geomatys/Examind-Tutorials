import sys
import os
import requests
import shutil
from urllib.parse import urlparse
from requests.exceptions import RequestException, JSONDecodeError

# --- Helper Functions ---

def get_filename_from_url(url):
    """Extracts a filename from the URL or generates a default one."""
    parsed = urlparse(url)
    filename = os.path.basename(parsed.path.strip('/'))
    if not filename or '.' not in filename:
        return "downloaded_asset.dat"
    return filename

def download_file(url, output_dir="."):
    """
    Downloads a file, writing it to /tmp first to bypass permission issues
    on mounted volumes, then moving it to the final output directory.
    """
    local_filename = get_filename_from_url(url)

    # Use /tmp as a buffer to avoid PermissionError [Errno 13] on mounted volumes
    temp_path = os.path.join("/tmp", local_filename)
    dest_path = os.path.join(output_dir, local_filename)

    print(f"DEBUG: Downloading asset from: {url}")
    try:
        # 1. Download to /tmp
        with requests.get(url, stream=True) as r:
            r.raise_for_status()
            with open(temp_path, 'wb') as f:
                shutil.copyfileobj(r.raw, f)

        # 2. Move to final destination (current working directory)
        shutil.move(temp_path, dest_path)

        print(f"SUCCESS: File saved to: {dest_path}")
        return dest_path
    except Exception as e:
        print(f"CRITICAL ERROR: Failed to download or move file. Error: {e}", file=sys.stderr)
        if os.path.exists(temp_path):
            os.remove(temp_path)
        sys.exit(1)

# --- Main Logic ---

def process_stac_url(start_url):
    print(f"Fetching metadata from: {start_url}")
    item_data = None

    try:
        resp = requests.get(start_url)
        resp.raise_for_status()
        data = resp.json()
    except Exception as e:
        print(f"ERROR: Failed to retrieve data from STAC URL: {e}", file=sys.stderr)
        sys.exit(1)

    # --- Identify Item ---
    if data.get('type') == 'Feature':
        item_data = data
    elif data.get('type') == 'Collection':
        print("Input recognized as a STAC Collection. Looking for the first item...")
        # Try STAC API '/items' endpoint
        items_url = start_url.rstrip('/') + "/items"
        try:
            items_resp = requests.get(items_url)
            items_resp.raise_for_status()
            features = items_resp.json().get('features', [])
            if features:
                item_data = features[0]
            else:
                print("ERROR: Collection contains no items.", file=sys.stderr)
                sys.exit(1)
        except Exception as e:
            print(f"ERROR: Could not retrieve items from {items_url}: {e}", file=sys.stderr)
            sys.exit(1)
    else:
        print(f"ERROR: Unknown STAC type '{data.get('type')}'.", file=sys.stderr)
        sys.exit(1)

    # --- Asset Selection Logic (Filtered by Role) ---
    assets = item_data.get('assets', {})
    if not assets:
        print("ERROR: Selected Item has no assets.", file=sys.stderr)
        sys.exit(1)

    selected_asset_href = None
    selected_key = None

    # Search for the first asset with 'data' in its roles
    for key, asset_metadata in assets.items():
        roles = asset_metadata.get('roles', [])
        if "data" in roles:
            selected_key = key
            selected_asset_href = asset_metadata.get('href')
            print(f"DEBUG: Found asset '{key}' with role 'data'.")
            break

    # Final Check: if no asset has the 'data' role, exit with error
    if not selected_asset_href:
        print("ERROR: Could not find any asset with the role 'data' in this item.", file=sys.stderr)
        print(f"Available assets: {list(assets.keys())}", file=sys.stderr)
        sys.exit(1)

    print(f"Selected asset key for download: {selected_key}")
    download_file(selected_asset_href)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python stac_downloader.py <stac_url>", file=sys.stderr)
        sys.exit(1)

    stac_url = sys.argv[1]
    process_stac_url(stac_url)