local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local global_opts = {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local global_insert_opts = {
  mode = "i", -- INSERT mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local global_visual_opts = {
  mode = "v", -- VISUAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local global_visual_block_opts = {
  mode = "x", -- VISUAL BLOCK mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
}

local global_mappings = {
  ["<C-h>"] = { "<C-w>h", "Move to left window" },
  ["<C-l>"] = { "<C-w>l", "Move to right window" },
  ["<C-k>"] = { "<C-w>k", "Move to top window" },
  ["<C-j>"] = { "<C-w>j", "Move to bottom window" },
  
  ["<A-H>"] = { ":vertical resize -2<CR>", "Decrease size to the left" },
  ["<A-L>"] = { ":vertical resize +2<CR>", "Increase size to the right" },
  ["<A-K>"] = { ":resize -2<CR>", "Decrease size to the top" },
  ["<A-J>"] = { ":resize +2<CR>", "Increase size to the bottom" },
  
  ["H"] = { ":bnext<CR>", "Switch to next buffer" },
  ["L"] = { ":bprevious<CR>", "Switch to previous buffer" },
  
  ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "Move line below" },
  ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "Move line above" },
  
  ["<A-h>"] = {
    name = "Hop",
    c = { ":HopChar1<CR>", "Hop to a character" },
    C = { ":HopChar2<CR>", "Hop to a string of two characters" },
    l = { ":HopLineStart<CR>", "Hop to the start of a line" },
    L = { ":HopLineStart<CR>", "Hop to a line" },
    v = { ":HopVertical<CR>", "Hop vertically" },
    p = { ":HopPattern<CR>", "Hop using a pattern" },
    w = { ":HopWord<CR>", "Hop to a word" },
  },

  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
  ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
  ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
  ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show references" },
  ["gl"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open floating diagnostics" },
  ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
  ["<leader>l"] = {
    name = "LSP",
    f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format document" },
    i = { "<cmd>LspInfo<cr>", "LSP information" },
    I = { "<cmd>LspInstallInfo<cr>", "LSP Install information" },
    j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Go to next diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Go to previous diagnostic" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Set loclist" },
  },
}

local global_insert_mappings = {
  ["<A-h>"] = {
    name = "Hop",
    c = { "<cmd>HopChar1<CR>", "Hop to a character" },
    C = { "<cmd>HopChar2<CR>", "Hop to a string of two characters" },
    l = { "<cmd>HopLineStart<CR>", "Hop to the start of a line" },
    L = { "<cmd>HopLineStart<CR>", "Hop to a line" },
    v = { "<cmd>HopVertical<CR>", "Hop vertically" },
    p = { "<cmd>HopPattern<CR>", "Hop using a pattern" },
    w = { "<cmd>HopWord<CR>", "Hop to a word" },
  }
}

local global_visual_mappings = {
  ["<"] = { "<gv", "Reduce indent" },
  [">"] = { ">gv", "Increase indent" },
  
  ["<A-j>"] = { ":m .+1<CR>==", "Move line below" },
  ["<A-k>"] = { ":m .-2<CR>==", "Move line above" },
  
  p = { "_dP" },
}

local global_visual_block_mappings = {
  ["<"] = { "<gv", "Reduce indent" },
  [">"] = { ">gv", "Increase indent" },

  J = { ":move '>+1<CR>gv-gv", "Move line below" },
  K = { ":move '>-2<CR>gv-gv", "Move line above" },
  
  ["<A-j>"] = { ":move '>+1<CR>gv-gv", "Move line below" },
  ["<A-k>"] = { ":move '>-2<CR>gv-gv", "Move line above" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(global_mappings, global_opts)
which_key.register(global_insert_mappings, global_insert_opts)
which_key.register(global_visual_mappings, global_visual_opts)
which_key.register(global_visual_block_mappings, global_visual_block_opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
