local whichKey = require("which-key")

local keybindings = require("config.keybindings")
local pluginKeybindings = require("plugin_loader.pluginSetup")["pluginKeys"];

whichKey.register(keybindings);
whichKey.register(pluginKeybindings);
