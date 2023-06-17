--22.11.27-1911
--file = io.open("C:\\Users\\lenovo\\Desktop\\rimeLog.txt", "a")
--timeNow = os.date("%y_%m_%d_%H%M%S")
-- file:write(timeNow.."\t\n")

local file = io.open("C:\\Users\\lenovo\\Desktop\\rimeLog.txt", "a")
time_translator = require("time_translator")
getSingleCharFromPhrase = require("getSingleCharFromPhrase")
testLog = require("testLog")
Log = require("Log")
local deskLog = "C:\\Users\\lenovo\\Desktop\\rimeLog.txt"
local log = Log:new(deskLog)
log:write("1")
-- log:write(tostring(true))
log:write(deskLog .."\t".. tostring(log:fileExists(deskLog))) 

local composition = env.engine.context.composition
log:write("3")
if(not composition:empty()) then
  -- 获得 Segment 对象
  local segment = composition:back()

  -- 获得选中的候选词下标
  local selected_candidate_index = segment.selected_index

  -- 获取 Menu 对象
  local menu = segment.menu

  -- 获得（已加载）候选词数量
  local loaded_candidate_count = menu:candidate_count()
end

log:write("2")

--[[ -- 获取Engine对象


-- 获取当前正在使用的输入方案
local schema = engine.schema
log:write(schema)
-- 获取当前的上下文环境
local context = engine.context

-- 获取当前激活的引擎
local activeEngine = engine.active_engine

-- 处理按键事件
engine:process_key()

-- 获取当前的候选词列表
local candidates = engine:compose()

-- 将文本字符串上屏
engine:commit_text("Hello, world!") ]]

-- 应用指定的输入方案
-- engine:apply_schema()












--test = require("test")
--select_character_processor = require("select_chatacter") 胡 此不效洏自複刻ⁿ改名ᐪ又能效?

--autoSelect = require("autoSelect")
--keyCounter = require("keyCounter")
--file:close()
-- calculator_translator = require("calculator_translator")
-- unicode_translator = require("unicode_translator")


-- local english = require("english")()
-- english_processor = english.processor
-- english_segmentor = english.segmentor
-- english_translator = english.translator
-- english_filter = english.filter
-- english_filter0 = english.filter0




