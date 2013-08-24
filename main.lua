-- require controller module
local storyboard = require "storyboard"

-- Require the widget library
local widget = require( "widget" )

-- load first scene
storyboard.gotoScene( "menu", "fade", 200 )




--[[
------------------------------------------------------------------------------------------
--Background
------------------------------------------------------------------------------------------

local background2 = display.newImageRect("images/purple_bg.png", 330, 540)
background2:setReferencePoint( display.CenterReferencePoint )
background2.x = display.contentCenterX
background2.y = display.contentCenterY

------------------------------------------------------------------------------------------
-- These are the functions triggered by the buttons
-- Tells the button what to do when press and when release
------------------------------------------------------------------------------------------
local button1Press = function( event )

	--show animation when is pressed
local buttonBye2 = graphics.newImageSheet( "images/button_animation_small.png", { width=108, height=108, numFrames=20, border = 0 } )

-- play 8 frames every 1000 ms
local bye_Animation = display.newSprite( buttonBye2, { name="cat", start=11, count=20, time=1500, loopCount = 1 } )

--properties of the button. The size and the position. 
bye_Animation.x = 250; bye_Animation.y = 400
bye_Animation:play()
	return true
end


-- When button is release it will go to scene1
local function button1Release( event )
	if event.phase == "ended" then
		
		storyboard.gotoScene( "scene1", "fade", 800  )
		
		return true
	end
end
-- event listener for the button to perform the previous function. 



------------------------------------------------------------------------------------------
-- This button has individual press and release functions
------------------------------------------------------------------------------------------
local buttonBye = widget.newButton
{
	defaultFile = "images/bye.png",
	emboss = true,
	onPress = button1Press,
	onRelease = button1Release,
}

-- the position of the buttons
buttonBye.x = 250; buttonBye.y = 400
buttonBye.xScale = 0.3; buttonBye.yScale = 0.3

--]]


--[[
-- Touch event listener for button Bye image
local function onSceneTouchButtonBye( self, event )
	if event.phase == "began" then
		
		storyboard.gotoScene( "scene1", "fade", 800  )
		
		return true
	end
end
--]]

