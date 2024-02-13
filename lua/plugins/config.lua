local this = {}

function this.plugins()
   return {
      {
         "folke/tokyonight.nvim",
         lazy = false,
         priority = 1000,
         opts = {},
      }, {
         -- Lualine definition
         'nvim-lualine/lualine.nvim',
         dependencies = {
            'nvim-tree/nvim-web-devicons',
            opt = false
         }
      }, {
         -- Find into files or int text
         "nvim-telescope/telescope.nvim",
         name = "telescope",
         tag = "0.1.4",
         dependencies = {
            "nvim-lua/plenary.nvim"
         }
      }, {
         -- Languages highlight to programming languages
         "nvim-treesitter/nvim-treesitter",
         name = "treesitter",
         build = ":TSUpdate"
      }, {
         -- Notifications to nvim
         "folke/noice.nvim",
         name = "noice",
         event = "VeryLazy",
         dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify"
         }
      }, {
         -- Package manager
         "williamboman/mason.nvim",
         name = "mason",
         opts = {
            ensure_installed = {
               "gopls",
            }
         },
         dependencies = {
            'neovim/nvim-lspconfig',
            config = function()
               require("plugins.support.lsp")
            end,
         },
      }, {
         'MunifTanjim/prettier.nvim',
         name = 'prettier',
         dependencies = {
            'jose-elias-alvarez/null-ls.nvim',
            'neovim/nvim-lspconfig'
         }
      }
   }
end

function this.opts()
   return {}
end

function this.launch()

   -- COMPLEX CONFIG's
   require("plugins.support.tokyo")
   require("plugins.support.noice")
   require("plugins.support.prettier")


   -- LUALINE
   require('lualine').setup {
      options = {
         icons_enabled = true,
         theme = 'palenight',
         component_separators = { left = '', right = '' },
         section_separators = { left = '', right = '' },
      },
   }

   -- MASON
   require("mason").setup()

   -- TREESITTER
   require("nvim-treesitter.configs").setup({
      ensure_installed = {
         "java", "kotlin", "swift", "javascript", "typescript", "go", "rust", "c", "cpp",
         "html", "css", "scss", "json", "yaml", "lua", "vim", "vimdoc", "query"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
      },
   })



end

return this
