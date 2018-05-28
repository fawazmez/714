-----------------------------------------------------------------------------------------
--
-- gameScene.lua
--
-- Created By: Fawaz Mezher
-- Created On: May 2018
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local physics = require( "physics" )
local json = require( "json" )
local tiled = require( "com.ponywolf.ponytiled" )

local scene = composer.newScene()

-- create()
function scene:create( event )
 
    local sceneGroup = self.view

    physics.start()
	physics.setGravity( 0, 25 )
	physics.setDrawMode( "normal" )

    -- show map 
    local filename = "assets/maps/level0.json"
    local mapData = json.decodeFile( system.pathForFile( filename, system.ResourceDirectory ) )
    map = tiled.new( mapData, "assets/maps" )

    -- show mushroom
    local theMushroom = display.newImage( "./assets/sprites/environment/mushroom_red.png" )
    theMushroom.x = display.contentWidth / 2 
    theMushroom.y = 0
    theMushroom.id = "the mushroom"
    physics.addBody( theMushroom, "dynamic", { 
        friction = 0.5, 
        bounce = 0.3 
        } )

    
    sceneGroup:insert( map )
    sceneGroup:insert( theMushroom )

end

-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
	 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene