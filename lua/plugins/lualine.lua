return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    
    local hide_in_width = function()
	    return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
	    "diagnostics",
	    sources = { "nvim_diagnostic" },
	    sections = { "error", "warn" },
	    symbols = { error = " ", warn = " " },
	    always_visible = true,
    }

    local diff = {
	    "diff",
	    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = hide_in_width
    }

    local filetype = {
	    "filetype",
	    icons_enabled = false,
	    icon = nil,
    }

    local branch = {
	    "branch",
	    icons_enabled = true,
	    icon = "",
    }

    local spaces = function()
	    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end

    lualine.setup({
	    options = {
		    icons_enabled = true,
		    theme = "auto",
		    component_separators = { left = "", right = "" },
		    section_separators = { left = "", right = "" },
		    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		    always_divide_middle = true,
	    },
	    sections = {
		    lualine_a = { "mode" },
		    lualine_b = { branch, diagnostics },
		    lualine_c = { "lsp_progress" },
		    -- lualine_x = { "encoding", "fileformat", "filetype" },
		    lualine_x = { diff, spaces, "encoding", filetype },
		    lualine_y = { "location" },
		    lualine_z = { "progress" },
	    },
	    inactive_sections = {
		    lualine_a = {},
		    lualine_b = {},
		    lualine_c = { "filename" },
		    lualine_x = { "location" },
		    lualine_y = {},
		    lualine_z = {},
	    },
	    tabline = {},
	    extensions = {},
    })
  end
}
