---
title: How to import my data in Examind ?
---

1. In the Examind **Data** tab, click on **+ Add data**
2. You can select here the way to import your data : from a **local file**, from a **database**, or using a **protocol** (In this tutorial, we will use a **Protocol**)
3. Click on **Cloud**, and select the protocol *(If you have put your data in the mount directory of examind, you can use the `Server file` protocol (this will be my case in this tutorial))*

---

- For example, if you choose S3 :

![Web ui - import data s3](images/add-data-step1-s3.png)

**/!\ Info** :
  - You can use AWS S3 or Specific S3 instance (with minio for example)
  - In the case you want to use **AWS S3** :
    - Specify the access key and secret key
    - Specify the region
    - Set the bucket name then the path to your data (s3://bucket/path)
    - Don't set Custom Host URL and Custom Port
  - In the case you want to use a **standalone S3** :
    - Specify the access key and secret key (optional)
    - Specify the Custom Host URL (http(s)://host)
    - Specify the Custom Port (optional, by default if http : 80, if https : 443)
    - Set the bucket name then the path to your data (s3://bucket/path)
    - Don't set the region

**/!\ Limitations :**
  - As I write these lines, we have some limitations / bugs in the S3 systems
  - NetCDF files are not supported in S3 (you need to use another protocol, Server file, or upload your file)
  - If you want to use a public S3, without credentials, you have to set somthing (could be anything) in "Access Key" (even if it's not used)
  - To use the s3 protocol, you need to have your data in a subfolder and not at the root of the bucket (s3://bucket/folder/test.tif and not s3://bucket/test.tif)

---

- If you choose Server file :

![Web ui - import data server file](images/add-data-step1-serverfile.png)

---

**Note for all protocols :**
- If "Remote reading" is checked, the data will be read directly from the source (no copy in the examind data directory)
- If "Remote reading" is not checked, the data will be copied in the examind data directory

For S3 and server file, we recommend to use "Remote reading" to avoid data duplication.

---

4. Enter the access path to your data (depends on the protocol).
In the case of a `Server file`, the path will be `file:///var/examind/<path_to_your_data_in_docker_mount>`
5. Click on **Load**, if everything is configured correctly, you should find your data at the bottom.
6. Select the file format (in my case `SIS: TIFF`, for geotiff files, `SIS: NETCDF` for netcdf files)
7. Click on **Next** (bottom of the page)
8. Select your resource, and click on **Next**

![Web ui - import data second step](images/add-data-step2-datavisualisation.png)

9. If you don't have a dataset, create one (set a name, a title, and click on **Next**)

![Web ui - import data third step select dataset](images/add-data-step3-selectdataset.png)

Select a dataset **OR** Create a new one

![Web ui - import data third step create dataset](images/add-data-step3-createdataset.png)

10. In the **Metadata** part, you can set some values if you want, but you also can skip with the button Next or finish at the bottom of the page.

![Web ui - import data fourth step metadata](images/add-data-step4-fillthemetadata.png)

![Web ui - import data fourth step buttons](images/add-data-step4-buttons.png)

11. Click on **Finish**, or on **Next** if you want to set a style to your data => [How to set a style to my data in examind ?](./style_data.md)

You can find your dataset and associated data in the Examind **Data** tab.