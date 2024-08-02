local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")


-- Header section
local IMAGE_WEED = {
  "           ",
  "‴●▄˾  ▐▌   ",
  "˛▄▀  █▌    ",
  "▐   Ῥ█   ▼₱",
  "Ὺ▀▄˳▐▌˛ ̕▌  ",
  "   ▐█▌▐▄▄▌■",
  "╼ԧ▄■`˭˭    "
}
local IMAGE_HAND = {
  "           ",
  "    ̳͜„   ͍   ",
  " ▐▌˛██‾ ˳█▌",
  " ▐▌▐█∟ ˳█▀ ",
  " Ὄ█▄█̳▄█▀   ",
  "  █▀▀██▌   ",
  "   ˭˭˭▀▀   "
}
local IMAGE_PALM = {
  "    __     ",
  "  ╼ʽ´˭▐.   ",
  "    ̳■˭´▌   ",
  "  ▐▀   ┩   ",
  "  ▐▌       ",
  "Ὺ▀█▄▄███▄▄_",
  "  ̕▀▀▀▀▀▀˭˭`"
}
local IMAGE_NONE = {
  "           ",
  "           ",
  "           ",
  "           ",
  "           ",
  "           ",
  "           "
}
local IMAGE_TEXT = {
  "////////////////////////////////////////////////////////",
  "///   ////  //    //      //  ////  /// ///  ///////  //",
  "//     //   /  ////  ///  ///  ///  //  //     ///    //",
  "//  //  /  //    //  ///  ////  //  //  //  //  /  /  //",
  "//  ///    //  ////  ///  ////  /  ///  //  //  /  /  //",
  "//  ////   //     /      //////  /////  //  ///  ///  //",
  "////////////////////////////////////////////////////////"
}
dashboard.section.header.val = {""}
for idx = 1, #IMAGE_TEXT do
  dashboard.section.header.val[idx+1] = (
    IMAGE_PALM[idx] ..
    "   "           ..
    IMAGE_TEXT[idx] ..
    "   "           ..
    IMAGE_NONE[idx]
  )
end

-- Buttons section
dashboard.section.buttons.val = {
  dashboard.button("f", "󰮗  Find file", ":Telescope find_files <CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("s", "  Settings", ":e $MYVIMRC <CR>"),
  dashboard.button("q", "󰈆  Quit", ":qa<CR>"),
}

-- Quote section
local quote = {
    "",
    "",
    "",
    "              An idiot admires complexity, a genius admires simplicity.",
    "If you can make something so clusterfucked that he can't understand it,",
    "                                       he's going to think you're a god",
    "",
    "                                                       - Terry A. Davis"
  }

-- Set up the dashboard
alpha.setup(dashboard.opts)
-- Disable folding on alpha buffer
vim.cmd([[
  autocmd FileType alpha setlocal nofoldenable
]])

-- Dev


local FRAME_1 = {
  "  O",
  "/ | \\ ",
  " / \\"
}
local FRAME_2 = {
  "  O",
  "/ | ´´",
  " / \\"
}
local FRAME_3 = {
  "  O /",
  "/ |   ",
  " / \\"
}
local frames = {
  FRAME_1,
  FRAME_2,
  FRAME_3,
  FRAME_2
}

local function is_dashboard_open()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
    if filetype == "alpha" then
      return true
    end
  end
  return false
end

-- Function to cycle through footer texts
local DELTA_TIME = 20 -- ms
--local frame_index = 1
local lines = #quote
local line_index = 1
local current_char = 1
local timer = vim.loop.new_timer()

local function animate_next_frame()
  if is_dashboard_open() then
    --dashboard.section.footer.val = frames[frame_index]
    --frame_index = frame_index % #frames + 1
    local line = quote[line_index]
    if line == nil then
      return
    end
    -- TODO: insert "" if dashboard line is nil
    while #line == 0 do
      line_index = line_index + 1
      line = quote[line_index]
    end
    local new_char = string.sub(line, current_char, current_char)
    dashboard.section.footer.val[line_index] = dashboard.section.footer.val[line_index] .. new_char
    current_char = current_char+ 1
    if current_char >= #line +1 then
      current_char = 1
      line_index = line_index + 1
    end
    -- Refresh screen
    pcall(vim.cmd.AlphaRedraw)
    timer:start(DELTA_TIME, 0, vim.schedule_wrap(animate_next_frame))
  end
end

-- Updates animations until dashboard is closed
dashboard.section.footer.val = {}
for idx=1, #quote do
  table.insert(dashboard.section.footer.val, "")
end
timer:start(DELTA_TIME, 0, vim.schedule_wrap(animate_next_frame))

