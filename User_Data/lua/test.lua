
-- local function test(input, seg, key, env) 
-- 	local file = io.open("C:\\Users\\lenovo\\Desktop\\rimeLog.txt", "a")
-- 	env.kRejected, env.kAccepted, env.kNoop = 0, 1, 2
-- 	if (input == "iku") then
-- 		file:write(os.date("%y_%m_%d_%H%M%S\t1\n"))
-- 		local cand = Candidate("date", seg.start, seg._end, "Hello", " World!")
-- 		cand.quality = 999
-- 		yield(cand)
-- 		print("114")
-- 	end
-- 	if (input == "[")then
-- 		file:write(os.date("%y_%m_%d_%H%M%S\t2\n"))
-- 		local engine = env.engine
-- 		engine:commit_text("114514")
-- 		return env.kRejected
-- 	end
-- 	file:close()
-- end

-- return test