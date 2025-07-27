return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
		})

		vim.keymap.set("n", "<leader>n", ":Neotree toggle reveal<cr>", { desc = "Toggle filesystem [N]eoTree" })
		vim.keymap.set('n', '<c-n>', ':Neotree toggle reveal<cr>', { desc = 'Toggle filesystem [N]eoTree' })
	end,
}
