return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Theme (rose pine)
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use { 'nvim-treesitter/playground' }
  use { 'theprimeagen/harpoon' }
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }

  use { 'neovim/nvim-lspconfig' }

  -- Copilot (fix Tab conflict with CopilotChat)
  use {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', {
        expr = true,
        replace_keycodes = false
      })
    end
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  -- CopilotChat
  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    run = 'make tiktoken',
    config = function()
      require('CopilotChat').setup({
        window = {
          layout = 'vertical',
          width = 0.4,
        },
        auto_insert_mode = true,
      })

      -- Keymaps
      vim.keymap.set('n', '<leader>cc', ':CopilotChatToggle<CR>', { desc = 'Toggle CopilotChat' })
      vim.keymap.set('n', '<leader>cr', ':CopilotChatReset<CR>',  { desc = 'Reset CopilotChat' })
      vim.keymap.set('n', '<leader>cm', ':CopilotChatModels<CR>', { desc = 'Select Copilot Model' })

      -- Visual mode: chat about selected code
      vim.keymap.set('v', '<leader>ce', ':CopilotChatExplain<CR>',  { desc = 'Explain selection' })
      vim.keymap.set('v', '<leader>cf', ':CopilotChatFix<CR>',      { desc = 'Fix selection' })
      vim.keymap.set('v', '<leader>ct', ':CopilotChatTests<CR>',    { desc = 'Generate tests' })
      vim.keymap.set('v', '<leader>co', ':CopilotChatOptimize<CR>', { desc = 'Optimize selection' })
    end
  }

  use {
    'nicklsmith95/template_vault',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function()
      require('template_vault').setup({})
      require('telescope').load_extension('template_vault')
    end
  }
end)
