--22.11.27-1911
function time_translator(input, seg)
	if (input == "//") then
	   local cand = Candidate("date", seg.start, seg._end, os.date("%y.%m.%d"), "")
	   cand.quality = 1
	   yield(cand)
	end
	if (input == "/'") then
	   local cand = Candidate("time", seg.start, seg._end, os.date("%H%M"), " ")
	   cand.quality = 1
	   yield(cand)
	end
	if (input == "///") then
		local cand = Candidate("time", seg.start, seg._end, os.date("%y.%m.%d-%H%M"), " ") 
		cand.quality = 1
		yield(cand)
	end
	
	if (input == "/\\") then
	local cand = Candidate("time", seg.start, seg._end, os.date("%y_%m_%d_%H%M%S"), " ")
	cand.quality = 1
	yield(cand)
	end
 end 

