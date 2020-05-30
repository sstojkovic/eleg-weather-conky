#!/bin/sh

api_key=<YOUR_API_KEY>
city_id=<YOUR_CITY_ID>
url="api.openweathermap.org/data/2.5/weather?id=${city_id}&appid=${api_key}"
curl ${url} -s -o ~/.cache/eleg-weather.json