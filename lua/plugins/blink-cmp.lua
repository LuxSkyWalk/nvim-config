return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    version = "1.*",
    opts = {
        keymap = { preset = "default" },
        appearance = { nerd_font_variant = "mono" },

        completion = {
            documentation = {
                auto_show = true,
            },
            menu = {
                draw = {
                    components = {
                        separator = {
                            text = function()
                                return "|"
                            end,
                            highlight = "BlinkCmpSeparator",
                        },
                        line_number = {
                            text = function(context)
                                return tostring(context.idx)
                            end,
                            highlight = "BlinkCmpLineNr",
                        },
                    },
                    columns = {
                        { "line_number", "separator", gap = 1 },
                        { "kind_icon", "kind", "separator", gap = 1 },
                        { "label", "label_description", "separator", gap = 1 },
                        { "source_name" },
                    }
                },
            },
        },

        sources = {
            default = {
                "lazydev",
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
    },
    opts_extend = { "sources.default" },
}
