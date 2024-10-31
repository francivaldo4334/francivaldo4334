-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
-- require('lspconfig').biome.setup {
--     cmd = { "/home/higia/.local/share/nvim/mason/bin/biome", "lsp-proxy" },
--     autostart = true,
--     filetypes = {
--         "javascript", "javascriptreact", "json", "jsonc",
--         "typescript", "typescriptreact", "astro", "svelte", "vue", "css"
--     },
--     root_dir = require('lspconfig.util').root_pattern("package.json", "tsconfig.json", ".git"),
--     on_attach = function(client, bufnr)
--         -- Configurações de mapeamento podem ser adicionadas aqui
--     end,
-- }

-- require'lspconfig'.kotlin_language_server.setup{
--     cmd = { "nc", "localhost", "5000" },
--     filetypes = { "kotlin" },
--     -- root_dir = require("lspconfig.util").root_pattern("build.gradle.kts", ".git"),
--     root_dir = function(fname)
--         return vim.fn.fnamemodify(fname, ':h:h')
--     end,
--     settings = {
--         kotlin = {
--             auto_import = true,
--             completion = {
--                 insertSpaces = true,
--                 tabSize = 4
--             },
--             diagnostics = {
--                 enable = true,
--                 showUnused = false
--             }
--         }
--     },
--     on_attach = function(client, bufnr)
--         -- Your custom on_attach code here
--     end
-- }
-- vim.cmd("colorscheme astrolight")
