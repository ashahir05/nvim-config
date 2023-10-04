return function (modules)
  local returns = {};
  
  for _, value in ipairs(modules) do
    returnedValue = require(value);
    if returnedValue ~= nil then
      table.insert(returns, returnedValue);
    end
  end
  
  return returns;
end
