local action_utils = require('code_action_menu.utility_functions.actions')
local StackingWindow = require('code_action_menu.windows.stacking_window')

local function format_action_kind(action_kind)
  if
    vim.g.code_action_menu_show_action_kind ~= nil
    and not vim.g.code_action_menu_show_action_kind
  then
    return ''
  end

  return '(' .. action_kind .. ') '
end

local function action_prefix()
  if vim.g.code_action_menu_action_prefix == nil then
    return ' > '
  else
    return vim.g.code_action_menu_action_prefix
  end
end

local function format_summary_for_action(action, index)
  vim.validate({ ['action to format summary for'] = { action, 'table' } })

  local prefix = action_prefix()
  local formatted_index = ' [' .. index .. '] '
  local kind = format_action_kind(action:get_kind())
  local title = action:get_title()
  local disabled = action:is_disabled() and ' [disabled]' or ''
  return prefix .. kind .. title .. disabled .. formatted_index
end

local MenuWindow = StackingWindow:new()

function MenuWindow:new(all_actions)
  vim.validate({ ['all code actions'] = { all_actions, 'table' } })

  local instance = StackingWindow:new({ all_actions = all_actions })
  setmetatable(instance, self)
  self.__index = self
  self.focusable = true
  self.filetype = 'code-action-menu-menu'
  return instance
end

function MenuWindow:get_content()
  local content = {}

  for index, action in action_utils.iterate_actions_ordered(self.all_actions) do
    local line = format_summary_for_action(action, index)
    table.insert(content, line)
  end

  return content
end

function MenuWindow:get_selected_action()
  if self.window_number == -1 then
    error('Can not retrieve selected action when menu is not open!')
  else
    local cursor = vim.api.nvim_win_get_cursor(self.window_number)
    local line = cursor[1]
    return action_utils.get_action_at_index_ordered(self.all_actions, line)
  end
end

return MenuWindow
