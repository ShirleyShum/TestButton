local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

--------------------------------------------------------------------


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local screenGroup = self.view
	
	local newImageAfterByeButton = display.newImageRect( "images/bg.jpg" , 330, 540 )
	screenGroup:insert( newImageAfterByeButton )
	
	newImageAfterByeButton:setReferencePoint( display.CenterReferencePoint )
	newImageAfterByeButton.x = display.contentCenterX
	newImageAfterByeButton.y = display.contentCenterY
	
	newImageAfterByeButton.touch = onSceneTouchButtonBye
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	
	-- remove previous scene's view
	storyboard.purgeScene( "main" )
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	
	-- remove touch listener for image
	image:removeEventListener( "touch", image )
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	
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
