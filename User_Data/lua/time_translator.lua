--23.05.07-1118
require("Log")
local log = Log:new("log.txt")
local function time_translator(input, seg)
	if (input == "//") then
		local a = io.read()

	   local cand = Candidate("date", seg.start, seg._end, os.date("%y.%m.%d"), "")
	   cand.quality = 9999
	   yield(cand)
	   local Log = require("Log")
		local log = Log:new("log.txt")
		--log:write("入")
	end
	if (input == "/'") then
	   local cand = Candidate("time", seg.start, seg._end, os.date("%H%M"), "")  
	   cand.quality = 999
	   yield(cand)
	end
	if (input == "///") then
		local cand = Candidate("time", seg.start, seg._end, os.date("%y.%m.%d-%H%M"), "") 
		cand.quality = 999
		yield(cand)
	end
	if (input == "////") then
		local cand = Candidate("time", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), "")  -- 不能寫YYYYMMDDHHmmss
		cand.quality = 999
		yield(cand)
	end
	
	if (input == "/\\") then
	local cand = Candidate("time", seg.start, seg._end, os.date("%Y_%m_%d_%H%M%S"), "")
	cand.quality = 999
	yield(cand)
	
	end
	
 end 
return time_translator