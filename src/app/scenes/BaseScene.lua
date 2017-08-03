
local BaseScene = class("BaseScene", function()
    return display.newScene("BaseScene")
end)

function BaseScene:ctor()
    display.newTTFLabel({text = " ", size = 64})
        :align(display.CENTER, display.cx, display.cy)
        :addTo(self)
end

function BaseScene:onEnter()
end

function BaseScene:onExit()
end

return BaseScene
