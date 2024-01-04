local this = {}

function this.plugins()
    return {
        {
            "rebelot/kanagawa.nvim",
            name = "kanagawa",
            priority = 1000
        }, {
            "nvim-telescope/telescope.nvim",
            name = "telescope",
            tag = "0.1.4",
            dependencies = {
                "nvim-lua/plenary.nvim"
            }
        }, {
            "nvim-treesitter/nvim-treesitter",
            name = "treesitter",
            build = ":TSUpdate"
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
end

return this
