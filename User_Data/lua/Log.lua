-- Log.lua
Log = {}
-- print("log.lua")
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
	file:write()
	file:close()
end

function Log:getCurrentFilePath()
	local info = debug.getinfo(2, "S")
	return info.source:sub(2) 
end

function Log:getCurrentLineNumber()
	local info = debug.getinfo(2, "l")
	return info.currentline
end

-- @path:string
function Log:fileExists(path)
	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else 
		return false
	end
end

return Log

