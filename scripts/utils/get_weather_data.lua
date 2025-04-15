local status_ok, json = pcall(require, "dkjson")
if not status_ok then
    print("ERROR: dkjson library could not be found!")
end

function Get_weather_data()
    local file = io.open("/tmp/weather.json")
    if not file then
        print("ERROR: Could not read cached file for weather data!")
        return nil
    end

    local content = file:read("*a")
    file:close()

    local objt, _, err = json.decode(content)

    if err then
        print("ERROR: Could not decode weather json data!", err)
    else 
        return objt
    end
end

