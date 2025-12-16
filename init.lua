deploader = {}

local path = core.get_modpath "deploader"
local S = core.get_translator "deploader"

deploader.get_modpath = path
deploader.get_translator = S

dofile (path .. "/functions.lua")