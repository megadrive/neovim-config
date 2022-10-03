local Remap = require("andy.remap")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

nnoremap("<leader>pv", "<cmd>NvimTreeFocus<CR>")
nnoremap("<leader>pc", "<cmd>NvimTreeClose<CR>")
nnoremap("<leader>pf", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>pb", "<cmd>Telescope buffers<CR>")

xnoremap("<leader>p", "\"_dP")

