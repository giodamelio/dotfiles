tonumber = tonumber
io = { popen: io.popen }
setmetatable = setmetatable
helpers = require("vicious.helpers")
json = require("json")
tablex = require("pl.tablex")

habitrpg = {}

-- {{{ Get the people in space
worker = (format, warg) ->
  -- Get the people in space
  url = "http://howmanypeopleareinspacerightnow.com/peopleinspace.json"
  f = io.popen("curl --connect-timeout 1 -fsm 3 #{helpers.shellquote(url)}")
  raw_data = f\read("*all")
  f\close()

  -- Parse the data
  data = json.decode(raw_data)

  data
-- }}}

return setmetatable(habitrpg, {
  __call: (_, ...) ->
    worker(...)
})

