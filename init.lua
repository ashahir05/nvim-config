require("util.globals");
local readLuaModules = require("util.readLuaModules");
local requireAll = require("util.requireAll");

require("plugin_loader")

local core = readLuaModules(LUA_DIR, "core");
requireAll(core);
