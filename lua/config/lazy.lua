local lazy_directory = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not vim.uv.fs_stat(lazy_directory) then
    local repository = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repository, lazy_directory })
end
vim.opt.runtimepath:prepend(lazy_directory)

require("lazy").setup({
    spec = {
        { import = "plugins" },
        { import = "plugins.colorschemes" },
    },
})
