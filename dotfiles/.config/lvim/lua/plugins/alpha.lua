-- Configure DAP
local Alpha = {}

Alpha.config = function()
  if not lvim.builtin.alpha.active then
    return
  end

  lvim.builtin.alpha.dashboard.section.header.val = {
    " ",
    "███████╗███╗   ███╗ █████╗ ██████╗ ████████╗",
    "██╔════╝████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝",
    "███████╗██╔████╔██║███████║██████╔╝   ██║   ",
    "╚════██║██║╚██╔╝██║██╔══██║██╔══██╗   ██║   ",
    "███████║██║ ╚═╝ ██║██║  ██║██║  ██║   ██║   ",
    "╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ",
    " ",
    "    ██████╗ ███████╗███╗   ██╗ ██████╗      ",
    "    ██╔══██╗██╔════╝████╗  ██║██╔════╝      ",
    "    ██║  ██║█████╗  ██╔██╗ ██║██║  ███╗     ",
    "    ██║  ██║██╔══╝  ██║╚██╗██║██║   ██║     ",
    "    ██████╔╝███████╗██║ ╚████║╚██████╔╝     ",
    "    ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝      ",
    -- " ",
  }

  local fn = vim.fn
  local plugins_count = fn.len(vim.fn.globpath(fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1))
  lvim.builtin.alpha.dashboard.section.footer.val = {
    " ",
    " SmartDeng\'s Nvim loaded " .. plugins_count .. " plugins ",
  }



end


return Alpha
