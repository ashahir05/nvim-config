local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.handlers").setup();
require("user.lsp.null-ls");

for filename in io.popen('ls -pUqAL ' .. '"' .. config_dir .. '/lua/user/lsp/servers"' ):lines() do
  local server = filename:match"^(.*)%.lua$";
  local status_ok, opts = pcall(require, "user.lsp.servers." .. server)
  if status_ok then
    opts.capabilities = require("user.lsp.handlers").capabilities;
    opts.on_attach = require("user.lsp.handlers").on_attach;
    lspconfig[server].setup(opts);
  end
end
