# Program that outputs selected fields from the www.openweathermap.org API
# Only testing through sample calls
# For the sake of this assignment, I am hardcoding the api token, but this can be changed if necessary

import json
import requests


api_url_base = 'https://api.openweathermap.org/data/2.5/find?q=' # sets up base url for api call
api_token = '4ea1e6f21be4f571cfaa30f37c9dbd49' # can update this based on your token, if necessary

# prompts user to input city
print ("Which city?")
city = raw_input()
print ("Which country? Please enter country code. This is optional but will improve accuracy.") # API calls with country allows for more accuracy
country = raw_input()
param = "{}" + city + "," + country + "&appid=" + api_token


# defines how to retrieve URL and deserialize json
def get_weather_info():
    api_url = param.format(api_url_base)
    response = requests.get(api_url)
    if response.status_code == 200:
        return json.loads(response.content.decode('utf-8'))
    else:
        return None

# creates weather_info dictionary
weather_info = get_weather_info();

if weather_info is not None:
  city_name = weather_info["list"][0]["name"]
  longitude = weather_info["list"][0]["coord"]["lon"]
  latitude = weather_info["list"][0]["coord"]["lat"]
  wind_speed = weather_info["list"][0]["wind"]["speed"]
  weather_desc = weather_info["list"][0]["weather"][0]["description"] # weather is a list in the json response, so need to convert to dict
  max_temp = weather_info["list"][0]["main"]["temp_max"]
  min_temp = weather_info["list"][0]["main"]["temp_min"]

  print ("Location/City Name: " + city_name)
  print ("Longitude: " + str(longitude))
  print ("Latitude " + str(latitude))
  print ("Wind Speed: " + str(wind_speed))
  print ("Weather Description: " + weather_desc)
  print ("Maximum Temperature: " + str(max_temp))
  print ("Minimum Temperature: " + str(min_temp))
else:
  print "[!] Request Failed"