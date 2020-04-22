# -*- coding: utf-8 -*-
"""
Created on Sat Mar 8 19:00:49 2020

@author: Shubham Balyan
"""

import pandas as pd
import requests 
import datetime

# Compute to_date from the specified from_date (7 days in a week)
def format_date (date_obj):
   if date_obj.month < 10:
       month = "0" + str(date_obj.month)
   else:
       month = str(date_obj.month)

   if date_obj.day < 10:
       day = "0" + str(date_obj.day)
   else:
       day = str(date_obj.day)
   return day + "." + month + "." + str(date_obj.year)

fdate = datetime.datetime(2020, 2, 24) # From Date Input in format: (YYYY, M, D)
from_date = format_date(fdate.date())

tdate = (fdate + datetime.timedelta(days = 6)).date()
to_date = format_date(tdate)

# Building : Specific Building
# Medium : Electricity
medium = 'strom'
url1 = "https://some-url/104?medium="+medium+"&from="+from_date+"&to="+to_date+"&type=tagesverbrauch"
electricity_data = requests.get(url1).json()

# Medium : Water
medium = 'wasser'
url2 = "https://some-url/104?medium="+medium+"&from="+from_date+"&to="+to_date+"&type=tagesverbrauch"
water_data = requests.get(url2).json()

# Medium : Warmth Electricity
medium = 'waerme'
url3 = "https://some-url/104?medium="+medium+"&from="+from_date+"&to="+to_date+"&type=tagesverbrauch"
warmth_data = requests.get(url3).json()

date_list = []
electricity_list = []
water_list = []
warmth_list = []

for i in range(7):
    date_list.append(datetime.datetime.fromtimestamp(electricity_data['result']['series'][0]['data'][i][0]/1000.0).date())
    electricity_list.append(round((electricity_data['result']['series'][0]['data'][i][1]),2))
    water_list.append(round((water_data['result']['series'][0]['data'][i][1]),3))
    warmth_list.append(round((warmth_data['result']['series'][0]['data'][i][1]),3))

# Dataframe 'df' will contain the required data for a period of week
df = pd.DataFrame(list(zip(date_list, electricity_list, water_list, warmth_list)), 
               columns = ['Date', 'Electricity (in kWh)', 'Water (in m³)', 'Warmth (in kWh)'])
print(df)

"""
Sample Output: 
    
         Date  Electricity (in kWh)  Water (in m³)  Warmth (in kWh)
0  2020-02-24                 410.1          0.289           4351.0
1  2020-02-25                 820.6          1.483           4972.0
2  2020-02-26                 861.9          2.029           6862.0
3  2020-02-27                1018.2          2.667           7406.0
4  2020-02-28                 870.2          1.789           6752.0
5  2020-02-29                 788.6          1.198           5732.0
6  2020-03-01                 839.3          0.948           6488.0
"""