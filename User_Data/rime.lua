--22.11.27-1911
--file = io.open("C:\\Users\\lenovo\\Desktop\\rimeLog.txt", "a")
--timeNow = os.date("%y_%m_%d_%H%M%S")
-- file:write(timeNow.."\t\n")
local file = io.open("C:\\Users\\lenovo\\Desktop\\rimeLog.txt", "a")
time_translator = require("time_translator")
getSingleCharFromPhrase = require("getSingleCharFromPhrase")
testLog = require("testLog")
file:write("222")
file:write(time_translator)
file:close()
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




