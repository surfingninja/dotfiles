local lspconfig = vim.lsp.config
-- print("disable warning:", vim.g.lspconfig_disable_warning)

-- capabilities
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

local function safe_cwd()
  local cwd = vim.loop.cwd()
  if not cwd or cwd == "" or cwd == "/" then
    return vim.fn.expand("$HOME")
  end
  return cwd
end

local util = require("lspconfig.util")

local function root_dir(fname)
  if type(fname) == "number" then
    fname = vim.api.nvim_buf_get_name(fname)
  end

  if not fname or fname == "" then
    return vim.loop.cwd() 
  end
  
  if fname:find("/%.github/workflows/") then
    return nil
  end
  
  local root = util.root_pattern(
    ".git",
    "package.json",
    "tsconfig.json",
    "go.mod"
  )(fname) or util.path.dirname(fname) or safe_cwd()

  if root then
    return root
  end

  local dir = vim.fs.dirname(fname)
  if dir and dir ~= "" then
    return dir
  end

  return vim.loop.cwd()
end

-- Lua
lspconfig.lua_ls = {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}

-- Other
vim.lsp.config.solargraph  = { capabilities = capabilities, root_dir = root_dir }
vim.lsp.config.ts_ls       = { 
  capabilities = capabilities, 
  root_dir = root_dir, 
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" } }
vim.lsp.config.gopls  	   = { capabilities = capabilities, root_dir = root_dir }
vim.lsp.config.tailwindcss = { 
  capabilities = capabilities, 
  root_dir = root_dir, 
  filetypes = { "html", "css", "javascript", "typescript", "tsx", "jsx" } }
vim.lsp.config.yamlls = { capabilities = capabilities }

vim.lsp.enable({
  "lua_ls",
  "solargraph",
  "ts_ls",
  "gopls",
  "tailwindcss",
  "yamlls"
})

-- LSP keymaps (unchanged)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
