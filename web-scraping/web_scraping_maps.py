# -*- coding: utf-8 -*-
"""
Created on Tue Mar 9 17:05:31 2020

@author: Shubham Balyan
"""

import pandas as pd
import requests

# Coordinates of the map visible on the screen
request_coordinates = {'filterByBounds':{'northEastLat':'53.52918926698462','northEastLng':'-5.442481406497106','southWestLat':'53.11870224260763','southWestLng':'-7.048926793502912'}}
url = "https://some-url/findSitesInBounds"
response_data = requests.post(url, json = request_coordinates).json()

# Count of total stations visible on the map
total_records = len(response_data['data'][1])

data_list = []
for i in range(total_records):
    service_id = response_data['data'][1][i]['serviceProviderLinkedCheckerId']
    address = response_data['data'][1][i]['dn']
    status = response_data['data'][1][i]['ss']
    charge_type = response_data['data'][1][i]['scs']
    data_list.append([service_id, address, charge_type, status])

# Dataframe 'df' will contain the status of the charging station: Available, Charging, Occupied or Unknown
df = pd.DataFrame(data_list, 
               columns = ['Service Provider ID', 'Address', 'Charging Type', 'Status'])
print(df)

"""
Sample Output: 

     Service Provider ID  ...     Status
0                      7  ...  AVAILABLE
1                     13  ...  AVAILABLE
2                     35  ...  AVAILABLE
3                     37  ...  AVAILABLE
4                     45  ...  AVAILABLE
..                   ...  ...        ...
122                  305  ...  AVAILABLE
123                  241  ...  AVAILABLE
124                  350  ...  AVAILABLE
125                  373  ...  AVAILABLE
126                  382  ...  AVAILABLE
"""