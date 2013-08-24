-- Require the widget library
-- Require controller module
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
------------------------------------------------------------------------------------------
--Declare local variables
------------------------------------------------------------------------------------------

local buttonBye2, buttonBye, buttonPlay2, buttonPlay

------------------------------------------------------------------------------------------
-- Called when the scene's view does not exist:
function scene:createScene( event )
	local screenGroup = self.view
	 
------------------------------------------------------------------------------------------
--Background Images
------------------------------------------------------------------------------------------
	local background2 = display.newImageRect("images/purple_bg.png", 360, 570)
	background2:setReferencePoint( display.CenterReferencePoint )
	background2.x = display.contentCenterX
	background2.y = display.contentCenterY
	screenGroup:insert( background2 )
	
	local background = display.newImage( "images/bg.jpg")
	background:setReferencePoint( display.CenterReferencePoint )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	screenGroup:insert( background )
	
	local background3 = display.newImageRect("images/blue_bg.png", 360, 570)
	background3:setReferencePoint( display.CenterReferencePoint )
	background3.x = display.contentCenterX
	background3.y = display.contentCenterY
	screenGroup:insert( background3 )
	
	local background4 = display.newImageRect("images/drops.png", 360, 570)
	background4:setReferencePoint( display.CenterReferencePoint )
	background4.x = display.contentCenterX
	background4.y = display.contentCenterY
	screenGroup:insert( background4 )
------------------------------------------------------------------------------------------
-- These are the functions triggered by the buttons
-- Tells the button what to do when press and when release
------------------------------------------------------------------------------------------

	local buttonByePress = function( event ) 
	--show animation when is pressed
	 local buttonBye2 = graphics.newImageSheet( "images/button_animation_small.png", { width=108, height=108, numFrames=20, border = 0 } )
	-- play 8 frames every 1000 ms
	--this bye_Animation object is not local
	local bye_Animation = display.newSprite( buttonBye2, { name="cat", start=11, count=20, time = 500, loopCount = 1 } )

	--properties of the button. The size and the position. 
	bye_Animation.x = 250; bye_Animation.y = 400
	bye_Animation:play()	
	screenGroup: insert (bye_Animation)
		return true
	end
	

	-- When button is release it will go to scene1
	local function buttonByeRelease( event )
		if event.phase == "ended" then
			storyboard.gotoScene( "scene1", "fade", 500  )
			buttonBye.isVisible = false
			return true
		end
	screenGroup:insert(buttonByeRelease)
	
	end

------------------------------------------------------------------------------------------	
--runtime enter frame function, 
------------------------------------------------------------------------------------------

--TEST
--[[
local function enterFrameBtn(event)

	if buttonBye2.frame == 11 then 
	buttonBye2:delete()
	buttonBye2 = nil
	Runtime:removeEventListener("enterFrame", enterFrameBtn)
	end
screenGroup:insert(enterFrameBtn)
end 

local function buttonByeRelease( event ) if event.phase == "ended" then 

Runtime:addEventListener( "enterFrame", enterFrameBtn) 
storyboard.gotoScene( "scene", "fade", 800 ) 
return true

end 
end
--]]
	
------------------------------------------------------------------------------------------	
--Second Button
------------------------------------------------------------------------------------------
	local buttonPlayPress = function( event ) 
	--show animation when is pressed
	 local buttonPlay2 = graphics.newImageSheet( "images/button_animation_small.png", { width=108, height=108, numFrames=20, border = 0 } )
	-- play 8 frames every 1000 ms
	--this bye_Animation object is not local
	local play_Animation = display.newSprite( buttonPlay2, { name="play", start=1, count=10, time=500, loopCount = 1 } )

	--properties of the button. The size and the position. 
	play_Animation.x = 80; play_Animation.y = 400
	play_Animation:play()	
	screenGroup: insert (play_Animation)
		return true
	end
	

	-- When button is release it will go to scene1
	local function buttonPlayRelease( event )
		if event.phase == "ended" then
			storyboard.gotoScene( "scene1", "fade", 500  )
			buttonPlay.isVisible = false
			return true
		end
	screenGroup:insert(buttonPlayRelease)
	
	end

------------------------------------------------------------------------------------------
-- This button has individual press and release functions
-- This function is for buttonBye 
------------------------------------------------------------------------------------------

--
-- Image Bye Variable 
--
local bye = display.newImageRect("images/bye.png", 30, 30)
bye.alpha = 100
screenGroup:insert( bye )

--
--
--

buttonBye = widget.newButton
{
	defaultFile ="images/bye.png",
	emboss = true,
	onPress = buttonByePress,
	onRelease = buttonByeRelease,
}

--display.remove( buttonBye )

screenGroup:insert(buttonBye)

-- the position of the buttons
buttonBye.x = 250; buttonBye.y = 400
buttonBye.xScale = 0.3; buttonBye.yScale = 0.3
screenGroup:insert( buttonBye )	


------------------------------------------------------------------------------------------
-- This button has individual press and release functions
-- This function is for buttonPlay
------------------------------------------------------------------------------------------
buttonPlay = widget.newButton
{
	defaultFile = "images/play.png",
	emboss = true,
	onPress = buttonPlayPress,
	onRelease = buttonPlayRelease,
}
screenGroup:insert(buttonPlay)

-- the position of the buttons
buttonPlay.x = 80; buttonPlay.y = 400
buttonPlay.xScale = 0.3; buttonPlay.yScale = 0.3
screenGroup:insert( buttonPlay)	



end



-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	
	-- remove previous scene's view
	storyboard.purgeScene( "main" )
end
--[[ For now we dont need this function. 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	
	-- remove touch listener for imageBye
	button1Release:removeEventListener( "touch", button1Release )
	
end
--]]


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
    local group = self.view  

end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene