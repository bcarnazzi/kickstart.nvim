-- Collection of various small independent plugins/modules
return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better comments
    require('mini.comment').setup()

    -- Mini autopair
    require('mini.pairs').setup()

    -- Mini indentation scope
    require('mini.indentscope').setup {
      symbol = '│',
      draw = { animation = require('mini.indentscope').gen_animation.none() },
    }

    -- Mini highlighter
    require('mini.hipatterns').setup {
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
      },
    }

    -- Mini diff
    require('mini.diff').setup {
      -- Options for how hunks are visualized
      view = {
        -- Visualization style. Possible values are 'sign' and 'number'.
        -- Default: 'number' if line numbers are enabled, 'sign' otherwise.
        -- style = vim.go.number and 'number' or 'sign',
        style = 'sign',

        -- Signs used for hunks with 'sign' view
        -- signs = { add = '▒', change = '▒', delete = '▒' },
        signs = { add = '+', change = '~', delete = '-' },

        -- Priority of used visualization extmarks
        priority = 199,
      },
    }

    -- local ai = require 'mini.ai'
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup {
      n_lines = 500,
      -- custom_textobjects = {
      --   o = ai.gen_spec.treesitter { -- code block
      --     a = { '@block.outer', '@conditional.outer', '@loop.outer' },
      --     i = { '@block.inner', '@conditional.inner', '@loop.inner' },
      --   },
      --   f = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' }, -- function
      --   c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' }, -- class
      --   t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' }, -- tags
      --   d = { '%f[%d]%d+' }, -- digits
      --   e = { -- Word with case
      --     { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
      --     '^().*()$',
      --   },
      --   u = ai.gen_spec.function_call(), -- u for "Usage"
      --   U = ai.gen_spec.function_call { name_pattern = '[%w_]' }, -- without dot in function name
      -- },
    }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
