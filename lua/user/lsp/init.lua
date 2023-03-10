local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

local servers = {
  "html",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "tsserver",
  "vimls",
  "rnix",
}

for _, server in ipairs(servers) do
  local status_ok, opts = pcall(require, "user.lsp.settings." .. server)
  if status_ok then
    opts.capabilities = require("user.lsp.handlers").capabilities
    opts.on_attach = require("user.lsp.handlers").on_attach
    lspconfig[server].setup(opts)
  end
end
