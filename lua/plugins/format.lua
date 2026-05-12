return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },

        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        python = { "ruff_format" },
        lua = { "stylua" },
      },

      formatters = {
        clang_format = {
          prepend_args = {
            "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
          },
        },

        prettier = {
          prepend_args = {
            "--tab-width",
            "4",
            "--use-tabs",
            "false",
          },
        },

        stylua = {
          prepend_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "4",
          },
        },
      },
    },
  },
}
