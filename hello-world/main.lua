function lovr.load()
  models = {
    left = lovr.headset.newModel('hand/left', {animated=true}),
    right = lovr.headset.newModel('hand/right', {animated=true})
  }
  skycube = lovr.graphics.newTexture({
    left =   'textures/skyboxes/space/left.png',
    right =  'textures/skyboxes/space/right.png',
    top =    'textures/skyboxes/space/top.png',
    bottom = 'textures/skyboxes/space/bottom.png',
    front =  'textures/skyboxes/space/front.png',
    back =   'textures/skyboxes/space/back.png'
  })
end

function lovr.draw()
  lovr.graphics.skybox(skycube)
  for hand, model in pairs(models) do
    if lovr.headset.isTracked(hand) then
      lovr.headset.animate('hand/'..hand, model)
      model:draw(mat4(lovr.headset.getPose(hand)))
    end
  end
  lovr.graphics.print('hello world', 0, 1.7, -3, .5)
end
