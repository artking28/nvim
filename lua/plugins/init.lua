local this = {}

function this.plugins()
    return {
        {
            "rebelot/kanagawa.nvim",
            name = "kanagawa",
            priority = 1000,
            lazy = true
        },{
            "folke/tokyonight.nvim",
            priority = 1000,
        },{
            "nvim-telescope/telescope.nvim",
            name = "telescope",
            tag = "0.1.4",
            dependencies = {
                "nvim-lua/plenary.nvim"
            }
        },{
            "nvim-treesitter/nvim-treesitter",
            name = "treesitter",
            build = ":TSUpdate"
        },{
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
        },
        {
            'freddiehaddad/feline.nvim',
            name = "feline",
            opts = {}
        }, {
            "williamboman/mason.nvim",
            name = "mason",
            opts = {
                ensure_installed = {
                    "gopls",
                }
            },
            dependencies = {
                "neovim/nvim-lspconfig",
                config = function()
                    require("plugins.config.lsp")
                end,
            },
        }
    }
end

function this.opts()
    return {}
end

function this.launch()
    require("plugins.config.theme")
    require("plugins.config.telescope")
    require("plugins.config.treesitter")
    require("plugins.config.noice")
    require("plugins.config.feline")
    require("plugins.config.mason")
end

return this
