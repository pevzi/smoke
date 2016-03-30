local canvas, image, smoke

function love.load()
    love.graphics.setBackgroundColor(255, 255, 255)

    canvas = love.graphics.newCanvas()
    image = love.graphics.newImage("smoke.png")

    smoke = love.graphics.newParticleSystem(image, 150)
    smoke:setEmissionRate(20)
    smoke:setParticleLifetime(1.5, 2.5)
    smoke:setEmitterLifetime(-1)
    smoke:setSpread(math.pi / 2)
    smoke:setSpeed(10, 30)
    smoke:setDirection(-math.pi / 2)
    smoke:setSizes(0.5, 2.5)
    smoke:setColors(255,255,255,10, 255,255,255,0)
    smoke:setLinearAcceleration(20, 0)
    smoke:setPosition(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)

end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.update(dt)
    smoke:update(dt)
end

function love.draw()
    canvas:renderTo(function ()
        love.graphics.clear()
        love.graphics.draw(smoke)
    end)

    love.graphics.draw(canvas)
    love.graphics.draw(smoke, love.graphics.getWidth() / 3)
end
