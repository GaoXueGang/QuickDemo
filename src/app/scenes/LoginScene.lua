local BaseScene = import(".BaseScene")
local LoginScene = class("LoginScene", BaseScene)

function LoginScene:ctor()
	LoginScene.super.ctor(self)
	
	DOWNLOAD = require("app.download.Download")

end

function LoginScene:onEnter()
end

function LoginScene:onExit()
end

--[[
版本更新检测
--]]
function LoginScene:downloadVersionInfo()

end

return LoginScene
