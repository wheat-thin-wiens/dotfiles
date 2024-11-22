return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      debug = true,
      sources = {
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.code_actions.eslint_d"),

        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.mypy.with({
          extra_args = function()
            local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
            return { "--python-executable", virtual .. "/bin/python3"}
          end,
        }),
        null_ls.builtins.diagnostics.markdownlint,
        --null_ls.builtins.diagnostics.rubocop,
        --null_ls.builtins.diagnostics.swiftlint,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier,
        --null_ls.builtins.formatting.rubocop,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
