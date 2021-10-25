function lovr.load()
  models = {
    left = lovr.headset.newModel('hand/left', {animated=true}),
    right = lovr.headset.newModel('hand/right', {animated=true})
  }
end

function lovr.draw()
  for hand, model in pairs(models) do
    if lovr.headset.isTracked(hand) then
      lovr.headset.animate('hand/'..hand, model)
      model:draw(mat4(lovr.headset.getPose(hand)))
    end
  end
  lovr.graphics.print('hello world', 0, 1.7, -3, .5)
end
