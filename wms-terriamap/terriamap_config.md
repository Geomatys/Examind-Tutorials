---
title: Use Terriamap with Examind WMS
---

1. Get terriamap, example here : [FairEase Terriamap](https://github.com/fair-ease/terria-config)
2. In the `config.json` of terriamap, you will have to all the sources of your catalog.
3. For Examind, here is an example of configuration to add :

If you want to create groups with specific layers of a WMS
```json
{
  "type": "group",
  "isOpen": true,
  "name": "CMEMS Chlorophyl - Examind",
  "members": [
    {
      "type": "group",
      "name": "Chlorophyl",
      "isOpen": true,
      "members": [
        {
          "type": "wms",
          "name": "CHL_L3",
          "url": "https://examind.eoscfe.mesocentre.uca.fr/examind/WS/wms/CMEMS_WMS?service=WMS&version=1.3.0&request=GetCapabilities",
          "layers": "CHL_L3"
        },
        {
          "type": "wms",
          "name": "CHL_uncertainly_L3",
          "url": "https://examind.eoscfe.mesocentre.uca.fr/examind/WS/wms/CMEMS_WMS?service=WMS&version=1.3.0&request=GetCapabilities",
          "layers": "CHL_uncertainly_L3",
          "availableStyles": [
            {
              "layerName": "CHL_uncertainly_L3",
              "styles": [
                {
                  "name": "CHL_uncertainty-sld",
                  "title": "CHL_uncertainty-sld",
                  "abstract": ""
                },
                {
                  "name": "CHL_uncertainty-sld-bis",
                  "title": "CHL_uncertainty-sld-bis",
                  "abstract": ""
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

*Note : If you want to add styles to your layers, follow [this tutorial](./style_data.md)*

**OR** 

If you want to have all layers of a WMS

```json
{
  "type": "wms-group",
  "name": "CMEMS WMS (All) - Examind",
  "url": "https://examind.eoscfe.mesocentre.uca.fr/examind/WS/wms/CMEMS_WMS",
  "id": "cmemswmsexamind"
}
```

**Terriamap documentation for WMS**
- https://docs.terria.io/guide/connecting-to-data/catalog-type-details/wms-group/
- https://docs.terria.io/guide/connecting-to-data/catalog-type-details/wms/#example-usage

![terriamap.png](images/terriamap.png)

![terriamap-layers-style.png](images/terriamap-layers-style.png)

---

**Note**
You also can use this server to test your services :
https://terriamap.eoscfe.mesocentre.uca.fr/

You will not have a config.json to edit, but you can test services using "My Data"