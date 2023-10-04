return function (seperator)
  local result = {};
  for i in self:gmatch("([^" .. seperator .. "]+)") do
    table.insert(result, i)
  end
  return result
end
