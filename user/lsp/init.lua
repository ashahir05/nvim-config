local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.handlers").setup();
require("user.lsp.null-ls");

for server in readLuaModules(LUA_DIR, "plugins/plugins/lsp-servers") do
  local opts = require(server);
  opts.capabilities = require("user.lsp.handlers").capabilities;
  opts.on_attach = require("user.lsp.handlers").on_attach;
  lspconfig[server].setup(opts);
end
