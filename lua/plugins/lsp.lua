return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--completion-style=detailed",
                        "--header-insertion=iwyu",
                        "--query-driver=/opt/homebrew/bin/clang++,/opt/homebrew/bin/clang,/usr/bin/clang,/usr/bin/clang++",
                    },
                },
            },
        },
    },
}
