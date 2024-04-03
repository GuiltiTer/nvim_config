---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = require("user.env").colorscheme,
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    status = {
      colors = function(hl)
        local get_hl = require("astroui").get_hlgroup
        hl.treesitter_fg = get_hl("StatusLine").fg
        hl.virtual_env_fg = get_hl("StatusLine").fg
        return hl
      end,
    },
    icons = {
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
      ActiveLSP = "󰓅",
      ActiveTS = "",
      ArrowLeft = "",
      ArrowRight = "",
      BufferClose = "",
      DapBreakpoint = "",
      DapBreakpointCondition = "",
      DapBreakpointRejected = "",
      DapLogPoint = ".>",
      DapStopped = "󰁕",
      DefaultFile = "󰈙",
      Diagnostic = "󰒡",
      DiagnosticError = "",
      DiagnosticHint = "󰌵",
      DiagnosticInfo = "󰋼",
      DiagnosticWarn = "",
      Ellipsis = "…",
      FileModified = "",
      FileReadOnly = "",
      FoldClosed = "",
      FoldOpened = "",
      FoldSeparator = " ",
      FolderClosed = "󰉋",
      FolderEmpty = "󱞞",
      FolderOpen = "󰉖",
      Git = "󰊢",
      GitAdd = "",
      GitChange = "",
      GitDelete = "",
      GitBranch = "󰘬",
      GitConflict = "󰘭",
      GitIgnored = "◌",
      GitRenamed = "➜",
      GitStaged = "✓",
      GitUnstaged = "⨯",
      GitUntracked = "★",
      LSPLoaded = "",
      MacroRecording = "",
      Paste = "󰅌",
      Search = "",
      Selected = "❯",
      Spellcheck = "󰓆",
      TabClose = "󰅙",
    },
  },
}
