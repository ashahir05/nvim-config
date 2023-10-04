return {
  "mhartington/formatter.nvim",
  config = function ()
    local formatter = require("formatter");
    -- local formatterUtil = require("formatter.util");
    local readLuaModules = require("util.readLuaModules");
    
    local filetypes = {};
    
    for _, lang in ipairs(readLuaModules(LUA_DIR, "plugins/lang")) do
      local opts = require(lang).formatter;
      local filetype = lang:match(".([^.]+)$");
      
      if type(opts) == "string" then
        filetypes[filetype] = require("formatter.filetypes." .. filetype).opts;
      else
        if filetype == "any" then
          filetypes["*"] = opts;
        else
          filetypes[filetype] = opts;
        end
      end
    end

    formatter.setup({
      filetype = filetypes
    });
  end
}
