local Remap = require("andy.remap")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>pf", "<cmd>Telescope find_files<CR>")

xnoremap("<leader>p", "\"_dP")

