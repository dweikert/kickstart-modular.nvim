local function trim(s)
  return s:match('^%s*(.-)%s*$')
end

local function parse_keybinds()
  local path = vim.fn.stdpath('config') .. '/KEYBINDS.md'
  local results = {}
  local section = ''

  local f = io.open(path, 'r')
  if not f then
    vim.notify('KEYBINDS.md not found at ' .. path, vim.log.levels.WARN)
    return results
  end

  for line in f:lines() do
    local h = line:match('^## (.+)')
    if h then
      section = h
    elseif line:match('^|') then
      local cells = {}
      for cell in line:gmatch('|([^|]+)') do
        table.insert(cells, trim(cell))
      end
      -- skip separator rows (---) and header rows
      if #cells >= 2 and not cells[1]:match('^%-') and cells[1]:lower() ~= 'key' then
        local key, mode, action
        if #cells >= 3 then
          key, mode, action = cells[1], cells[2], cells[3]
        else
          key, mode, action = cells[1], '', cells[2]
        end
        table.insert(results, {
          key = key,
          mode = mode,
          action = action,
          section = section,
          ordinal = key .. ' ' .. action .. ' ' .. section,
        })
      end
    end
  end

  f:close()
  return results
end

local function show_keybinds()
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values
  local entry_display = require('telescope.pickers.entry_display')

  local displayer = entry_display.create {
    separator = '  ',
    items = {
      { width = 20 }, -- section
      { width = 5 },  -- mode
      { width = 30 }, -- key
      { remaining = true }, -- action
    },
  }

  local function make_display(entry)
    return displayer {
      { entry.section, 'TelescopeResultsComment' },
      { entry.mode,    'TelescopeResultsNumber' },
      { entry.key,     'TelescopeResultsIdentifier' },
      { entry.action,  'TelescopeResultsNormal' },
    }
  end

  local entries = parse_keybinds()

  pickers.new({}, {
    prompt_title = 'Keybinds',
    finder = finders.new_table {
      results = entries,
      entry_maker = function(entry)
        return {
          value = entry,
          display = make_display,
          ordinal = entry.ordinal,
          section = entry.section,
          mode = entry.mode,
          key = entry.key,
          action = entry.action,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    layout_config = { width = 0.8, height = 0.7 },
  }):find()
end

return {
  'nvim-telescope/telescope.nvim',
  keys = {
    { '<leader>?', show_keybinds, desc = 'Keybinds cheatsheet' },
  },
}
