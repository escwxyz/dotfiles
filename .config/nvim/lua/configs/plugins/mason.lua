--- Package Manager
--- ~~~~~~~~~~~~~~~
--- https://github.com/williamboman/mason.nvim

-- NOTE must be setup before mason-lspconfig and neovim-lspconfig
return {
    "williamboman/mason.nvim",
    event = "BufReadPre",
    config = function()
        require("mason").setup()
    end
}
