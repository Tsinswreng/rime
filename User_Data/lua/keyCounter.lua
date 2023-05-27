--23.03.14-2008
local keyCount = {}
local keyCounterFile = io.open("/keyCounter.txt", "a")
local logFile = io.open("C:\\Users\\lenovo\\Desktop\\rimeLog.txt", "a")
local timeNow = os.date("%y_%m_%d_%H%M%S\t")
local engine = env.engine --取引擎對象
local context = engine.context --取context對象
local function keyCounter(key, env, input, seg)
	
	logFile.write(timeNow.."9")
	-- if(input == "jjj") then
	-- 	local testCand = Candidate("time", seg.start, seg._end, os.date("%y.%m.%d-%H%M"), "")
	-- end
	if commit_text ~= "" then
		if not keyCount[key:repr()] then
			keyCount[key:repr()] = 1
		elseif keyCount[key:repr()] then 
			keyCount[key:repr()] = keyCount[key:repr()] + 1
		else logFile.write(timeNow.."無\n")
		end
	end
	local logStr = timeNow..key:repr().."\t"..keyCount[key:repr()].."\n"
	keyCounterFile:write(timeNow..key:repr().."\t"..keyCount[key:repr()].."\n")
	return 2
end
keyCounterFile.close()
logFile.close()
return keyCounter