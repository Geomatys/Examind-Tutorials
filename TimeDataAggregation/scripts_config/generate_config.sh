#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
  echo "Usage: $0 input_list.txt output_config.json" >&2
  exit 1
fi

INPUT="$1"
OUTPUT="$2"

# Ensure TZ is set to UTC to avoid local timezone interference
export TZ=UTC

mapfile -t FILES < "$INPUT"

# Helper: derive ISO start date (UTC) from filename NDVI_AYYYYDDD_*.tif
get_start_date() {
  local fn="$1"
  local token year doy
  token=$(echo "$fn" | cut -d'_' -f2)        # A2001001
  year=${token:1:4}
  doy=${token:5:3}
  # Use day-of-year parsing directly
  date -u -d "${year}-01-01 +${doy} days -1 day" +"%Y-%m-%dT%H:%M:%SZ"
}

START_DATES=()
for fn in "${FILES[@]}"; do
  START_DATES+=( "$(get_start_date "$fn")" )
done

{
  echo '{'
  echo '  "name": "NDVICoverage",'
  echo '  "watchFiles": false,'
  echo '  "files": ['

  last_index=$(( ${#FILES[@]} - 1 ))

  for i in "${!FILES[@]}"; do
    fn="${FILES[$i]}"
    start="${START_DATES[$i]}"

    if [ "$i" -lt "$last_index" ]; then
      next_start="${START_DATES[$((i+1))]}"
      # FIX: Do NOT strip the trailing Z. Keep it so date(1) knows the input is UTC.
      end=$(date -u -d "$next_start - 1 second" +"%Y-%m-%dT%H:%M:%SZ")
    else
      # For the last file, set it to the very end of that year
      year=${start:0:4}
      end="${year}-12-31T23:59:59Z"
    fi

    comma=","
    [ "$i" -eq "$last_index" ] && comma=""

    printf '    {\n'
    printf '      "path": "./%s",\n' "$fn"
    printf '      "startdate": "%s",\n' "$start"
    printf '      "enddate": "%s"\n' "$end"
    printf '    }%s\n' "$comma"
  done

  echo '  ]'
  echo '}'
} > "$OUTPUT"
