-- Configuration de la completion
-- Voir https://github.com/hrsh7th/nvim-cmp#basic-configuration

local cmp = require'cmp'
local lspconfig = require'lspconfig'

cmp.setup({
	snippet = {
		-- Requis par `nvim-cmp` :s
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},

	completion = {
		keyword_length = 5,
	},

	mapping = {
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, 
	{ 
		{ name = 'vsnip' },
	},
	{
		{ name = 'path' },
	},
	{
		{ name = 'buffer' },
	}),
	experimental = {
		ghost_text = true,
	},
})

-- Configuration LSP
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mapping
	local opts = { noremap = true, silent = true }
	-- Voir `:help vim.lsp.*` pour la documentation de chacune des fonctions ci-dessous
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	 -- Avoir les signatures dans les listes des arguments.
	require 'lsp_signature'.on_attach({
		doc_lines = 0,
		handler_opts = {
			border = "none"
		},
	})
end

local capabilities = require'cmp_nvim_lsp'
	.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.rust_analyzer.setup {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy"
			},
			cargo = {
				allFeatures = true,
			},
			completion = {
				postfix = {
					enable = false,
				},
			},
		},
	},
	capabilities = capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
