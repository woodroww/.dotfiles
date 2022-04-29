local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  print("not cmp_status_ok in cmp.lua")
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  print("no luasnip found sad face in cmp.lua")
  return
end

-- added my python snip dir to
-- ~/.local/share/nvim/plugged/friendly-snippets/package.json

-- /Users/matt/.local/share/nvim/plugged/friendly-snippets
--vim.o.runtimepath = vim.o.runtimepath.."/Users/matt/.my-luasnippets/,"
--require("luasnip/loaders/from_vscode").load({
	-- paths = { "/Users/matt/.my-luasnippets" } })

require("luasnip/loaders/from_vscode").lazy_load()

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
	 -- vim.fn["vsnip#anonymous"](args.body)
    end,
  },
-- don't autocomplete press C-Space when you want completions
  completion = {
    autocomplete = false,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
	["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
 -- Specify `cmp.config.disable` if you want
 -- to remove the default `<C-y>` mapping.
    ["<C-y>"] = cmp.config.disable, 
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
--        nvim_lua = "[NVIM_LUA]",
		luasnip = "[Snippet]",
	--	vsnip = "[vsnip]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
	deprecated = false,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
--    { name = "vsnip" },
--    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
--  documentation = {
--   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
