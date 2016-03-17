planet = {}
require "space"

function planet.load()


	currentPlanet = 1
	planetNum = 3

	planetArray = {{}}
	planetArray[1] = {love.math.random(0, 127), love.math.random(0, 255), love.math.random(0, 255), love.math.random(1, 50)/15, love.math.random(0.01, 0.1)}-- Planet R, Planet G, Planet B, gravity, orbitTime

	for i = 1, planetNum do
		planetArray[#planetArray + 1] = {love.math.random(0, 255), love.math.random(0, 255), love.math.random(0, 255), love.math.random(1, 50)/15, love.math.random(0.01, 0.1)}
	end

end

function planet.draw()

	if player.onPlanet == true then
		love.graphics.setBackgroundColor(planetArray[currentPlanet][1], planetArray[currentPlanet][2], planetArray[currentPlanet][3])
		love.graphics.setColor(82, 46, 23)
		love.graphics.rectangle("fill", 0, 560, 1200, 600) --> Dirt/Earth
		love.graphics.setColor(35, 115, 31)
		love.graphics.rectangle("fill", 0, 560, 1200, 30) --> Grass
	elseif player.onPlanet == false then
		love.graphics.setBackgroundColor(0, 0, 0)
		space.dayTime = 0
	end

end

function UPDATE_PLANET(dt)

	planet.draw()

	if player.onPlanet == true then
		space.weatherX = space.weatherX + planetArray[currentPlanet][5] * 5
		if space.weatherX>500 then 
		    space.weatherY = space.weatherY + planetArray[currentPlanet][5] * 2
		end
		if space.weatherX<500 then 
			space.weatherY = space.weatherY - planetArray[currentPlanet][5] * 2
		end
		if space.weatherX>1200 then 
		    space.weatherX = 0
		    space.weatherY = 150
		    if space.dayTime == 0 then
		        space.dayTime = 1
		    elseif space.dayTime == 1 then
		        space.dayTime = 0
		    end
		end
	end
end

function DRAW_PLANET()

	planet.draw()

end