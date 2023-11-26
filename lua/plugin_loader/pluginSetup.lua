local readLuaModules = require("util.readLuaModules")
local requireAll = require("util.requireAll")

local plugins = requireAll(readLuaModules(LUA_DIR, "plugins"));

local pluginKeys = {};

-- Load "keys" using whichkey instead of lazy
for _, plugin in ipairs(plugins) do
  if plugin["keys"] then
    for key, binding in pairs(plugin["keys"]) do
      pluginKeys[key] = binding;
    end
    plugins[_]["keys"] = nil
  end
end

return {
  plugins = plugins,
  pluginKeys = pluginKeys
}
