# Welcome to Examind Tutorials 🌍

This repository contains a list of tutorials on various Examind features.

If you have any questions, or if you want the latest docker image of Examind Community, please contact :
- ✉️ quentin.bialota@geomatys.com
- ✉️ dorian.ginane@geomatys.com
- ✉️ pascal.broglie@geomatys.com

---

### 📑 List of tutorials 
- 🛰️ **OpenEO**
  - 📙 *OpenEO Jupyter Notebooks* :
    -  [Notebook with Http requests](./openEO/openeo_examind_http_example.ipynb)
    -  [Notebook with the OpenEO web editor](./openEO/openeo_examind_web_editor_example.ipynb)
    -  [Notebook with the python client](./openEO/openeo_examind_python_client_example.ipynb)
  - 📋 *Import data* -> [How to import my data in examind ?](./openEO/import_data.md)
  - 📂 *Resources* -> [Resources for OpenEO](./openEO/resources.md)


- ⚙️ **Run external process via CWL** *(Expose external processes through WPS, Processes, OpenEO using Common Workflow Language)*
  - 📋 *Pre-configuration of Examind if you use Podman Rootless* -> [Podman Rootless Conf](./ExternalProcesses/podman_rootless.md)
  - 📋 *Configuration of Examind (any cases)* -> [Examind Conf](./ExternalProcesses/examind_conf_cwl.md)
  - 📙 *Tutorial with dockerized NDVI process (Jupyter Notebook)* -> [Dockerized NDVI process tutorial with CWL](./ExternalProcesses/cwl_dockerized_ndvi.ipynb)
  - 📙 *Tutorial for STAC data downloader (Juypyter Notebook)* -> [Dockerized External Stac tutorial with CWL](./ExternalProcesses/cwl_stac_downloader.ipynb)
  - 📂 *Resources* -> [Resources for External Processes with CWL](./ExternalProcesses/resources.md)


- 🌌 **Galaxy Workflows through WPS**
  - 📙 *Example (Jupyter Notebook)* -> [Jupyter notebook with some WPS requests for Galaxy workflows](./GalaxyWPS/galaxy_workflows_wps.ipynb)
  - 📄 *Tutorial (PDF)* -> [Deploy and use Galaxy Workflows with Examind WPS](./GalaxyWPS/Deploy_and_Use_Galaxy_Workflow_With_Exa_WPS.pdf)
  - 📂 *Resources* -> [Resources for Galaxy Workflows through WPS](./GalaxyWPS/resources.md)


- ⏱️ **Time Data Aggregation**
  - 📄 *Tutorial (PDF)* -> [Importing geotiff time series data into Examind Community](./TimeDataAggregation/Importing_geotiff_time_series_data_into_Examind_Community.pdf)
  - 📼 *Video (Italy Soil data aggregation through S3)* -> [Access link](https://files.geomatys.com/s/jQi6aj2iXXDFkKG)
  - 📂 *Resources* -> [Resources for Time Data Aggregation](./TimeDataAggregation/resources.md)


- 🗺️ **Setup WMS, and visualisation in Terriamap**
  - 📋 *Import data* -> [How to import my data in examind ?](./wms-terriamap/import_data.md)
  - 📋 *Style data* -> [How to set a style to my data in examind ?](./wms-terriamap/style_data.md)
  - 📋 *WMS setup* -> [WMS setup example](./wms-terriamap/wms_setup.md)
  - 📋 *Terriamap configuration for Examind WMS* -> [Terriamap configuration example](./wms-terriamap/terriamap_config.md)
  - 🐱 *Terriamap setup example* -> [FairEase Terriamap](https://github.com/fair-ease/terria-config)

---

You also have in this repository :
- A 🐋 [docker-compose](./docker-compose.yml) file (for examind-community) (**you need to import the docker image before**)
- A 📜 [run.sh](./run.sh) script (to run examind)
- A 📜 [stop.sh](./stop.sh) script (to stop examind)