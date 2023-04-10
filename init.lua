config_dir = vim.fn.stdpath("config");

require("user.options");
require("user.lazy");
require("user.lsp");

for filename in io.popen('ls -pUqAL ' .. '"' .. config_dir .. '/lua/user"' ):lines() do
   filename = filename:match"^(.*)%.lua$";
   if (filename and filename ~= "options" and filename ~= "plugins" and filename ~= "lazy") then
      require("user." .. filename);
   end
end
