---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = require("user.env").colorscheme,
    highlights = {
      init = {
        StatusLine = { link = "Normal" },
        FloatBorder = { link = "Question" },
        NormalFloat = { link = "Normal" },

        WhichKeyFloat = { link = "Normal" },

        NeoTreeNormal = { link = "Normal" },
        NeoTreeNormalNC = { link = "Normal" },

        TelescopeNormal = { link = "Normal" },
        TelescopeBorder = { link = "Question" },
        TelescopePromptTitle = { link = "String" },
        TelescopePromptBorder = { link = "String" },
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
      DiagnosticHint = "",
      DiagnosticError = "",
      DiagnosticInfo = "",
      DiagnosticWarn = "",
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
      GitRenamed = "󰪹",
      GitStaged = "󰌕",
      GitUnstaged = "󰫋",
      GitIgnored = "󰈉",
      GitUntracked = "󱈶",
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
