---
title: How to import my data in Examind ?
---

1. In the Examind **Data** tab, click on **+ Add data**
2. Then click on **Cloud**, and select the protocol *(If you have put your data in the mount directory of examind, you can use the `Server file` protocol (this will be my case in this tutorial))*
3. Enter the access path to your data (depends on the protocol). In the case of a `Server file`, the path will be `file:///var/examind/<path_to_your_data_in_docker_mount>`
4. Click on **Load**, if everything is configured correctly, you should find your data at the bottom.
5. Select the file format (in my case `SIS: TIFF`, for geotiff files)

![Web ui - import data first step](images/import_data_first_step.png)

6. Click on **Next** (bottom of the page)
7. Select your resource, and click on **Next**
8. If you don't have a dataset, create one (set a name, a title, and click on **Next**)
9. In the **Metadata** part, you have to fill in all the mandatory fields (you can put in whatever you like, it won't change anything)
10. Click on **Finish**

You can find your dataset and associated data in the Examind **Data** tab.