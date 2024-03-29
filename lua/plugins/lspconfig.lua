return {
  "neovim/nvim-lspconfig",
  config = function ()
    local lspconfig = require("lspconfig");
    local cmp_nvim_lsp = require("cmp_nvim_lsp");
    local readLuaModules = require("util.readLuaModules");
    
    local handlers = {
      setup = function()
	      local signs = {
		      { name = "DiagnosticSignError", text = "" },
		      { name = "DiagnosticSignWarn", text = "" },
		      { name = "DiagnosticSignHint", text = "" },
		      { name = "DiagnosticSignInfo", text = "" },
	      }

	      for _, sign in ipairs(signs) do
		      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	      end

	      local config = {
		      virtual_text = false, -- disable virtual text
		      signs = {
			      active = signs, -- show signs
		      },
		      update_in_insert = true,
		      underline = true,
		      severity_sort = true,
		      float = {
			      focusable = true,
			      style = "minimal",
			      border = "rounded",
			      source = "always",
			      header = "",
			      prefix = "",
		      },
	      }

	      vim.diagnostic.config(config)

	      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		      border = "rounded",
	      })

	      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		      border = "rounded",
	      })
      end,
      on_attach = function(client, bufnr)
      end
    };
    
    handlers.capabilities = vim.lsp.protocol.make_client_capabilities();
    handlers.capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true
          }
        }
      }
    };
    handlers.capabilities = cmp_nvim_lsp.default_capabilities(handlers.capabilities);
    
    handlers.setup();
  end
}
