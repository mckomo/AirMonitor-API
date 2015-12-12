# AirMonitor

AirMonitor is a web service that provides data about air pollution. 

## Endpoints

All endpoints are public, thus do not require any authentication. 

### GET /v1/stations

Get all measurement stations. 

```
[  
   {  
      "id":"4b1a8852-0eeb-4dbb-b8cb-4caf4b47ba8f",
      "code":"PL0012A",
      "name":"Kraków, Aleja Krasińskiego",
      "latitude":50.057678,
      "longitude":19.926189
   },
   ...
]
```

### GET /v1/stations/:id

Get the measurement station object with the latest measurements. 

```
{  
   "id":"4b1a8852-0eeb-4dbb-b8cb-4caf4b47ba8f",
   "code":"PL0012A",
   "name":"Kraków, Aleja Krasińskiego",
   "latitude":50.057678,
   "longitude":19.926189,
   "latest_measurements":[  
      {  
         "id":"2a1ecf09-9bd0-4a45-aefa-e4951bea6d4f",
         "value":77.0,
         "time":"2015-12-12T00:48:07.411Z",
         "source":"http://monitoring.krakow.pios.gov.pl",
         "norm":{  
            "value":200.0,
            "level":"permissible",
            "interval":"1 hour"
         } # Norm with the shortest interval
      },
      ...
   ],
   "created_at":"2015-12-12T00:41:44.366Z",
   "updated_at":"2015-12-12T00:41:44.366Z",
   "creator":{  
      "email":"mckomo@gmail.com",
   }
}
```

### GET /v1/stations/:id/measurements

Get station's measurements from last week. 

```
[  
   {  
      "id":"2a1ecf09-9bd0-4a45-aefa-e4951bea6d4f",
      "value":77.0,
      "time":"2015-12-12T00:48:07.411Z",
      "source":"http://monitoring.krakow.pios.gov.pl",
      "norm":{  
         "value":200.0,
         "level":"permissible",
         "interval":"1 hour"
      }, # Norm with the shortest interval
      "subject":{  
         "code":"NO2",
         "name":"Dwutlenek azotu",
         "unit":"µg/m\u003csup\u003e3\u003c/sup\u003e"
      },
      "creator":{  
         "email":"mckomo@gmail.com"
      }
   },
   ...
]
```

### GET /v1/measurements/:id

Get the complete measurement object. 

```
 {  
    "id":"2a1ecf09-9bd0-4a45-aefa-e4951bea6d4f",
    "value":77.0,
    "time":"2015-12-12T00:48:07.411Z",
    "source":"http://monitoring.krakow.pios.gov.pl",
    "created_at":"2015-12-12T00:48:07.446Z",
    "norms":[  
       {  
          "value":200.0,
          "interval":"1 hour",
          "level":"permissible",
          "created_at":"2015-12-12T00:41:44.396Z",
          "updated_at":"2015-12-12T00:41:44.396Z"
       },
       ...
    ],
    "subject":{  
       "code":"NO2",
       "name":"Dwutlenek azotu",
       "unit":"µg/m\u003csup\u003e3\u003c/sup\u003e"
    },
    "creator":{  
       "email":"mckomo@gmail.com"
    }
 }
```

### GET /v1/measurements/subjects

Get all measurement subjects.  

```
[  
   {  
      "code":"NO2",
      "name":"Dwutlenek azotu",
      "unit":"µg/m\u003csup\u003e3\u003c/sup\u003e",
      "created_at":"2015-12-12T00:41:44.378Z",
      "updated_at":"2015-12-12T00:41:44.378Z",
      "norms":[  
         {  
            "value":200.0,
            "interval":"1 hour",
            "level":"permissible",
            "created_at":"2015-12-12T00:41:44.396Z",
            "updated_at":"2015-12-12T00:41:44.396Z"
         },
         {  
            "value":400.0,
            "interval":"1 hour",
            "level":"alarming",
            "created_at":"2015-12-12T00:41:44.399Z",
            "updated_at":"2015-12-12T00:41:44.399Z"
         },
         {  
            "value":40.0,
            "interval":"1 year",
            "level":"permissible",
            "created_at":"2015-12-12T00:41:44.402Z",
            "updated_at":"2015-12-12T00:41:44.402Z"
         }
      ]
   },
   ...
]   
```

### GET /v1/measurements/norms

Get all measurement norms. 

```
[  
   {  
      "value":200.0,
      "interval":"1 hour",
      "level":"permissible", # Could be permissible, warning, alarming
      "created_at":"2015-12-12T00:41:44.396Z",
      "updated_at":"2015-12-12T00:41:44.396Z",
      "subject":{  
         "code":"NO2",
         "name":"Dwutlenek azotu",
         "unit":"µg/m\u003csup\u003e3\u003c/sup\u003e",
         "created_at":"2015-12-12T00:41:44.378Z",
         "updated_at":"2015-12-12T00:41:44.378Z"
      }
   },
   ...
]
```