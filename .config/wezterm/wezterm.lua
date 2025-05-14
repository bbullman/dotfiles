return {

  -- Attempt to work around wezterm issues https://github.com/wez/wezterm/issues/3225
  -- and https://github.com/wez/wezterm/issues/3687
  front_end = "OpenGL",
  -- window_decorations = "RESIZE",
  -- set to false to disable the tab bar completely
  enable_tab_bar = false,
  -- force close on exit, no holding the window open with the status
  exit_behavior = "Close",
  -- custom gruvbox
  color_scheme = "goetia",
  color_schemes = {
	  ["goetia"] = {
		  foreground = "white",
		  background = "black",
		  cursor_fg = "black",
		  cursor_bg = "darkgray",
		  cursor_border = "gold",
		  selection_fg = "black",
		  selection_bg = "slateblue",
		  ansi = {"black", "maroon", "slateblue", "moccasin", "cyan", "blue", "darkgoldenrod", "silver"},
		  brights = {"gray", "crimson", "slateblue", "fuchsia", "green", "forestgreen", "rebeccapurple", "white"},
	  }
  },
  -- set terminal window transparency to 0.8 
  window_background_opacity = 0.8,
  -- inactive_pane_hsb = {
  -- 	saturation = 0.8,
  --	brightness = 0.8,
  -- },
}

