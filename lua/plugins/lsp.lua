return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--completion-style=detailed",
                        "--fallback-style=llvm", -- used when no config found
                    },
                    init_options = {
                        fallbackFlags = {
                            "-std=c++17",
                            "-stdlib=libc++",
                            "-isysroot/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
                        },
                    },
                },
            },
        },
    },
}
