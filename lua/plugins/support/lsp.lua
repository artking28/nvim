local this = {}

this.on_attach = function(client, bufnr)
   client.server_capabilities.documentFormattingProvider = false
   client.server_capabilities.documentRangeFormattingProvider = false

   utils.load_mappings("lspconfig", { buffer = bufnr })

   if client.server_capabilities.signatureHelpProvider then
      require("nvchad.signature").setup(client)
   end

   if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
      client.server_capabilities.semanticTokensProvider = nil
   end
end

this.capabilities = vim.lsp.protocol.make_client_capabilities()

this.capabilities.textDocument.completion.completionItem = {
   documentationFormat = { "markdown", "plaintext" },
   snippetSupport = true,
   preselectSupport = true,
   insertReplaceSupport = true,
   labelDetailsSupport = true,
   deprecatedSupport = true,
   commitCharactersSupport = true,
   tagSupport = { valueSet = { 1 } },
   resolveSupport = {
      properties = {
         "documentation",
         "detail",
         "additionalTextEdits",
      },
   },
}

require("lspconfig").gopls.setup({
   on_attach = this.on_attach,
   capabilities = this.capabilities,

   cmd = { "gopls" },
   filetypes = { "go", "gomod", "gowork", "gotmpl" },
   root_dir = require("lspconfig/util").root_pattern("go_work", "go.mod", ".git"),
   settings = {
      gopls = {
         completeUnimported = true,
         usePlaceholders = true,
         analyses = {
            unusedparams = true,
         }
      }
   }
})

require("lspconfig").lua_ls.setup {
   on_attach = this.on_attach,
   capabilities = this.capabilities,

   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim" },
         },
         workspace = {
            library = {
               [vim.fn.expand "$VIMRUNTIME/lua"] = true,
               [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
               [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
               [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
         },
      },
   },
}
