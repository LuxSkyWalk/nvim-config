return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            luau = { "stylua" },
        },
        format_on_save = {
            timeout_ms = 100,
        },
    },
}
