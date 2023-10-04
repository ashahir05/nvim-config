local globals = require("config.globals")

for k, v in pairs(globals) do
  vim.g[k] = v
end
