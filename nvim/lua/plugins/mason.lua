-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        -- add more arguments for adding more language servers
        "volar",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",
        -- add more arguments for adding more null-ls sources
        "eslint_d",
        "prettier",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
        "node2",
      },
      handlers = {
        function(source_name)
          local dap = require "dap"
          dap.adapters.node = {
            type = "executable",
            command = "node",
            args = { "--inspect-brk" }, -- Ativa o modo de depuração
          }

          -- Configurações para depurar uma aplicação Vue com TypeScript
          dap.configurations.typescript = {
            {
              name = "Launch Vue App",
              type = "node", -- Usando o depurador nativo do Node
              request = "launch",
              program = "${workspaceFolder}/node_modules/.bin/vite", -- Ou o seu script npm
              cwd = vim.fn.getcwd(),
              sourceMaps = true,
              protocol = "inspector",
              console = "integratedTerminal",
              runtimeExecutable = "node", -- Usando o Node.js para rodar
              args = { "--inspect" }, -- Inicia o Node.js em modo de depuração
            },
            {
              name = "Attach to Vue App",
              type = "node", -- Usando o depurador nativo do Node
              request = "attach",
              processId = require("dap.utils").pick_process,
              cwd = vim.fn.getcwd(),
              sourceMaps = true,
              protocol = "inspector",
            },
          }
        end,
      },
    },
  },
}
