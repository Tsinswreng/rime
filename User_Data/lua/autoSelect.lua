--require("Log")
--local log = Log:new("lua/log/log2.txt")
local fileAu = io.open("lua/log/log.txt", "a")

--fileAu.close()
local function autoSelect(key, env, input)
	-- fileAu:write("bbb")
	-- print("ccc")
	-- if (input == "//") then
	-- 	fileAu:write("aaa")
	-- 	local cand = Candidate("date", seg.start, seg._end, os.date("%y.%m.%d"), "114")
	-- 	cand.quality = 9999
	-- 	yield(cand)
	--  end
	--log:write("入")
	local engine = env.engine --取引擎對象
	local context = engine.context --取context對象
	local commit_text = context:get_commit_text() --取 文本芝已確認
	if string.match(input, ".*[A-Z]+.*") then
		engine:commit_text(commit_text)
		context:clear()
		return 1
	end
	return 2
end

return autoSelect