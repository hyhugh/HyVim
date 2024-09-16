local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fp', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<C-Space>', '<cmd>Telescope oldfiles<cr>', {})

require'telescope'.setup{
    defaults = {
        layout_config = {
            vertical = { width = 0.8, height = 0.9 }
        },
        layout_strategy= 'vertical',
    },
}

local dropdown_configs_for_code_action = {
    layout_strategy = "vertical",
    layout_config = {
        prompt_position = "bottom",
        vertical = {
            width = 0.5,
            height = 100,
        }
    }
}
