local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all"
  ensure_installed = {  "c",
                        "lua",
                        "rust",
                        "ruby",
                        "vim",
                        "vimdoc",
                        "query",
                        "html",
                        "gitignore",
                        "graphql",
                        "http",
                        "java",
                        "css",
                        "sql",
                        "rust",
                        "javascript",
                        "typescript",
                        "bash",
                        "python",
                        "yaml",
                        "sql",
                        "json",
                        "json5",
                        "dockerfile",
                        "csv"

    },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
