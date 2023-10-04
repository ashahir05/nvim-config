return function (luaDirectory, module)
  local modulePath = luaDirectory .. "/" .. module;
  local children = io.popen("rg " .. modulePath .. " --files --type lua --max-depth=1"):lines()
  local luaModules = {}
  
  for i in children do
    luaModules[#luaModules+1] = i:gsub(luaDirectory .. "/", ""):gsub("/", "."):sub(1, -5);
  end
  
  return luaModules
end
