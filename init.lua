--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20'

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "You don\'t belong here"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "You don\'t belong here"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "You don\'t belong here"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "You don\'t belong here"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Change diagnostic symbols in the sign column (gutter)
      if vim.g.have_nerd_font then
        local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
        local diagnostic_signs = {}
        for type, icon in pairs(signs) do
          diagnostic_signs[vim.diagnostic.severity[type]] = icon
        end
        vim.diagnostic.config { signs = { text = diagnostic_signs } }
      end

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        ts_ls = {},
        --
        ruby_lsp = {},

        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'ruff', 'black' },
        go = { 'crlfmt' },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettier' },
        css = { 'prettier' },
        json = { 'prettier' },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'buffer' }, -- Use text from open files (chatgpt)
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'lunacookies/vim-colors-xcode',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.o.cmdheight = 0
      vim.opt.laststatus = 0
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      --
      -- vim.cmd.colorscheme 'cyberdream'
      -- vim.cmd.colorscheme 'pencil'
      -- vim.cmd.colorscheme 'doom-one'
      -- vim.cmd.colorscheme 'gruvbox-material'
      -- vim.cmd.colorscheme 'desert'
      vim.cmd.colorscheme 'rose-pine-moon'
      -- vim.cmd.colorscheme 'onedark_vivid'
      -- vim.cmd.colorscheme 'catppuccin-frappe'
      -- vim.cmd.colorscheme 'xcode'
      -- vim.cmd.colorscheme 'rose-pine-dawn'
      -- vim.cmd.colorscheme 'edge'

      -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'

      -- Transparent background
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
      -- Enable true transparency for doom-one or any colorscheme
      --       vim.cmd [[
      --   highlight Normal guibg=NONE ctermbg=NONE
      --   highlight NormalNC guibg=NONE ctermbg=NONE
      --   highlight EndOfBuffer guibg=NONE ctermbg=NONE
      --   highlight VertSplit guibg=NONE ctermbg=NONE
      --   highlight SignColumn guibg=NONE ctermbg=NONE
      --   highlight StatusLine guibg=NONE ctermbg=NONE
      --   highlight LineNr guibg=NONE ctermbg=NONE
      --   highlight FoldColumn guibg=NONE ctermbg=NONE
      --   highlight TabLineFill guibg=NONE ctermbg=NONE
      -- ]]

      -- If you're using a GUI like Neovide or a compositor (e.g., picom), make sure transparency is enabled there too.
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- for Go (CHATGPT)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'js',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'html',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'css',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- for running from nvim
-- Function to compile and run C files
function RunC()
  local filename = vim.fn.expand '%:r'
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Quote the output filename as well to handle spaces
  local quoted_output = string.format('"%s"', filename)

  -- Compile the C file with the quoted file path
  vim.cmd(string.format('!gcc %s -o %s', quoted_filepath, quoted_output))

  -- Run the compiled executable
  vim.cmd(string.format('!%s', quoted_output))
end

-- Function to compile and run C++ files
function RunCpp()
  local filename = vim.fn.expand '%:r'
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Quote the output filename as well to handle spaces
  local quoted_output = string.format('"%s"', filename)

  -- Compile the C++ file with the quoted file path
  vim.cmd(string.format('!g++ %s -o %s', quoted_filepath, quoted_output))

  -- Run the compiled executable
  vim.cmd(string.format('!%s', quoted_output))
end

-- Function to run Python files
function RunPython()
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Run the Python file with the quoted file path
  vim.cmd(string.format('!python3 %s', quoted_filepath))
end

-- -- Function to run Ruby files
-- function RunRuby()
--   local quoted_filepath = string.format('"%s"', vim.fn.expand '%')
--
--   -- Run the Ruby file with the quoted file path
--   vim.cmd(string.format('!ruby %s', quoted_filepath))
-- end

-- Bind the function to a key combination for easy access
vim.api.nvim_set_keymap('n', '<leader>0w', ':lua RunRuby()<CR>', { noremap = true, silent = true })

-- Function to compile and run Go files
function RunGo()
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Run the Go file with the quoted file path
  vim.cmd(string.format('!go run %s', quoted_filepath))
end

-- Function to compile and run Go projects from anywhere
function RunGoProject()
  -- Get the current file path
  local file_dir = vim.fn.expand '%:p:h'

  -- Traverse up directories to find the go.mod file
  local project_dir = file_dir
  while project_dir ~= '/' do
    if vim.fn.filereadable(project_dir .. '/go.mod') == 1 then
      break
    end
    project_dir = vim.fn.fnamemodify(project_dir, ':h')
  end

  if project_dir == '/' then
    print 'go.mod not found in any parent directory'
    return
  end

  -- Change to the project directory
  vim.cmd('lcd ' .. project_dir)

  -- Run the Go project
  vim.cmd '!go run .'
end

-- Bind <C-_>gp to run Go projects
vim.api.nvim_set_keymap('n', '<leader>08', ':lua RunGoProject()<CR>', { noremap = true, silent = true })

