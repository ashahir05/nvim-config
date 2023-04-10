-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim";
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  });
end

vim.opt.rtp:prepend(lazypath);

local opts = {
  performance = {
    reset_packpath = false, -- Don't remove Nix added packpaths
    rtp = {
      reset = false, -- Don't remove Nix added runtimepaths
    },
  },
};

local plugins = require("user.plugins");

require("lazy").setup(plugins, opts);
