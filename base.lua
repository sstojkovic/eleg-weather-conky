script = [[
  ${color #{color}}
  ${goto 90}${voffset 25}${font adele:size=25} ${time %A, %d %B}
  \
  # --- Separator line --- #
  ${goto 90}${voffset -}${font LG Weather_Z:size=100}${time %H:%M}${image ./icons/#{theme}/line.png -p 360,30 -s 3x189}
  \
  ${offset 370}${voffset -183}${font ADELE:size=22}
  \
  # --- Weather --- #
  ###################
  \
  # --- WOEID (Location id) --- # 
  ${execi 300 ./scripts/weather.sh}\
  \
  # --- Temperature --- #
  #######################
  \
  ${font ADELE :size=30}${offset 260}${voffset 10}${execi 300 ./scripts/kelvin2celsius.sh $(cat ~/.cache/eleg-weather.json | jq '.main.temp')}°${font ADELE :size=15}C${font ADELE :size=30}${voffset -20}  |
  \
  # --- Weather icon --- #
  ########################
  \
  ${execi 300 ./scripts/weather-icon.sh #{theme} $(cat ~/.cache/eleg-weather.json | jq -r '.weather[0].icon')}${image ~/.cache/eleg-weather-icon.png -p 410,30 -s 100x100}
  \
  # --- Textual condition (e.g. Partly cloudy) --- #
  ##################################################
  \
  ${font Roboto Light:size=18}${offset 380}${voffset -82}${execi 300 cat ~/.cache/eleg-weather.json | jq -r '.weather[0].main'}
  \
  # --- Icon - high temperature --- #
  ###################################
  \
  ${image ./icons/#{theme}/arrow-up.png -p 375,190 -s 12x12}
  \
  # --- High temperature --- #
  ############################
  \
  ${font Roboto Light:size=12}${offset 330}${voffset -25}${execi 300 ./scripts/kelvin2celsius.sh $(cat ~/.cache/eleg-weather.json | jq '.main.temp_max')}°
  \
  # --- Icon - low temperature icon --- #
  #######################################
  \
  ${image ./icons/#{theme}/arrow-down.png -p 422,190 -s 12x12}
  \
  # --- Low temperature --- #
  ###########################
  \
  ${font Roboto Light:size=12}${offset 400}${voffset -44}${execi 300 ./scripts/kelvin2celsius.sh $(cat ~/.cache/eleg-weather.json | jq '.main.temp_min')}°
  \
  # --- Icon - map marker --- #
  #############################
  \
  ${image ./icons/#{theme}/map-marker.png -p 463,187 -s 16x16}
  \
  # --- Location name (city) --- #
  ############################################
  \
  ${font Roboto Light:size=12}${offset 440}${voffset -45}${execi 300 cat ~/.cache/eleg-weather.json | jq -r '.name'}
  
  ${goto 285}${voffset -35}${font adele:bold:size=25}${time %p}
]];

local function interp (s, t)
  return s:gsub('(#%b{})', function (w)
      return t[w:sub(3, -2)] or w
  end)
end

function load(theme, color)
  return interp(script, {
    theme = theme,
    color = color
  })
end