-- Function to run Node.js files
function RunNode()
  -- Quote the file path to handle spaces
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Run the Node.js file with the quoted file path
  vim.cmd(string.format('!node %s', quoted_filepath))
end

-- -- Function to run .js files using Deno
-- function RunDeno()
--   -- Quote the file path to handle spaces
--   local quoted_filepath = string.format('"%s"', vim.fn.expand '%')
--
--   -- Run the Node.js file with the quoted file path
--   vim.cmd(string.format('!deno run %s', quoted_filepath))
-- end

-- -- Function to run Bun files
-- function RunBun()
--   -- Define the Bun executable path
--   local bun_path = '/home/amir/.bun/bin/bun'
--
--   -- Quote the file path to handle spaces
--   local quoted_filepath = string.format('"%s"', vim.fn.expand '%')
--
--   -- Run the Bun file with the quoted file path
--   vim.cmd(string.format('!%s %s', bun_path, quoted_filepath))
-- end

-- Function to compile and run Rust files
function RunRust()
  local filepath = vim.fn.expand '%'
  local filename = vim.fn.expand '%:t:r' -- Extract filename without extension

  -- Quote the file path to handle spaces
  local quoted_filepath = string.format('"%s"', filepath)

  -- Compile the Rust file with the quoted file path
  vim.cmd(string.format('!rustc %s && ./%s', quoted_filepath, filename))
end

-- -- Function to compile and run Java files
-- function RunJava()
--   local filepath = vim.fn.expand '%:p'
--   local filename = vim.fn.expand '%:t:r'
--   local package_path = filepath:match('.*/main/java/(.*)/' .. filename .. '.java')
--   local class_with_package = package_path:gsub('/', '.') .. '.' .. filename
--
--   -- Compile the Java file
--   vim.cmd('!javac ' .. filepath)
--
--   -- Run the Java class with the package name
--   vim.cmd('!java ' .. class_with_package)
-- end
--
-- Function to run Lua files
function RunLua()
  vim.cmd '!lua %'
end

-- Function to compile and run Zig files
function RunZig()
  local filename = vim.fn.expand '%:r'
  vim.cmd('!zig run ' .. filename .. '.zig')
end

-- Function to run Bash files
function RunBash()
  vim.cmd '!bash %'
end

-- Keybindings
-- vim.api.nvim_set_keymap('n', '<leader>0j', ':lua RunJava()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0l', ':lua RunLua()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0z', ':lua RunZig()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>01', ':lua RunBash()<CR>', { noremap = true, silent = true })

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>0c', ':lua RunC()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>00', ':lua RunCpp()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>09', ':lua RunPython()<CR>', { noremap = true, silent = true })

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>0g', ':lua RunGo()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0n', ':lua RunNode()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0r', ':lua RunRust()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>0b', ':lua RunBun()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>0d', ':lua RunDeno()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '\\', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Map "jj" to exit insert mode
-- vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
-- Map "jk" to exit insert mode and then re-enter insert mode
-- vim.api.nvim_set_keymap('i', 'jk', '<Esc>a', { noremap = true, silent = true })

-- Define the Lua function to execute :e!
function Reload_file()
  vim.cmd 'e!'
end

-- Map <Leader>r to the Lua function
vim.api.nvim_set_keymap('n', '<Leader>zz', ':lua Reload_file()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- vim.keymap.set('n', '<leader>e', function()
--   vim.diagnostic.open_float(nil, { focus = false, scope = 'line' })
-- end, { desc = 'Show diagnostic [E]rror messages' })

-- this is copied from old config it is not in Kickstart
local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
-- keymap.set('n','+','<C-a>')
-- keymap.set('n','-','<C-x>')

-- Delete a word backwards
keymap.set('n', 'dB', 'vb"_d')

