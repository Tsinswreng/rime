-- Log.lua
Log = {}
print("log.lua")
function Log:new(path)
	local obj = {
		path = path
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
	--[[In this code snippet, setmetatable(obj, self) sets the metatable of the obj table to the Log table, which is referred to by the self parameter. This allows the obj table to inherit the methods defined in the Log table.]]
end

function Log:write(str)
	local file = io.open(self.path, "a")
	file:write(os.date("%Y-%m-%d %H:%M:%S") .. "\t" .. str .. "\n")
	file:close()
end

return Log

