-- http://lua-users.org/lists/lua-l/2014-04/msg00590.html


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

local function select_character(key, env)
   local engine = env.engine --取引擎對象
   local context = engine.context --取context對象
   local commit_text = context:get_commit_text() --取 文本芝已確認
   local config = engine.schema.config 
   local first_key = config:get_string('key_binder/select_first_character') or 'bracketleft' --如果用户没有配置该按键，则 config:get_string() 方法返回空字符串，因此我们使用 Lua 中的 or 运算符将默认值 bracketleft 与返回的字符串进行逻辑或运算。如果用户没有配置选择第一个字符的按键，则 first_key 变量将被赋值为默认值 bracketleft，否则它将被赋值为用户配置的按键。
   local last_key = config:get_string('key_binder/select_last_character') or 'bracketright'

   if (key:repr() == first_key and commit_text ~= "") then --key:repr()取当前按键的名称 commit_text 则是输入法引擎当前正在输入的文本
      engine:commit_text(first_character(commit_text))
      context:clear()

      return 1 -- kAccepted --告诉输入法引擎该按键事件已被处理并成功提交输入结果，应该结束本次输入过程
   end

   if (key:repr() == last_key and commit_text ~= "") then
      engine:commit_text(last_character(commit_text))
      context:clear()

      return 1 -- kAccepted
   end

   return 2 -- kNoop
end

return select_character

--key 是一个表示用户按下的键的对象。这个对象包含了键的编码、名称、符号等信息，可以通过 key:repr() 方法获取键的字符串表示。
--env 是一个包含了 Rime 输入法引擎和上下文等信息的对象。在这个脚本中，我们通过 env.engine 获取了输入法引擎对象，通过 env.engine.context 获取了上下文对象。这些对象包含了许多有用的方法和属性，用于处理输入法的状态、文本转换、预测等等。在这个脚本中，我们使用了 engine.context:get_commit_text() 方法获取了已经确认的文本，使用了 engine.schema.config 获取了输入法的配置信息。