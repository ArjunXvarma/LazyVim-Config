return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    root_dir = function(fname)
                        local util = require("lspconfig.util")
                        return util.root_pattern(
                            ".clangd",
                            ".clang-tidy",
                            "compile_commands.json",
                            "compile_flags.txt",
                            "CMakeLists.txt",
                            ".git"
                        )(fname)
                    end,
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
