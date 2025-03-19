local colors = require("depths.colors")

local M = {}

function M.setup()
    -- Clear existing highlights
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    -- Set colorscheme name
    vim.o.termguicolors = true
    vim.g.colors_name = "depths"

    -- Set terminal colors
    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = colors.markup
    vim.g.terminal_color_2 = colors.string
    vim.g.terminal_color_3 = colors.accent
    vim.g.terminal_color_4 = colors.tag
    vim.g.terminal_color_5 = colors.constant
    vim.g.terminal_color_6 = colors.regexp
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_8 = colors.fg_idle
    vim.g.terminal_color_9 = colors.error
    vim.g.terminal_color_10 = colors.string
    vim.g.terminal_color_11 = colors.accent
    vim.g.terminal_color_12 = colors.tag
    vim.g.terminal_color_13 = colors.constant
    vim.g.terminal_color_14 = colors.regexp
    vim.g.terminal_color_15 = colors.comment

    vim.g.terminal_color_background = colors.black
    vim.g.terminal_color_foreground = colors.fg

    -- Define highlight groups
    local highlights = {
        -- Editor
        Normal = { fg = colors.fg, bg = colors.black },
        NormalFloat = { bg = colors.bg },
        FloatBorder = { fg = colors.blue, bg = colors.bg },
        FloatTitle = { fg = colors.fg },
        ColorColumn = { bg = colors.line },
        Cursor = { fg = colors.bg, bg = colors.fg },
        CursorColumn = { bg = colors.line },
        CursorLine = { bg = colors.line },
        CursorLineNr = { fg = colors.accent, bg = colors.line },
        LineNr = { fg = colors.dark_gray },

        Directory = { fg = colors.func },
        ErrorMsg = { fg = colors.error },
        WinSeparator = { fg = colors.panel_border, bg = colors.bg },
        VertSplit = { link = "WinSeparator" },
        Folded = { fg = colors.fg_idle, bg = colors.panel_bg },
        FoldColumn = { bg = colors.bg },
        SignColumn = { bg = colors.bg },

        MatchParen = { sp = colors.func, underline = true },
        ModeMsg = { fg = colors.string },
        MoreMsg = { fg = colors.string },
        NonText = { fg = colors.guide_normal },
        Pmenu = { fg = colors.fg, bg = colors.selection_inactive },
        PmenuSel = { fg = colors.fg, bg = colors.selection_inactive, reverse = true },
        Question = { fg = colors.string },
        Search = { fg = "NONE", bg = colors.light_purple },
        CurSearch = { fg = "NONE", bg = colors.light_purple },
        IncSearch = { fg = "NONE", bg = colors.light_purple },
        SpecialKey = { fg = colors.selection_inactive },
        SpellCap = { sp = colors.tag, undercurl = true },
        SpellLocal = { sp = colors.keyword, undercurl = true },
        SpellBad = { sp = colors.error, undercurl = true },
        SpellRare = { sp = colors.regexp, undercurl = true },
        StatusLine = { fg = colors.fg, bg = colors.panel_bg },
        StatusLineNC = { fg = colors.fg_idle, bg = colors.panel_bg },
        WildMenu = { fg = colors.fg, bg = colors.markup },
        TabLine = { fg = colors.comment, bg = colors.panel_shadow },
        TabLineFill = { fg = colors.fg, bg = colors.panel_border },
        TabLineSel = { fg = colors.fg, bg = colors.bg },
        Title = { fg = colors.keyword },
        Visual = { bg = colors.line },
        WarningMsg = { fg = colors.warning },

        Comment = { fg = colors.comment, italic = true },
        Constant = { fg = colors.constant },
        String = { fg = colors.string },
        Identifier = { fg = colors.entity },
        Function = { fg = colors.func },
        Statement = { fg = colors.keyword },
        Operator = { fg = colors.operator },
        Exception = { fg = colors.markup },
        PreProc = { fg = colors.accent },
        Type = { fg = colors.entity },
        Structure = { fg = colors.special },
        Special = { fg = colors.accent },
        Delimiter = { fg = colors.special },
        Underlined = { sp = colors.tag, underline = true },
        Ignore = { fg = colors.fg },
        Error = { fg = colors.white, bg = colors.error },
        Todo = { fg = colors.markup },
        qfLineNr = { fg = colors.keyword },
        qfError = { fg = colors.error },
        Conceal = { fg = colors.comment },
        CursorLineConceal = { fg = colors.guide_normal, bg = colors.line },
        CursorWord = { bg = colors.selection_inactive },
        CursorWord0 = { bg = colors.selection_inactive },
        CursorWord1 = { bg = colors.selection_inactive },

        Added = { fg = colors.vcs_added },
        Removed = { fg = colors.vcs_removed },
        Changed = { fg = colors.vcs_modified },
        DiffAdd = { bg = colors.vcs_added_bg },
        DiffAdded = { fg = colors.vcs_added },
        DiffDelete = { bg = colors.vcs_removed_bg },
        DiffRemoved = { fg = colors.vcs_removed },
        DiffText = { bg = colors.gutter_normal },
        DiffChange = { bg = colors.selection_inactive },

        -- Treesitter highlighting
        ["@attribute"] = { link = "PreProc" },
        ["@boolean"] = { link = "Boolean" },
        ["@character"] = { link = "Character" },
        ["@character.special"] = { link = "SpecialChar" },
        ["@comment"] = { link = "Comment" },
        ["@conditional"] = { link = "Conditional" },
        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { link = "Constant" },
        ["@constant.macro"] = { link = "Constant" },
        ["@constructor"] = { fg = colors.entity },
        ["@debug"] = { link = "Debug" },
        ["@define"] = { link = "Define" },
        ["@error"] = { link = "Error" },
        ["@exception"] = { link = "Exception" },
        ["@field"] = { fg = colors.fg },
        ["@float"] = { link = "Float" },
        ["@function"] = { link = "Function" },
        ["@function.builtin"] = { fg = colors.func },
        ["@function.call"] = { link = "Function" },
        ["@function.macro"] = { link = "Macro" },
        ["@include"] = { link = "Include" },
        ["@keyword"] = { link = "Keyword" },
        ["@keyword.function"] = { link = "Keyword" },
        ["@keyword.operator"] = { link = "Keyword" },
        ["@keyword.return"] = { link = "Keyword" },
        ["@keyword.storage"] = { fg = colors.keyword },
        ["@label"] = { link = "Label" },
        ["@markup.heading"] = { fg = colors.keyword },
        ["@markup.heading.1.markdown"] = { link = "@markup.heading" },
        ["@markup.heading.2.markdown"] = { link = "@markup.heading" },
        ["@markup.heading.3.markdown"] = { link = "@markup.heading" },
        ["@markup.heading.4.markdown"] = { link = "@markup.heading" },
        ["@markup.heading.5.markdown"] = { link = "@markup.heading" },
        ["@markup.heading.6.markdown"] = { link = "@markup.heading" },
        ["@method"] = { link = "Function" },
        ["@method.call"] = { link = "Function" },
        ["@module"] = { fg = colors.func },
        ["@namespace"] = { fg = colors.entity },
        ["@none"] = { bg = "NONE", fg = "NONE" },
        ["@number"] = { link = "Number" },
        ["@operator"] = { link = "Operator" },
        ["@parameter"] = { fg = colors.fg },
        ["@preproc"] = { link = "PreProc" },
        ["@property"] = { fg = colors.tag },
        ["@punctuation.bracket"] = { fg = colors.orange },
        ["@punctuation.delimiter"] = { link = "Delimiter" },
        ["@punctuation.special"] = { link = "Delimiter" },
        ["@repeat"] = { link = "Repeat" },
        ["@storageclass"] = { link = "StorageClass" },
        ["@string"] = { link = "String" },
        ["@string.escape"] = { fg = colors.special },
        ["@string.regex"] = { fg = colors.regexp },
        ["@string.special"] = { link = "SpecialChar" },
        ["@symbol"] = { fg = colors.constant },
        ["@tag"] = { fg = colors.keyword },
        ["@tag.attribute"] = { fg = colors.entity },
        ["@tag.delimiter"] = { link = "Delimiter" },
        ["@text"] = { fg = colors.fg },
        ["@text.danger"] = { fg = colors.red },
        ["@text.emphasis"] = { fg = colors.fg, italic = true },
        ["@text.environment"] = { fg = colors.orange },
        ["@text.environment.name"] = { fg = colors.orange },
        ["@text.literal"] = { fg = colors.string },
        ["@text.math"] = { fg = colors.blue },
        ["@text.note"] = { fg = colors.blue },
        ["@text.reference"] = { fg = colors.blue },
        ["@text.strike"] = { fg = colors.fg, strikethrough = true },
        ["@text.strong"] = { fg = colors.fg, bold = true },
        ["@text.title"] = { link = "Title" },
        ["@text.todo"] = { link = "Todo" },
        ["@text.underline"] = { fg = colors.fg, underline = true },
        ["@text.uri"] = { fg = colors.string, underline = true },
        ["@text.warning"] = { fg = colors.yellow },
        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { link = "Type" },
        ["@type.definition"] = { link = "Typedef" },
        ["@type.qualifier"] = { fg = colors.keyword },
        ["@variable"] = { fg = colors.fg },
        ["@variable.builtin"] = { fg = colors.func },
        ["@variable.member"] = { fg = colors.tag },
        ["@variable.parameter"] = { fg = colors.fg },

        ["@lsp.type.namespace"] = { link = "@module" },
        ["@lsp.type.type"] = { link = "@type" },
        ["@lsp.type.class"] = { link = "@type" },
        ["@lsp.type.enum"] = { link = "@type" },
        ["@lsp.type.interface"] = { link = "@type" },
        ["@lsp.type.struct"] = { link = "@variable.member" },
        ["@lsp.type.parameter"] = { fg = colors.lsp_parameter },
        ["@lsp.type.field"] = { link = "@variable.member" },
        ["@lsp.type.variable"] = { link = "@variable" },
        ["@lsp.type.property"] = { link = "@property" },
        ["@lsp.type.enumMember"] = { link = "@constant" },
        ["@lsp.type.function"] = { link = "@function" },
        ["@lsp.type.method"] = { link = "@function.method" },
        ["@lsp.type.macro"] = { link = "@function.macro" },
        ["@lsp.type.decorator"] = { link = "@function" },
        ["@lsp.mod.constant"] = { link = "@constant" },

        TreesitterContext = { bg = colors.selection_inactive },

        -- Alpha
        AlphaHeader = { fg = colors.blue },
        AlphaButtons = { fg = colors.cyan },
        AlphaShortcut = { fg = colors.orange },
        AlphaFooter = { fg = colors.purple, italic = true },

        -- Cmp.
        CmpItemAbbrMatch = { fg = colors.keyword },
        CmpItemAbbrMatchFuzzy = { fg = colors.func },
        CmpItemKindText = { fg = colors.string },
        CmpItemKindMethod = { fg = colors.keyword },
        CmpItemKindFunction = { fg = colors.func },
        CmpItemKindConstructor = { fg = colors.keyword },
        CmpItemKindField = { fg = colors.entity },
        CmpItemKindVariable = { fg = colors.tag },
        CmpItemKindClass = { fg = colors.entity },
        CmpItemKindInterface = { fg = colors.entity },
        CmpItemKindModule = { fg = colors.keyword },
        CmpItemKindProperty = { fg = colors.keyword },
        CmpItemKindUnit = { fg = colors.constant },
        CmpItemKindValue = { fg = colors.constant },
        CmpItemKindEnum = { fg = colors.entity },
        CmpItemKindKeyword = { fg = colors.keyword },
        CmpItemKindSnippet = { fg = colors.regexp },
        CmpItemKindColor = { fg = colors.special },
        CmpItemKindFile = { fg = colors.special },
        CmpItemKindReference = { fg = colors.special },
        CmpItemKindFolder = { fg = colors.special },
        CmpItemKindEnumMember = { fg = colors.constant },
        CmpItemKindConstant = { fg = colors.constant },
        CmpItemKindStruct = { fg = colors.entity },
        CmpItemKindEvent = { fg = colors.tag },
        CmpItemKindOperator = { fg = colors.operator },
        CmpItemKindTypeParameter = { fg = colors.tag },
        CmpItemMenu = { fg = colors.comment },

        -- Dashboard
        DashboardShortCut = { fg = colors.keyword },
        DashboardHeader = { fg = colors.blue },
        DashboardCenter = { fg = colors.func },
        DashboardFooter = { fg = colors.string, italic = true },

        -- Gitsigns
        GitSignsAdd = { fg = colors.added },
        GitSignsChange = { fg = colors.modified },
        GitSignsDelete = { fg = colors.removed },
        GitSignsCurrentLineBlame = { fg = colors.gray },

        -- Git highlighting
        gitcommitComment = { fg = colors.comment },
        gitcommitUntracked = { fg = colors.comment },
        gitcommitDiscarded = { fg = colors.comment },
        gitcommitSelected = { fg = colors.comment },
        gitcommitUnmerged = { fg = colors.green },
        gitcommitBranch = { fg = colors.purple },
        gitcommitNoBranch = { fg = colors.purple },
        gitcommitDiscardedType = { fg = colors.red },
        gitcommitSelectedType = { fg = colors.green },
        gitcommitUntrackedFile = { fg = colors.cyan },
        gitcommitDiscardedFile = { fg = colors.red },
        gitcommitSelectedFile = { fg = colors.green },
        gitcommitUnmergedFile = { fg = colors.yellow },
        gitcommitFile = { fg = colors.fg },

        -- Fidget
        FidgetTitle = { fg = colors.blue, bold = true },
        FidgetTask = { fg = colors.fg },

        -- Hop
        HopNextKey = { fg = colors.keyword, bold = true, underline = true },
        HopNextKey1 = { fg = colors.entity, bold = true, underline = true },
        HopNextKey2 = { fg = colors.tag },
        HopUnmatched = { fg = colors.comment },

        -- LSP highlighting
        DiagnosticError = { fg = colors.red },
        DiagnosticWarn = { fg = colors.yellow },
        DiagnosticInfo = { fg = colors.blue },
        DiagnosticHint = { fg = colors.cyan },
        DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan },
        LspInlayHint = { fg = colors.lsp_inlay_hint },
        LspSignatureActiveParameter = { italic = true },
        LspReferenceText = { underline = false },
        LspReferenceRead = { underline = false },
        LspReferenceWrite = { underline = false },

        -- NvimTree
        NvimTreeGitDirty = { fg = colors.accent },
        NvimTreeGitStaged = { fg = colors.vcs_modified },
        NvimTreeGitMerge = { fg = colors.error },
        NvimTreeGitNew = { fg = colors.vcs_added },
        NvimTreeGitDeleted = { fg = colors.vcs_removed },
        NvimTreeFolderName = { fg = colors.special },
        NvimTreeFolderIcon = { fg = colors.accent },
        NvimTreeOpenedFolderName = { fg = colors.special },
        NvimTreeRootFolder = { fg = colors.keyword },
        NvimTreeSpecialFile = { fg = colors.fg },
        NvimTreeExecFile = { fg = colors.fg },
        NvimTreeIndentMarker = { fg = colors.guide_normal },
        NvimTreeWindowPicker = { fg = colors.keyword, bg = colors.panel_border, bold = true },

        -- Indent Blankline
        IndentBlanklineChar = { fg = colors.guide_normal },
        IndentBlanklineContextChar = { fg = colors.comment },

        markdownHeadingDelimiter = { fg = colors.orange, bold = true },
        markdownCode = { fg = colors.blue },
        markdownCodeBlock = { fg = colors.bg_dark },
        markdownLinkText = { sp = colors.tag, underline = true },
        markdownH1 = { link = "@markdown.heading" },
        markdownH2 = { link = "@markdown.heading" },
        markdownH3 = { link = "@markdown.heading" },
        markdownH4 = { link = "@markdown.heading" },
        markdownH5 = { link = "@markdown.heading" },
        markdownH6 = { link = "@markdown.heading" },

        -- Mini.nvim
        MiniFilesTitleFocused = { fg = colors.fg, bold = true },
        MiniHipatternsFixme = { fg = colors.bg, bg = colors.error, bold = true },
        MiniHipatternsHack = { fg = colors.bg, bg = colors.keyword, bold = true },
        MiniHipatternsTodo = { fg = colors.bg, bg = colors.tag, bold = true },
        MiniHipatternsNote = { fg = colors.bg, bg = colors.regexp, bold = true },
        MiniIconsAzure = { fg = colors.tag },
        MiniIconsBlue = { fg = colors.entity },
        MiniIconsCyan = { fg = colors.regexp },
        MiniIconsGreen = { fg = colors.string },
        MiniIconsGrey = { fg = colors.fg },
        MiniIconsOrange = { fg = colors.keyword },
        MiniIconsPurple = { fg = colors.lsp_parameter },
        MiniIconsRed = { fg = colors.error },
        MiniIconsYellow = { fg = colors.special },
        MiniIndentscopeSymbol = { fg = colors.comment },
        MiniIndentscopeSymbolOff = { fg = colors.keyword },
        MiniJump = { sp = colors.keyword, undercurl = true },
        MiniJump2dDim = { fg = colors.comment, nocombine = true },
        MiniJump2dSpot = { fg = colors.keyword, bold = true, underline = true, nocombine = true },
        MiniJump2dSpotAhead = { fg = colors.entity, underline = true, nocombine = true },
        MiniJump2dSpotUnique = { fg = colors.tag, bold = true, underline = true, nocombine = true },
        MiniStarterItemPrefix = { fg = colors.accent },
        MiniStarterFooter = { link = "Comment" },
        MiniStatuslineDevinfo = { fg = colors.fg, bg = colors.panel_border },
        MiniStatuslineFileinfo = { fg = colors.fg, bg = colors.panel_border },
        MiniStatuslineFilename = { fg = colors.fg_idle, bg = colors.panel_border },
        MiniStatuslineInactive = { fg = colors.fg_idle, bg = colors.panel_border },
        MiniStatuslineModeCommand = { fg = colors.bg, bg = colors.keyword, bold = true },
        MiniStatuslineModeInsert = { fg = colors.bg, bg = colors.string, bold = true },
        MiniStatuslineModeNormal = { fg = colors.bg, bg = colors.entity, bold = true },
        MiniStatuslineModeOther = { fg = colors.bg, bg = colors.regexp, bold = true },
        MiniStatuslineModeReplace = { fg = colors.bg, bg = colors.markup, bold = true },
        MiniStatuslineModeVisual = { fg = colors.bg, bg = colors.accent, bold = true },
        MiniTablineCurrent = { fg = colors.fg, bg = colors.bg, bold = true },
        MiniTablineFill = { fg = colors.fg, bg = colors.panel_border },
        MiniTablineHidden = { fg = colors.comment, bg = colors.panel_shadow },
        MiniTablineModifiedCurrent = { fg = colors.bg, bg = colors.fg, bold = true },
        MiniTablineModifiedHidden = { fg = colors.panel_shadow, bg = colors.comment },
        MiniTablineModifiedVisible = { fg = colors.bg, bg = colors.fg },
        MiniTablineVisible = { fg = colors.fg, bg = colors.bg },
        MiniTestFail = { fg = colors.error, bold = true },
        MiniTestPass = { fg = colors.string, bold = true },
        MiniTrailspace = { bg = colors.vcs_removed },

        -- Neogit
        NeogitBranch = { fg = colors.blue },
        NeogitRemote = { fg = colors.purple },
        NeogitDiffContextHighlight = { bg = colors.line },
        NeogitHunkHeader = { fg = colors.tag },
        NeogitHunkHeaderHighlight = { fg = colors.tag, bg = colors.line },
        NeogitDiffAddHighlight = { bg = colors.vcs_added_bg },
        NeogitDiffDeleteHighlight = { bg = colors.vcs_removed_bg },

        -- Notify
        NotifyERROR = { fg = colors.vcs_removed },
        NotifyWARN = { fg = colors.func },
        NotifyINFO = { fg = colors.vcs_added },
        NotifyDEBUG = { fg = colors.comment },
        NotifyTRACE = { fg = colors.vcs_modified },
        NotifyERRORTitle = { fg = colors.error },
        NotifyWARNTitle = { fg = colors.warning },
        NotifyINFOTitle = { fg = colors.string },
        NotifyDEBUGTitle = { fg = colors.ui },
        NotifyTRACETitle = { fg = colors.entity },

        -- Telescope
        TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
        TelescopeBorder = { fg = colors.gray, bg = colors.bg_dark },
        TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_subtle },
        TelescopePromptBorder = { fg = colors.accent },
        TelescopePromptPrefix = { fg = colors.blue, bg = colors.bg_subtle },
        TelescopeResultsNormal = { fg = colors.fg, bg = colors.bg_dark },
        TelescopeResultsBorder = { fg = colors.gray, bg = colors.bg_dark },
        TelescopeResultsTitle = { fg = colors.blue, bg = colors.bg_dark },
        TelescopeMatching = { fg = colors.func },
        TelescopeSelection = { bg = colors.selection },
        TelescopeSelectionCaret = { fg = colors.red },

        -- WhichKey
        WhichKey = { fg = colors.purple },
        WhichKeyGroup = { fg = colors.blue },
        WhichKeyDesc = { fg = colors.fg },
        WhichKeySeperator = { fg = colors.gray },
        WhichKeySeparator = { fg = colors.gray },
        WhichKeyFloat = { bg = colors.bg },
        WhichKeyValue = { fg = colors.gray },
    }

    -- Apply highlights
    for group, ops in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, ops)
    end