-- Select all
-- keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- easy
--
--
-- start of python
-- start of func
-- Define a global Lua function for printing variables/expressions in Python
function _G.print_variable_python()
  -- Prompt the user for input
  local input = vim.fn.input 'Variable/Expression to print: '

  -- Escape single and double quotes to prevent syntax errors in the print statement
  local escaped_input = input:gsub('"', '\\"'):gsub("'", "\\'")

  -- Determine the print statement
  local print_statement = 'print(f"' .. escaped_input .. ': {' .. input .. '}")'

  -- Get the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row, _ = cursor_pos[1], cursor_pos[2]

  -- Insert a new line above the current line and add the print statement
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { print_statement })

  -- Move the cursor to the end of the inserted print statement
  vim.api.nvim_win_set_cursor(0, { row, #print_statement })
end

-- Map the function to <leader>gpv (leader + g + p + v) for Python
vim.api.nvim_set_keymap('n', '<leader>gpv', ':lua _G.print_variable_python()<CR>', { noremap = true, silent = true })
---end of func-----
---end of python

-- start of go
-- start of func Go
-- Define a global Lua function for printing variables/expressions in Go
function _G.print_variable_go()
  -- Prompt the user for input
  local input = vim.fn.input 'Variable/Expression to print: '

  -- Escape double quotes to prevent syntax errors in the print statement
  local escaped_input = input:gsub('"', '\\"')

  -- Determine the print statement
  local print_statement
  if input:match '[+%-*/%%]' or input:match '"%s*..%s*"' then
    -- If the input contains an operator or string concatenation, use fmt.Println
    print_statement = 'fmt.Println("' .. escaped_input .. ': ", ' .. input .. ')'
  else
    -- Otherwise, use fmt.Printf for simple variables
    print_statement = 'fmt.Printf("' .. escaped_input .. ': %v\\n", ' .. input .. ')'
  end

  -- Get the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row, _ = cursor_pos[1], cursor_pos[2]

  -- Insert a new line above the current line and add the print statement
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { print_statement })

  -- Move the cursor to the end of the inserted print statement
  vim.api.nvim_win_set_cursor(0, { row, #print_statement })
end

-- Map the function to <leader>ggv (leader + g + g + v) for Go
vim.api.nvim_set_keymap('n', '<leader>ggv', ':lua _G.print_variable_go()<CR>', { noremap = true, silent = true })
--- end of func
--- start of func
-- Define a global Lua function for Go error handling
function _G.go_error_handling()
  -- Prompt for the variable name
  local var_name = vim.fn.input 'Variable name: '
  if var_name == '' then
    print 'No variable name provided. Aborting.'
    return
  end

  -- Prompt for the error message (optional)
  local err_msg = vim.fn.input 'Error message (optional): '

  -- Construct the Go code
  local go_code = {}
  table.insert(go_code, var_name .. ', err := ') -- Variable declaration
  table.insert(go_code, '') -- Placeholder for cursor position
  table.insert(go_code, 'if err != nil {') -- Error check
  if err_msg ~= '' then
    table.insert(go_code, '\tlog.Fatal("' .. err_msg .. '", err)') -- Error message
  else
    table.insert(go_code, '\tlog.Fatal(err)') -- Default error handling
  end
  table.insert(go_code, '}')

  -- Insert the Go code at the current cursor position
  local current_line = vim.api.nvim_win_get_cursor(0)[1] -- Get current line number
  vim.api.nvim_buf_set_lines(0, current_line - 1, current_line, false, go_code)

  -- Move the cursor to the correct position (after `:=`)
  local cursor_line = current_line
  local cursor_col = #(var_name .. ', err := ')
  vim.api.nvim_win_set_cursor(0, { cursor_line, cursor_col })
end

-- Map the function to <leader>ge (leader + g + e) for Go error handling
vim.api.nvim_set_keymap('n', '<leader>gge', ':lua _G.go_error_handling()<CR>', { noremap = true, silent = true })
--- end of func
--- end of go
--- start of js
--- start of func
-- Define a global Lua function for printing variables/expressions in JavaScript
function _G.print_variable_javascript()
  -- Prompt the user for input
  local input = vim.fn.input 'Argument to print: '

  -- Escape backticks to prevent syntax errors in template literals
  local escaped_input = input:gsub('`', '\\`')

  -- Determine the print statement
  local print_statement = 'console.log(`' .. escaped_input .. ': ${' .. escaped_input .. '}`);'

  -- Get the current line and cursor position
  local current_line = vim.api.nvim_get_current_line()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor_pos[1], cursor_pos[2]

  -- Insert the print statement at the beginning of the current line
  vim.api.nvim_set_current_line(print_statement .. '  ' .. current_line)

  -- Move the cursor to the end of the inserted print statement
  vim.api.nvim_win_set_cursor(0, { row, #print_statement + 2 })
end

-- Map the function to <leader>gjv (leader + g + j + v) for JavaScript
vim.api.nvim_set_keymap('n', '<leader>gjv', ':lua _G.print_variable_javascript()<CR>', { noremap = true, silent = true })
--- end of func
--- end of js
--- start of C
--- start of function
function _G.print_variable_c()
  local input = vim.fn.input 'Argument to print: '

  -- Escape double quotes
  local escaped_input = input:gsub('"', '\\"')

  -- Construct the print statement
  local print_statement = 'printf("' .. escaped_input .. ' = %d\\n", ' .. escaped_input .. ');'

  -- Insert and position cursor
  local current_line = vim.api.nvim_get_current_line()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_set_current_line(print_statement .. '  ' .. current_line)
  vim.api.nvim_win_set_cursor(0, { row, #print_statement + 2 })
end

vim.api.nvim_set_keymap('n', '<leader>gcv', ':lua _G.print_variable_c()<CR>', { noremap = true, silent = true })

--- end of function
--- end of C

_G.current_theme = 'dark' -- Default to dark theme

function _G.toggle_doom_one_theme()
  if _G.current_theme == 'dark' then
    -- vim.g.doom_one_terminal_colors = false
    vim.opt.background = 'light'
    _G.current_theme = 'light'
    vim.cmd 'colorscheme rose-pine-dawn'
    print 'Switched to light theme'
  else
    -- vim.g.doom_one_terminal_colors = true
    vim.opt.background = 'dark'
    _G.current_theme = 'dark'
    vim.cmd 'colorscheme rose-pine-moon'
    print 'Switched to dark theme'
  end

  -- Reload colorscheme
end
-- Map the function to a keybinding (e.g., <Leader>tt)
vim.api.nvim_set_keymap('n', '<Leader>gz', '<cmd>lua _G.toggle_doom_one_theme()<CR>', { noremap = true, silent = true })

-- for Git
_G.git_commit_and_reload = function()
  -- Save the current file
  vim.cmd 'w'

  -- Get the current file's directory
  local file_dir = vim.fn.expand '%:p:h' -- Directory of the current file
  vim.fn.chdir(file_dir) -- Change to the file's directory

  -- Get the current time and file location for the default commit message
  local time = os.date '%Y-%m-%d %H:%M:%S'
  local file_location = vim.fn.expand '%:p' -- Full path of the current file
  local default_commit_message = string.format('Committed from Vim at %s - %s', time, file_location)

  -- Ask for a commit message (default will be used if input is empty)
  local commit_message = vim.fn.input("Commit message (default: '" .. default_commit_message .. "'): ")
  if commit_message == '' then
    commit_message = default_commit_message
  end

  -- Show which files are staged for commit and which are unchanged
  local git_status = vim.fn.system 'git status --short'
  local staged_files = {}
  local unchanged_files = {}

  for line in git_status:gmatch '[^\r\n]+' do
    if line:match '^%s*[MADRC]' then -- Staged files (Modified, Added, Deleted, Renamed, Copied)
      table.insert(staged_files, line)
    elseif line:match '^%s*%?%?' then -- Untracked files
      table.insert(unchanged_files, line)
    end
  end

  -- Display the staged and unchanged files
  print '\nStaged files for commit:'
  for _, file in ipairs(staged_files) do
    print('  ' .. file)
  end

  print '\nUnchanged/untracked files:'
  for _, file in ipairs(unchanged_files) do
    print('  ' .. file)
  end

  -- Ask for confirmation
  local confirm = vim.fn.input "\nProceed with commit? (Press 'n' to cancel, or just Enter to proceed): "
  if confirm:lower() == 'n' then
    print 'Commit canceled.'
    return
  end

  -- Git add everything
  vim.fn.system 'git add .'

  -- Git commit with the provided or default message
  local git_commit_result = vim.fn.system('git commit -m "' .. commit_message .. '"')
  print('Git commit result: ' .. git_commit_result)

  -- Reload the file
  vim.cmd 'e!'
end

-- Map the function to a keybinding (e.g., <Leader>tt)
vim.api.nvim_set_keymap('n', '<Leader>g!', '<cmd>lua _G.git_commit_and_reload()<CR>', { noremap = true, silent = true })

-- vim.cmd 'Copilot disable'

-- Copilot toggle function
-- local copilot_enabled = false

-- function ToggleCopilot()
--   if copilot_enabled then
--     vim.cmd 'Copilot disable'
--     copilot_enabled = false
--     print 'Copilot disabled'
--   else
--     vim.cmd 'Copilot enable'
--     copilot_enabled = true
--     print 'Copilot enabled'
--   end
-- end

-- Keymap to toggle Copilot with <leader>g0
-- vim.keymap.set('n', '<leader>g0', ToggleCopilot, { noremap = true, silent = true })

-- vim.cmd 'colorscheme minicyan'
require('lspconfig').ruff.setup {
  init_options = {
    settings = {
      hover = true, -- Enable hover info
    },
  },
}
-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'LazyVimStarted',
--   callback = function()
--     vim.cmd [[
--         colorscheme 'pinkmare'
--      ]]
--   end,
-- })
-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'LazyVimStarted',
--   callback = function()
--     vim.cmd [[
--       colorscheme xcodedark
--      ]]
--   end,
-- })
-- Define a global function to insert a formatted print statement in Python
function _G.print_var()
  -- Get the word under the cursor (variable name)
  local var_name = vim.fn.expand '<cword>'
  if var_name == '' then
    print 'No variable found under cursor'
    return
  end

  -- Construct the Python print statement
  local print_stmt = string.format('print(f"%s: {%s} 🐍 {type(%s)}")', var_name, var_name, var_name)

  -- Insert the print statement below the current line
  vim.api.nvim_put({ print_stmt }, 'l', true, true)
end

-- Map the function to <leader>gpp
vim.api.nvim_set_keymap('n', '<leader>gpP', ':lua print_var()<CR>', { noremap = true, silent = true })
-- Define a function that makes prints more readable
function _G.transform_print_line()
  local line = vim.api.nvim_get_current_line()
  local expr = line:match [[^%s*print%s*%((.+)%)%s*$]]

  if not expr then
    print 'Not a valid print line.'
    return
  end

  -- In the displayed string, escape backslashes only, keep quotes as-is
  local display = expr:gsub('\\', '\\\\')

  -- Use single quotes outside the f-string to avoid conflicts with inner double quotes
  local new_line = "print(f'" .. display .. ' 👉 {' .. expr .. "}')"

  vim.api.nvim_set_current_line(new_line)
end

vim.keymap.set('n', '<leader>gpt', transform_print_line, { desc = 'Transform print line to f-string style' })

-- Define a global function to insert a formatted print statement (without type checking)
function _G.print_var_snake()
  -- Get the word under the cursor (variable name)
  local var_name = vim.fn.expand '<cword>'
  if var_name == '' then
    print 'No variable found under cursor'
    return
  end

  -- Construct the Python print statement with a snake emoji
  local print_stmt = string.format('print(f"%s = {%s}")', var_name, var_name)

  -- Insert the print statement below the current line
  vim.api.nvim_put({ print_stmt }, 'l', true, true)
end

vim.api.nvim_set_keymap('n', '<leader>gpp', ':lua print_var_snake()<CR>', { noremap = true, silent = true })

-- local lspconfig = require 'lspconfig'

-- -- Enable LSP for JavaScript/TypeScript
-- lspconfig.tsserver.setup {}
--
-- -- Enable LSP for HTML
-- lspconfig.html.setup {}
--
-- -- Enable LSP for CSS
-- lspconfig.cssls.setup {}
--
-- local cmp = require 'cmp'
--
-- cmp.setup {
--   mapping = cmp.mapping.preset.insert(),
--   sources = cmp.config.sources {
--     { name = 'nvim_lsp' }, -- LSP-based completion
--     { name = 'buffer' }, -- Completion from current buffer
--   },
-- }
-- -- local lspconfig = require 'lspconfig'
--
-- lspconfig.tsserver.setup {} -- JavaScript/TypeScript LSP
-- lspconfig.html.setup {} -- HTML LSP
-- lspconfig.cssls.setup {} -- CSS LSP
-- vim.cmd [[
--   hi Comment cterm=italic gui=italic
--   hi Keyword cterm=italic gui=italic
--   hi Statement cterm=italic gui=italic
--   hi Type cterm=italic gui=italic
--   hi Function cterm=italic gui=italic
--   hi String cterm=italic gui=italic
-- ]]
-- vim.cmd [[
--   hi Normal cterm=italic gui=italic
--   hi NormalNC cterm=italic gui=italic
--   hi CursorLine cterm=italic gui=italic
--   hi CursorLineNr cterm=italic gui=italic
--   hi LineNr cterm=italic gui=italic
--   hi Comment cterm=italic gui=italic
--   hi Keyword cterm=italic gui=italic
--   hi Statement cterm=italic gui=italic
--   hi Type cterm=italic gui=italic
--   hi Function cterm=italic gui=italic
--   hi String cterm=italic gui=italic
--   hi Identifier cterm=italic gui=italic
--   hi PreProc cterm=italic gui=italic
--   hi StorageClass cterm=italic gui=italic
--   hi Structure cterm=italic gui=italic
--   hi Typedef cterm=italic gui=italic
--   hi Title cterm=italic gui=italic
--   hi Visual cterm=italic gui=italic
-- ]]
-- changed here
-- vim.cmd [[
--   " Apply italics globally
--   hi Normal cterm=italic gui=italic
--   hi NormalNC cterm=italic gui=italic
--   hi CursorLine cterm=italic gui=italic
--   hi CursorLineNr cterm=italic gui=italic
--   hi LineNr cterm=italic gui=italic
--   hi Comment cterm=italic gui=italic
--   hi Keyword cterm=italic gui=italic
--   hi Statement cterm=italic gui=italic
--   hi Type cterm=italic gui=italic
--   hi Function cterm=italic gui=italic
--   hi String cterm=italic gui=italic
--   hi Identifier cterm=italic gui=italic
--   hi PreProc cterm=italic gui=italic
--   hi StorageClass cterm=italic gui=italic
--   hi Structure cterm=italic gui=italic
--   hi Typedef cterm=italic gui=italic
--   hi Title cterm=italic gui=italic
--   hi Visual cterm=italic gui=italic
--   hi Pmenu cterm=italic gui=italic  " Popup menu
--   hi PmenuSel cterm=italic gui=italic
--   hi TabLine cterm=italic gui=italic  " Tabs
--   hi TabLineFill cterm=italic gui=italic
--   hi StatusLine cterm=italic gui=italic  " Statusline
--   hi StatusLineNC cterm=italic gui=italic
--   hi MsgArea cterm=italic gui=italic  " Command messages
--   hi FloatBorder cterm=italic gui=italic  " Floating windows
--   hi VertSplit cterm=italic gui=italic  " Vertical splits
--   hi WinBar cterm=italic gui=italic  " Window title bar
-- ]]
-- vim.cmd [[
--   hi! Cursor cterm=italic gui=italic
--   hi! CursorLine cterm=italic gui=italic
--   hi! CursorColumn cterm=italic gui=italic
--   hi! Insert cterm=italic gui=italic
-- ]]
-- vim.cmd [[
--   augroup ItalicTyping
--     autocmd!
--     autocmd InsertEnter * hi Normal guifg=NONE guibg=NONE gui=italic
--     autocmd InsertLeave * hi Normal guifg=NONE guibg=NONE gui=italic
--   augroup END
-- ]]
-- vim.cmd [[
--   hi! Identifier gui=italic cterm=italic
--   hi! Type gui=italic cterm=italic
--   hi! Function gui=italic cterm=italic
--   hi! Statement gui=italic cterm=italic
--   hi! Keyword gui=italic cterm=italic
--   hi! Comment gui=italic cterm=italic
-- ]]
-- -- Force italic for all variable-related syntax groups
-- vim.cmd [[
--   hi! clear
--   hi! Normal gui=italic
--   hi! Identifier gui=italic cterm=italic
--   hi! Type gui=italic cterm=italic
--   hi! Function gui=italic cterm=italic
--   hi! Statement gui=italic cterm=italic
--   hi! Keyword gui=italic cterm=italic
--   hi! Comment gui=italic cterm=italic
--   hi! PreProc gui=italic cterm=italic
--   hi! Todo gui=italic cterm=italic
--   hi! Error gui=italic cterm=italic
--   hi! Search gui=italic cterm=italic
--   hi! Visual gui=italic cterm=italic
-- ]]
--
-- -- -- For Treesitter-based highlighting
-- vim.cmd [[
--   hi! @variable gui=italic
--   hi! @variable.builtin gui=italic
--   hi! @parameter gui=italic
--   "hi! @function.gui=italic
--   "hi! @keyword.gui=italic
--   "hi! @type.gui=italic
--   "hi! @comment.gui=italic
-- ]]
-- vim.api.nvim_create_autocmd('VimEnter', {
--   callback = function()
--     -- vim.cmd.colorscheme 'onedark'
--     vim.cmd.colorscheme 'xcodedark'
--   end,
--   desc = 'Load xcodedarkhc colorscheme on VimEnter',
-- })
-- function ApplyItalics()
--   local highlights = {
--     'Normal',
--     'NormalNC',
--     'NormalFloat',
--     'FloatBorder',
--     'FloatTitle',
--     'CursorLine',
--     'CursorLineNr',
--     'LineNr',
--     'Comment',
--     'Keyword',
--     'Statement',
--     'Type',
--     'Function',
--     'String',
--     'Identifier',
--     'PreProc',
--     'StorageClass',
--     'Structure',
--     'Typedef',
--     'Title',
--     'Visual',
--     'Pmenu',
--     'PmenuSel',
--     'TabLine',
--     'TabLineFill',
--     'StatusLine',
--     'StatusLineNC',
--     'MsgArea',
--     'VertSplit',
--     'WinBar',
--     'Cursor',
--     'CursorColumn',
--     'Insert',
--     'Todo',
--     'Error',
--     'Search',
--
--     -- Markdown-specific
--     'markdownItalic',
--     'markdownBold',
--     'markdownBoldItalic',
--     'markdownBlockquote',
--     'markdownH1',
--     'markdownH2',
--     'markdownH3',
--     'markdownH4',
--     'markdownH5',
--     'markdownH6',
--     'markdownListMarker',
--     'markdownLinkText',
--     'markdownUrl',
--   }
--
--   for _, group in ipairs(highlights) do
--     vim.cmd('hi ' .. group .. ' gui=italic cterm=italic')
--   end
--
--   -- Treesitter-based highlights including markdown/text
--   local ts_highlights = {
--     '@variable',
--     '@variable.builtin',
--     '@parameter',
--     '@text',
--     '@text.strong',
--     '@text.emphasis',
--     '@text.literal',
--     '@text.title',
--     '@text.uri',
--     '@text.reference',
--     '@markup.italic',
--     '@markup.bold',
--     '@markup.link',
--   }
--
--   for _, group in ipairs(ts_highlights) do
--     vim.cmd('hi ' .. group .. ' gui=italic')
--   end
--
--   -- Insert mode italics
--   vim.cmd [[
--     augroup ItalicTyping
--       autocmd!
--       autocmd InsertEnter * hi Normal guifg=NONE guibg=NONE gui=italic
--       autocmd InsertLeave * hi Normal guifg=NONE guibg=NONE gui=italic
--     augroup END
--   ]]
-- end

-- ApplyItalics()
--
-- vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--   callback = function()
--     -- Check if the current window is a floating window
--     if vim.api.nvim_win_get_config(0).relative ~= '' then
--       return
--     end
--
--     local total_lines = vim.api.nvim_buf_line_count(0)
--     local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
--     local scrolloff = vim.o.scrolloff or 0
--
--     -- Only execute in Normal mode
--     if vim.api.nvim_get_mode().mode == 'n' then
--       if total_lines - cursor_line <= scrolloff then
--         vim.cmd 'normal! zz'
--       end
--     end
--   end,
-- })

vim.cmd 'highlight NeoTreeNormal guibg=NONE' -- Remove background color

function _G.inspect_var_value()
  local var_name = vim.fn.expand '<cword>'
  if var_name == '' then
    print 'No variable found under cursor'
    return
  end

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Remove existing print statements to avoid duplicate output
  for i = #lines, 1, -1 do
    if lines[i]:match 'print%(' then
      table.remove(lines, i)
    end
  end

  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local line_num = row -- Corrected line number

  -- Detect indentation of the current line
  local current_line = lines[row]
  local indentation = (current_line and current_line:match '^(%s*)') or ''

  -- Construct the print statement with correct indentation
  local debug_stmt = string.format(
    [[
%sprint(f"📌 variable_name: %s\n📍 line: %d\n📂 type: {type(%s)}\n🔢 value: {repr(%s)[:500] + ('...' if len(repr(%s)) > 500 else '')}" + (
%s    f"\n📏 size: {len(%s)}" if isinstance(%s, (list, tuple, set, dict)) else ""
))]],
    indentation,
    var_name,
    line_num,
    var_name,
    var_name,
    var_name,
    indentation,
    var_name,
    var_name
  )

  -- Insert the debug statement **below the hovered variable** with correct indentation
  table.insert(lines, row + 1, debug_stmt)

  local temp_file = '/tmp/temp_var_eval.py'
  local file = io.open(temp_file, 'w')
  for _, line in ipairs(lines) do
    file:write(line .. '\n')
  end
  file:close()

  local result = vim.fn.system('python3 ' .. temp_file)

  vim.defer_fn(function()
    os.remove(temp_file)
  end, 1000)

  -- Ensure output is formatted nicely
  local output_lines = vim.split(result, '\n')

  -- Auto-size window based on content
  local float_width = math.min(40, vim.o.columns - 10)
  local float_height = math.min(#output_lines, vim.o.lines - 6)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output_lines)

  local opts = {
    relative = 'editor',
    width = float_width,
    height = float_height,
    col = (vim.o.columns - float_width) / 2,
    row = (vim.o.lines - float_height) / 2,
    style = 'minimal',
    -- border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Enable scrolling if output overflows
  vim.api.nvim_win_set_option(win, 'wrap', true)
  vim.api.nvim_win_set_option(win, 'cursorline', true)

  -- Better background consistency
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:NormalFloat,FloatBorder:FloatBorder')

  -- Add keybinding to close window
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
end

vim.api.nvim_set_keymap('n', '<leader>a', ':lua inspect_var_value()<CR>', { noremap = true, silent = true })

-- chatgpt 2
function _G.inspect_var_value2()
  local var_name = vim.fn.expand '<cword>'
  if var_name == '' then
    print 'No variable found under cursor'
    return
  end

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Remove existing print statements to avoid duplicate output
  for i = #lines, 1, -1 do
    if lines[i]:match 'print%(' then
      table.remove(lines, i)
    end
  end

  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local line_num = row

  -- Ensure row index is within bounds
  local current_line = lines[row] or ''
  local indentation = current_line:match '^(%s*)' or ''

  -- Construct the print statement with execution time measurement
  local debug_stmt = string.format(
    [[
%simport time
%sstart_time = time.time()
%sresult = f"📌 variable_name: %s\n📍 line: %d\n📂 type: {type(%s)}\n🔢 value: {repr(%s)[:500] + ('...' if len(repr(%s)) > 500 else '')}" + (
%s    f"\n📏 size: {len(%s)}" if isinstance(%s, (list, tuple, set, dict)) else ""
)
%sresult += f"\n⏱️ Python exec time: {(time.time() - start_time) * 1000:.2f}ms"
%sprint(result)]],
    indentation,
    indentation,
    indentation,
    var_name,
    line_num,
    var_name,
    var_name,
    var_name,
    indentation,
    var_name,
    var_name,
    indentation,
    indentation
  )

  -- Insert the debug statement below the hovered variable
  if row <= #lines then
    table.insert(lines, row + 1, debug_stmt)
  else
    table.insert(lines, debug_stmt)
  end

  local temp_file = '/tmp/temp_var_eval.py'
  local file = io.open(temp_file, 'w')
  for _, line in ipairs(lines) do
    file:write(line .. '\n')
  end
  file:close()

  local start_time = vim.loop.hrtime()
  local result = vim.fn.system('python3 ' .. temp_file)
  local exec_time_ms = (vim.loop.hrtime() - start_time) / 1e6

  vim.defer_fn(function()
    os.remove(temp_file)
  end, 1000)

  -- Process the output to handle newlines properly
  local output_lines = {}
  for line in vim.gsplit(result, '\n', { plain = true }) do
    table.insert(output_lines, line)
  end

  -- Append Lua execution time to the same line as Python exec time
  if #output_lines > 0 then
    output_lines[#output_lines] = output_lines[#output_lines] .. string.format('⏱️ Lua exec time: %.2fms', exec_time_ms)
  else
    table.insert(output_lines, string.format('⏱️ Lua exec time: %.2fms', exec_time_ms))
  end

  -- Display results in floating window
  local float_width = math.min(80, vim.o.columns - 10)
  local float_height = math.min(#output_lines + 2, vim.o.lines - 6)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output_lines)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = float_width,
    height = float_height,
    col = (vim.o.columns - float_width) / 2,
    row = (vim.o.lines - float_height) / 2,
    style = 'minimal',
    border = 'rounded',
  })

  vim.api.nvim_win_set_option(win, 'wrap', true)
  vim.api.nvim_win_set_option(win, 'cursorline', true)
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:NormalFloat,FloatBorder:FloatBorder')
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
end

vim.api.nvim_set_keymap('n', '<leader>v', ':lua _G.inspect_var_value2()<CR>', { noremap = true, silent = true })
-- chatgpt 3
function _G.evaluate_python_expression()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local current_line = lines[row] or ''

  -- Create a temporary Python script
  local temp_script = '/tmp/temp_expr_eval.py'
  local file = io.open(temp_script, 'w')

  -- Write all lines to preserve indentation
  for _, line in ipairs(lines) do
    file:write(line .. '\n')
  end

  -- Append execution code at the end
  file:write(string.format(
    [[

import time, os
start_time = time.time()

try:
    _locals = locals().copy()  # Capture current scope
    _globals = globals().copy()
    exec(%q, _globals, _locals)  # Always use exec to support indentation
    _expr_result = _locals.get(%q, _globals.get(%q))  # Try to get the last executed value
    print(f">>> %s")  # Show executed line
    print(f"{_expr_result!r}")  # Print result
except Exception as e:
    print(f"❌ Error: {e}")

print(f"⏱️ Python exec time: {(time.time() - start_time) * 1000:.2f}ms")
os.remove("%s")  # Delete temp file
    ]],
    current_line,
    current_line,
    current_line,
    current_line,
    temp_script
  ))
  file:close()

  -- Run the script
  local start_time = vim.loop.hrtime()
  local result = vim.fn.system('python3 ' .. temp_script)
  local exec_time_ms = (vim.loop.hrtime() - start_time) / 1e6

  -- Show output in floating window
  local output_lines = vim.split(result, '\n', { trimempty = true })
  table.insert(output_lines, string.format('⏱️ Lua exec time: %.2fms', exec_time_ms))

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output_lines)

  local float_width = math.min(80, vim.o.columns - 10)
  local float_height = math.min(#output_lines + 2, vim.o.lines - 6)

  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = float_width,
    height = float_height,
    col = (vim.o.columns - float_width) / 2,
    row = (vim.o.lines - float_height) / 2,
    style = 'minimal',
    border = 'rounded',
  })

  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
end
vim.api.nvim_set_keymap('n', '<leader>x', ':lua _G.evaluate_python_expression()<CR>', { noremap = true, silent = true })

-- chatgpt 6
-- Override the default hover window to be larger
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  -- opts.border = opts.border or 'rounded'
  opts.border = opts.border
  opts.max_width = opts.max_width or 80
  opts.max_width = vim.o.columns
  opts.max_height = opts.max_height or 20
  opts.row = 4 -- Moves it a bit downward
  opts.col = -15 -- Slightly shifts left
  opts.winblend = 20 -- Simulates smaller text

  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
-- Inside your config
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#000000', fg = '#8F9095' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none', fg = '#81542F' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#000000', fg = '#8CAAEF' }) -- Darker brown
-- vim.cmd 'hi Normal gui=italic,nocombine'
-- vim.cmd 'hi NormalFloat gui=italic,nocombine'
-- vim.cmd 'hi CursorLine gui=italic,nocombine'
-- vim.cmd 'hi @text gui=italic,nocombine'
-- vim.cmd 'hi @markup.italic gui=italic,nocombine'
-- vim.cmd 'hi markdownItalic gui=italic,nocombine'
-- vim.cmd 'hi markdownBoldItalic gui=italic,nocombine'
-- Disable underline/undercurl for LSP diagnostics
for _, diag in ipairs { 'Error', 'Warn', 'Info', 'Hint' } do
  vim.api.nvim_set_hl(0, 'DiagnosticUnderline' .. diag, { undercurl = false, underline = false, sp = 'none' })
end
vim.keymap.set('i', '<Del>', '<Del>', { noremap = true })

vim.keymap.set('n', '<leader>zx', function()
  local current = vim.opt.laststatus:get()
  if current == 0 then
    vim.opt.laststatus = 2
    vim.o.cmdheight = 1
  else
    vim.opt.laststatus = 0
    vim.o.cmdheight = 0
  end
end, { desc = 'Toggle statusline' })
