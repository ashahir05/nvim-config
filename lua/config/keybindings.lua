return {
  ["<leader>"] = {
    ["a"] = { "<cmd>Alpha<cr>", "Alpha", mode = { "n" } },
    ["b"] = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Buffers",
      mode = { "n" } 
    },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer", mode = { "n" } },
    ["w"] = { "<cmd>w!<CR>", "Save", mode = { "n" } },
    ["q"] = { "<cmd>q!<CR>", "Quit", mode = { "n" } },
    ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer", mode = { "n" } },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight", mode = { "n" } },
    ["f"] = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find files",
      mode = { "n" } 
    },
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text", mode = { "n" } },
    ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects", mode = { "n" } },

    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile", mode = { "n" } },
      i = { "<cmd>PackerInstall<cr>", "Install", mode = { "n" } },
      s = { "<cmd>PackerSync<cr>", "Sync", mode = { "n" } },
      S = { "<cmd>PackerStatus<cr>", "Status", mode = { "n" } },
      u = { "<cmd>PackerUpdate<cr>", "Update", mode = { "n" } },
    },

    g = {
      name = "Git",
      g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit", mode = { "n" } },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk", mode = { "n" } },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk", mode = { "n" } },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame", mode = { "n" } },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk", mode = { "n" } },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk", mode = { "n" } },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer", mode = { "n" } },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk", mode = { "n" } },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file", mode = { "n" } },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch", mode = { "n" } },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit", mode = { "n" } },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Diff",
        mode = { "n" } 
      },
    },

    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = { "n" } },
      d = {
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        "Document Diagnostics",
        mode = { "n" } 
      },
      w = {
        "<cmd>Telescope diagnostics<cr>",
        "Workspace Diagnostics",
        mode = { "n" } 
      },
      f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format", mode = { "n" } },
      i = { "<cmd>LspInfo<cr>", "Info", mode = { "n" } },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info", mode = { "n" } },
      j = {
        "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
        "Next Diagnostic",
        mode = { "n" } 
      },
      k = {
        "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
        "Prev Diagnostic",
        mode = { "n" } 
      },
      a = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action", mode = { "n" } },
      q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix", mode = { "n" } },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename", mode = { "n" } },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols", mode = { "n" } },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
        mode = { "n" } 
      },
    },
    s = {
      name = "Search",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch", mode = { "n" } },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme", mode = { "n" } },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help", mode = { "n" } },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages", mode = { "n" } },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", mode = { "n" } },
      R = { "<cmd>Telescope registers<cr>", "Registers", mode = { "n" } },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps", mode = { "n" } },
      C = { "<cmd>Telescope commands<cr>", "Commands", mode = { "n" } },
    },

    t = {
      name = "Terminal",
      n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node", mode = { "n" } },
      u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU", mode = { "n" } },
      t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop", mode = { "n" } },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python", mode = { "n" } },
      f = { "<cmd>ToggleTerm direction=float<cr>", "Float", mode = { "n" } },
      h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal", mode = { "n" } },
      v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical", mode = { "n" } },
    },
  },
  ["j"] = { "gj", "Move down visually"},
  ["k"] = { "gk", "Move up visually"},
  ["<Down>"] = { "gj", "Move down visually"},
  ["<Up>"] = { "gk", "Move up visually"},
  [ "H" ] = { "^", "Go to start of line", mode = { "n" } },
  [ "L" ] = { "$", "Go to end of line", mode = { "n" } },
  ["<C-h>"] = { "<C-w>h", "Move to left window", mode = { "n" } },
  ["<C-l>"] = { "<C-w>l", "Move to right window", mode = { "n" } },
  ["<C-k>"] = { "<C-w>k", "Move to top window", mode = { "n" } },
  ["<C-j>"] = { "<C-w>j", "Move to bottom window", mode = { "n" } },
  
  ["<A-H>"] = { ":vertical resize -2<CR>", "Decrease size to the left", mode = { "n" } },
  ["<A-L>"] = { ":vertical resize +2<CR>", "Increase size to the right", mode = { "n" } },
  ["<A-K>"] = { ":resize -2<CR>", "Decrease size to the top", mode = { "n" } },
  ["<A-J>"] = { ":resize +2<CR>", "Increase size to the bottom", mode = { "n" } },
  
  ["<TAB>"] = { ":bnext<CR>", "Switch to next buffer", mode = { "n" } },
  ["<S-TAB>"] = { ":bprevious<CR>", "Switch to previous buffer", mode = { "n" } },
  
  ["<A-j>"] = { ":m .+1<CR>", "Move line below", mode = { "n" } },
  ["<A-k>"] = { ":m .-2<CR>", "Move line above", mode = { "n" } },
  
  ["<A-s>"] = {
    name = "Hop",
    c = { ":HopChar1<CR>", "Hop to a character", mode = { "n" } },
    C = { ":HopChar2<CR>", "Hop to a string of two characters", mode = { "n" } },
    l = { ":HopLineStart<CR>", "Hop to the start of a line", mode = { "n" } },
    L = { ":HopLineStart<CR>", "Hop to a line", mode = { "n" } },
    v = { ":HopVertical<CR>", "Hop vertically", mode = { "n" } },
    p = { ":HopPattern<CR>", "Hop using a pattern", mode = { "n" } },
    w = { ":HopWord<CR>", "Hop to a word", mode = { "n" } },
  },

  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration", mode = { "n" } },
  ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition", mode = { "n" } },
  ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation", mode = { "n" } },
  ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show references", mode = { "n" } },
  ["gl"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open floating diagnostics", mode = { "n" } },
  ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover", mode = { "n" } },
  
  ["<A-s>"] = {
    name = "Hop",
    c = { "<cmd>HopChar1<CR>", "Hop to a character", mode = { "i" } },
    C = { "<cmd>HopChar2<CR>", "Hop to a string of two characters", mode = { "i" } },
    l = { "<cmd>HopLineStart<CR>", "Hop to the start of a line", mode = { "i" } },
    L = { "<cmd>HopLineStart<CR>", "Hop to a line", mode = { "i" } },
    v = { "<cmd>HopVertical<CR>", "Hop vertically", mode = { "i" } },
    p = { "<cmd>HopPattern<CR>", "Hop using a pattern", mode = { "i" } },
    w = { "<cmd>HopWord<CR>", "Hop to a word", mode = { "i" } },
  },

  ["<"] = { "<gv", "Reduce indent", mode = { "v" } },
  [">"] = { ">gv", "Increase indent", mode = { "v" } },
  
  ["<A-j>"] = { ":m .+1<CR>==", "Move line below", mode = { "v" } },
  ["<A-k>"] = { ":m .-2<CR>==", "Move line above", mode = { "v" } },
  
  p = { "_dP", mode = { "v" } },

  ["<"] = { "<gv", "Reduce indent", mode = { "v" } },
  [">"] = { ">gv", "Increase indent", mode = { "v" } },

  J = { ":move '>+1<CR>gv-gv", "Move line below", mode = { "v" } },
  K = { ":move '>-2<CR>gv-gv", "Move line above", mode = { "v" } },
  
  ["<A-j>"] = { ":move '>+1<CR>gv-gv", "Move line below", mode = { "v" } },
  ["<A-k>"] = { ":move '>-2<CR>gv-gv", "Move line above", mode = { "v" } },

}
