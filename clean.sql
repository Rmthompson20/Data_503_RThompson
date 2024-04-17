INSERT INTO clean_weather VALUES
  ( SELECT 
  raw_json ->> 'dt' AS dt,
  raw_json ->> 'id' AS id,
  raw_json ->> 'cod' AS cod,
  raw_json -> 'sys' ->> 'id' AS sys_id,
  raw_json -> 'sys' ->> 'type' AS sys_type,
  raw_json -> 'sys' ->> 'sunset' AS sunset,
  raw_json -> 'sys' ->> 'country' AS country,
  raw_json -> 'sys' ->> 'sunrise' AS sunrise,
  raw_json ->> 'base' AS base,
  raw_json -> 'main' ->> 'temp' AS temp,
  raw_json -> 'main' ->> 'humidity' AS humidity,
  raw_json -> 'main' ->> 'pressure' AS pressure,
  raw_json -> 'main' ->> 'temp_max' AS temp_max,
  raw_json -> 'main' ->> 'temp_min' AS temp_min,
  raw_json -> 'main' ->> 'feels_like' AS feels_like,
  raw_json ->> 'name' AS name,
  raw_json -> 'wind' ->> 'deg' AS wind_deg,
  raw_json -> 'wind' ->> 'speed' AS wind_speed,
  raw_json -> 'coord' ->> 'lat' AS lat,
  raw_json -> 'coord' ->> 'lon' AS lon,
  raw_json -> 'clouds' ->> 'all' AS clouds_all,
  raw_json -> 'weather' -> 0 ->> 'id' AS weather_id,
  raw_json -> 'weather' -> 0 ->> 'icon' AS weather_icon,
  raw_json -> 'weather' -> 0 ->> 'main' AS weather_main,
  raw_json -> 'weather' -> 0 ->> 'description' AS weather_description,
  raw_json ->> 'timezone' AS timezone,
  raw_json ->> 'visibility' AS visibility 
FROM sa_weatheroutput )
; 

DELETE FROM sa_weatheroutput ; 
