-- Require the widget library
local widget = require( "widget" )

--Background
local background2 = display.newImageRect("images/purple_bg.png", 330, 540)
background2:setReferencePoint( display.CenterReferencePoint )
background2.x = display.contentCenterX
background2.y = display.contentCenterY


-- These are the functions triggered by the buttons

local button1Press = function( event )

	--show animation when is pressed

end

local button1Release = function( event )
	--go to another page when is release. 
		--show animation when is release
local buttonBye2 = graphics.newImageSheet( "images/button_animation_small.png", { width=108, height=108, numFrames=20, border = 0 } )

-- play 8 frames every 1000 ms
local bye_Animation = display.newSprite( buttonBye2, { name="cat", start=11, count=20, time=1500, loopCount = 1 } )

--properties of the button. The size and the position. 
bye_Animation.x = 250; bye_Animation.y = 400
--bye_Animation.x = display.contentWidth /2 + 80
--bye_Animation.y = display.contentHeight /2 + 230
--bye_Animation.xScale = 1.3 
--bye_Animation.yScale = 1.3
bye_Animation:play()
end

-- This button has individual press and release functions
local button1 = widget.newButton
{
	defaultFile = "images/bye.png",
	emboss = true,
	onPress = button1Press,
	onRelease = button1Release,
}

-- the position of the buttons
button1.x = 250; button1.y = 400
button1.xScale = 0.3; button1.yScale = 0.3

