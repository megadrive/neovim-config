local Remap = require("andy.remap")

local n = Remap.nnoremap
local v = Remap.vnoremap
local i = Remap.inoremap
local x = Remap.xnoremap

n("<leader>pv", "<cmd>Ex<CR>")

