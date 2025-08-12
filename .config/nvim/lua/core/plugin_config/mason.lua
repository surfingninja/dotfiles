require("mason").setup()


local mlsp = require("mason-lspconfig")

mlsp.setup({
  ensure_installed = {  "ts_ls",
                        "lua_ls",
                        "bashls",
                        "jsonls",
                        "yamlls",
                        "docker_compose_language_service",
                        "dockerls",
                        "azure_pipelines_ls",
                        "pylsp",
                        "terraformls",
                        "ast_grep",
                        "solargraph"
  }
})

