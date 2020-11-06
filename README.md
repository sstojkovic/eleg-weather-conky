# ElegWeather Conky

Simple widget which displays time and basic weather info.

Created because yahoo discontinued their weather api services and many conky weather widgets are not working because of it.

![Preview](preview.png)

# Getting Started

## Requirements

- Installed conky
- Installed curl command-line tool
- Installed jq (for parsing json)
- Installed fonts located in `fonts/` folder
- Free API key (you can get it once you register on http://openweathermap.org/)
- City ID (also can be found on already mentioned website, there is a search box on homepage)


## Configuration
Once you get api key and city id replace lines: 
```bash
api_key=<YOUR_API_KEY>
city_id=<YOUR_CITY_ID>
``` 
in 
```
scripts/weather.sh
```

# Acknowledgements

Based on: [Flair Weather](https://www.deviantart.com/speedracker/art/Flair-Weather-Conky-Made-for-Conky-Manager-510130311)

Icons: Found on IconStore; Created by Piotr Grzeszczyk - http://pogstudio.pl/ 
