return function (luaDirectory, module)
  local modulePath = luaDirectory .. "/" .. module;
  local children = io.popen("find " .. modulePath .. " -maxdepth 1 -name '*.lua'"):lines()
  local luaModules = {}
  
  for i in children do
    luaModules[#luaModules+1] = i:gsub(luaDirectory .. "/", ""):gsub("/", "."):sub(1, -5);
  end
  
  return luaModules
end
