local Log = require("./log")
local file = io.open("C:\\Users\\lenovo\\Desktop\\rimeLog.txt", "a")
--[[
log = Log:new("lua/log/log.txt")
log:write("時間")
print("end")]]

local function time_translator(input, seg)
	if (input == "/////") then
		local cand = Candidate("time", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), "")  -- 不能寫YYYYMMDDHHmmss
		cand.quality = 999
		yield(cand)
	end
end

file:close()