
local function utf8_sub(s, i, j)
	i = i or 1
	j = j or -1

	if i < 1 or j < 1 then
	local n = utf8.len(s)
	if not n then return nil end
	if i < 0 then i = n + 1 + i end
	if j < 0 then j = n + 1 + j end
	if i < 0 then i = 1 elseif i > n then i = n end
	if j < 0 then j = 1 elseif j > n then j = n end
	end

	if j < i then return "" end

	i = utf8.offset(s, i)
	j = utf8.offset(s, j + 1)

	if i and j then
	return s:sub(i, j - 1)
	elseif i then
	return s:sub(i)
	else
	return ""
	end
end

local function first_character(s)
	return utf8_sub(s, 1, 1)
end

local function last_character(s)
	return utf8_sub(s, -1, -1)
end


local function getSingleCharFromPhrase(key, env, input, seg)
	if (input == "/`") then
		local cand = Candidate("date", seg.start, seg._end, os.date("%y.%m.%d"), "")
		cand.quality = 9999
		yield(cand)
	end
	local engine = env.engine --取引擎對象
	local context = engine.context --取context對象
	local commit_text = context:get_commit_text() --取 文本芝已確認
	local config = engine.schema.config 
	local first_key = config:get_string('key_binder/select_first_character') or 'bracketleft' --如果用户没有配置该按键，则 config:get_string() 方法返回空字符串，因此我们使用 Lua 中的 or 运算符将默认值 bracketleft 与返回的字符串进行逻辑或运算。如果用户没有配置选择第一个字符的按键，则 first_key 变量将被赋值为默认值 bracketleft，否则它将被赋值为用户配置的按键。
	local last_key = config:get_string('key_binder/select_last_character') or 'bracketright'


	if (key:repr() == first_key and commit_text ~= "" and string.len(commit_text) >= 2) then --key:repr()取当前按键的名称 commit_text 则是输入法引擎当前正在输入的文本
		engine:commit_text(first_character(commit_text))
		context:clear()

		return 1 -- kAccepted --告诉输入法引擎该按键事件已被处理并成功提交输入结果，应该结束本次输入过程
	end

	if (key:repr() == last_key and commit_text ~= "" and string.len(commit_text) >= 2) then
		engine:commit_text(last_character(commit_text))
		context:clear() --清空正在输入的编码字符串

		return 1 -- kAccepted
	end

	return 2 -- kNoop
end
return getSingleCharFromPhrase
