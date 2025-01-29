-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "http",
      -- add more arguments for adding more treesitter parsers
    },
    configs = {
      highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = true, -- DO NOT SET THIS
      },
    },
  },
}