end

-- Lualine theme configuration
function M.lualine()
    return {
        normal = {
            a = { bg = colors.blue, fg = colors.bg, bold = true },
            b = { bg = colors.panel_bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg_idle },
        },
        insert = {
            a = { bg = colors.green, fg = colors.bg, bold = true },
            b = { bg = colors.panel_bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg_idle },
        },
        visual = {
            a = { bg = colors.purple, fg = colors.bg, bold = true },
            b = { bg = colors.panel_bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg_idle },
        },
        replace = {
            a = { bg = colors.red, fg = colors.bg, bold = true },
            b = { bg = colors.panel_bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg_idle },
        },
        command = {
            a = { bg = colors.yellow, fg = colors.bg, bold = true },
            b = { bg = colors.panel_bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg_idle },
        },
        terminal = {
            a = { bg = colors.cyan, fg = colors.bg, bold = true },
            b = { bg = colors.panel_bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg_idle },
        },
        inactive = {
            a = { bg = colors.bg_dark, fg = colors.fg_idle },
            b = { bg = colors.bg_dark, fg = colors.fg_idle },
            c = { bg = colors.bg_dark, fg = colors.fg_idle },
        },
    }
end

-- Command function
function M.colorscheme() vim.cmd("colorscheme depths") end

-- Return the module
return M
