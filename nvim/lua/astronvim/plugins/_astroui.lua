return {
  "AstroNvim/astroui",
  lazy = true,
  ---@type AstroUIOpts
  opts = {
    colorscheme = "astrotheme",
    icons = {
      ActiveLSP = "",
      ActiveTS = "",
      ArrowLeft = "",
      ArrowRight = "",
      Bookmarks = "",
      BufferClose = "󰅖",
      DapBreakpoint = "",
      DapBreakpointCondition = "",
      DapBreakpointRejected = "",
      DapLogPoint = "󰛿",
      DapStopped = "󰁕",
      Debugger = "",
      DefaultFile = "󰈙",
      Diagnostic = "󰒡",
      DiagnosticError = "",
      DiagnosticHint = "󰌵",
      DiagnosticInfo = "󰋼",
      DiagnosticWarn = "",
      Ellipsis = "…",
      Environment = "",
      FileNew = "",
      FileModified = "",
      FileReadOnly = "",
      FoldClosed = "",
      FoldOpened = "",
      FoldSeparator = " ",
      FolderClosed = "",
      FolderEmpty = "",
      FolderOpen = "",
      Git = "󰊢",
      GitAdd = "",
      GitBranch = "",
      GitChange = "",
      GitConflict = "",
      GitDelete = "",
      GitIgnored = "◌",
      GitRenamed = "➜",
      GitSign = "▎",
      GitStaged = "✓",
      GitUnstaged = "✗",
      GitUntracked = "★",
      List = "",
      LSPLoading1 = "",
      LSPLoading2 = "󰀚",
      LSPLoading3 = "",
      MacroRecording = "",
      Package = "󰏖",
      Paste = "󰅌",
      Refresh = "",
      Search = "",
      Selected = "❯",
      Session = "󱂬",
      Sort = "󰒺",
      Spellcheck = "󰓆",
      Tab = "󰓩",
      TabClose = "󰅙",
      Terminal = "",
      Window = "",
      WordFile = "󰈭",
    },
    text_icons = {
      ActiveLSP = "LSP:",
      ArrowLeft = "<",
      ArrowRight = ">",
      BufferClose = "x",
      DapBreakpoint = "B",
      DapBreakpointCondition = "C",
      DapBreakpointRejected = "R",
      DapLogPoint = "L",
      DapStopped = ">",
      DefaultFile = "[F]",
      DiagnosticError = "X",
      DiagnosticHint = "?",
      DiagnosticInfo = "i",
      DiagnosticWarn = "!",
      Ellipsis = "...",
      Environment = "Env:",
      FileModified = "*",
      FileReadOnly = "[lock]",
      FoldClosed = "+",
      FoldOpened = "-",
      FoldSeparator = " ",
      FolderClosed = "[D]",
      FolderEmpty = "[E]",
      FolderOpen = "[O]",
      GitAdd = "[+]",
      GitChange = "[/]",
      GitConflict = "[!]",
      GitDelete = "[-]",
      GitIgnored = "[I]",
      GitRenamed = "[R]",
      GitSign = "|",
      GitStaged = "[S]",
      GitUnstaged = "[U]",
      GitUntracked = "[?]",
      MacroRecording = "Recording:",
      Paste = "[PASTE]",
      Search = "?",
      Selected = "*",
      Spellcheck = "[SPELL]",
      TabClose = "X",
    },
    lazygit = {
      theme_path = vim.fs.normalize(vim.fn.stdpath "cache" .. "/lazygit-theme.yml"),
      theme = {
        [241] = { fg = "Special" },
        activeBorderColor = { fg = "MatchParen", bold = true },
        cherryPickedCommitBgColor = { fg = "Identifier" },
        cherryPickedCommitFgColor = { fg = "Function" },
        defaultFgColor = { fg = "Normal" },
        inactiveBorderColor = { fg = "FloatBorder" },
        optionsTextColor = { fg = "Function" },
        searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
        unstagedChangesColor = { fg = "DiagnosticError" },
      },
    },
  },
}
