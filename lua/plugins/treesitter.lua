return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",

                "bash",
                "lua",
            },
        },
    },
    {
        "RRethy/nvim-treesitter-endwise",
        opts = false,
    }
}
