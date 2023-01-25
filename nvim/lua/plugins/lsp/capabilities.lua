local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")

if not ok then
    return capabilities
else
    capabilities = cmp_lsp.default_capabilities(capabilities)
    return capabilities
end
