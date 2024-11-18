return {
  "folke/noice.nvim",
  opts = {
    presets = {
      bottom_search = true, -- Move a busca para a parte inferior
      command_palette = false, -- Opcional, ajusta o posicionamento da paleta de comandos
    },
    lsp = {
      progress = {
        enabled = true,
        view = "mini",
      },
      message = {
        view = "mini",
        align = "bottom"
      }
    },
    views = {
      cmdline = {
        position = {
          row = -2, -- Ajuste para colocar na parte inferior
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      mini = {
        position = "bottom", -- Coloca as notificações no rodapé
        size = {
          width = "100%",
          height = "auto",
        },
      },
    },
  },
}
