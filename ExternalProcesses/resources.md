# Resources

## Source Code

### ExternalStacProcess

This directory contains the code for the STAC Downloader process.

- [Dockerfile](Code/ExternalStacProcess/Dockerfile)
- [STACDownloader.cwl](Code/ExternalStacProcess/STACDownloader.cwl)
- [stac_downloader.py](Code/ExternalStacProcess/stac_downloader.py)
- [stac_downloader_ifremer.py](Code/ExternalStacProcess/stac_downloader_ifremer.py) (an alternative to use alternates links with ifremer STAC when `HTTPS_IFREMER` is present in assets)
- [Dockerfile_ifremer](Code/ExternalStacProcess/Dockerfile_ifremer) (an alternative Dockerfile to use the ifremer STAC downloader)

### NDVIMultiSensor

This directory contains the code for the NDVI MultiSensor process.

- [Dockerfile](Code/NDVIMultiSensor/Dockerfile)
- [NDVIMultiSensor.cwl](Code/NDVIMultiSensor/NDVIMultiSensor.cwl)
- [calc_ndvi_gdal.py](Code/NDVIMultiSensor/calc_ndvi_gdal.py)

## JSON Requests

### Deploy Requests

- [DeployRequest_dockerized_ndvi.json](deploy_requests_json/DeployRequest_dockerized_ndvi.json)
- [DeployRequest_stac_downloader.json](deploy_requests_json/DeployRequest_stac_downloader.json)
- [ProcessResult_dockerized_ndvi.json](deploy_requests_json/ProcessResult_dockerized_ndvi.json)
- [ProcessResult_stac_downloader.json](deploy_requests_json/ProcessResult_stac_downloader.json)

### Execute Requests

- [ExecuteProcessResult_dockerized_ndvi.json](execute_requests_json/ExecuteProcessResult_dockerized_ndvi.json)
- [ExecuteRequest_dockerized_ndvi.json](execute_requests_json/ExecuteRequest_dockerized_ndvi.json)
- [ExecuteRequest_stac_downloader.json](execute_requests_json/ExecuteRequest_stac_downloader.json)
