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
          -- Obey the repo's .clang-format when one exists; otherwise use personal style.
          -- (--fallback-style only accepts named styles, so pick per-file here.)
          prepend_args = function(_, ctx)
            local found = vim.fs.find({ ".clang-format", "_clang-format" }, { path = ctx.dirname, upward = true })[1]
            if found then
              return { "--style=file" }
            end
            return { "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}" }
          end,
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
