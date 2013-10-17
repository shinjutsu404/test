--My first program
--This line will remove the status bar at the top of screen,
--some apps you might want to keep it in, but not for games!
display.setStatusBar(display.HiddenStatusBar)

--adds and image to our game centered at x and y coords
local backbackground = display.newImage("images/background.png")
backbackground.x = 240
backbackground.y = 160
--show far background
local backgroundfar = display.newImage("images/bgfar1.png")
backgroundfar.height = 320
backgroundfar.width = 960
backgroundfar.x = 480
backgroundfar.y = 160

--show foreground
local backgroundnear1 = display.newImage("images/bgnear2.png")
backgroundnear1.x = 240
backgroundnear1.y = 160
local backgroundnear2 = display.newImage("images/bgnear2.png")
backgroundnear2.x = 760
backgroundnear2.y = 160

--the update function will control most everything that happens in our game
--this will be called every frame(30 frames per second in our case, which is the Corona SDK default)
local function update( event )
--updateBackgrounds will call a function made specifically to handle the background movement
updateBackgrounds()
end
function updateBackgrounds()
--far background movement
backgroundfar.x = backgroundfar.x - (.25)
--near background movement
backgroundnear1.x = backgroundnear1.x - (3)
--if the sprite has moved off the screen move it back to the
--other side so it will move back on
if(backgroundnear1.x < -239) then
backgroundnear1.x = 760
end
backgroundnear2.x = backgroundnear2.x - (3)
if(backgroundnear2.x < -239) then
backgroundnear2.x = 760
end
end
--this is how we call the update function, make sure that this line comes after the
--actual function or it will not be able to find it
--timer.performWithDelay(how often it will run in milliseconds, function to call,
--how many times to call(-1 means forever))
timer.performWithDelay(1, update, -1)