local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gears = require("gears")

local config_dir = gears.filesystem.get_configuration_dir()

local playerctl_widget = {}

local function worker(user_args)
  local args = user_args or {}
  local timeout = args.timeout or 1
  local width = args.width or 230
  playerctl_widget = wibox.widget {
    {
      {

        id = 'play_title',
        -- forced_width = width,
        align = 'center',
        widget = wibox.widget.textbox
      },
      width = width,
      -- layout = wibox.layout.fixed.horizontal,
      layout = wibox.container.constraint,
    },
    {
      {
        id = 'prev',
        align = 'center',
        markup = ' ',
        widget = wibox.widget.textbox
      },
      {
        id = 'play_control',
        align = 'center',
        widget = wibox.widget.textbox
      },
      {
        id = 'next',
        align = 'center',
        markup = string.format("%s", " "),
        widget = wibox.widget.textbox
      },
      layout = wibox.layout.fixed.horizontal,
    },
    widget = wibox.container.margin,
    layout = wibox.layout.fixed.horizontal,
    set_player_title = function(self, title)
      self:get_children_by_id('play_title')[1]:set_markup(title)
    end,
    set_player_status = function(self, status)
      self:get_children_by_id('play_control')[1]:set_markup(status)
    end,
  }
  local update_title = function(widget, stdout)
    widget:set_player_title(string.format("%s", stdout))
  end
  local update_player_status = function(widget, stdout)
    if string.find(stdout, "Playing") then
      widget:set_player_status('  ')
    else
      widget:set_player_status('  ')
    end
  end
  playerctl_widget:get_children_by_id('play_control')[1]:connect_signal(
    'button::press',
    function()
      awful.spawn("playerctl play-pause")
    end
  )
  playerctl_widget:get_children_by_id('prev')[1]:connect_signal(
    'button::press',
    function()
      awful.spawn("playerctl previous")
    end
  )
  playerctl_widget:get_children_by_id('next')[1]:connect_signal(
    'button::press',
    function()
      awful.spawn("playerctl next")
    end
  )
  watch(string.format([[playerctl metadata --format "{{ artist }} - {{ title }}"]]),
    timeout, update_title, playerctl_widget)
  watch(string.format([[playerctl status]]),
    timeout, update_player_status, playerctl_widget)

  return playerctl_widget

end

return setmetatable(playerctl_widget, { __call = function(_, ...) return worker(...) end })
