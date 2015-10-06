# 'constrainToCircle' module v1.0
# by Marc Krenn, Sept. 2015 | marc.krenn@gmail.com | @marc_krenn
# probs to Tisho Georgiev and Brian M. Scott
#
# Add the following line to your project in Framer Studio. 
# constrainToCircle = require "constrainToCircle"

d = 0.0
vX = 0.0
vY = 0.0
magV = 0.0
aX = 0.0
layerAnimates = false

# Enables dragging and constrains dragging-distance to a defined circle
exports.enable = (layer,circleCenterX,circleCenterY,radius) ->
        
    helper = layer.copy()
    helper.name = "circleConstraintHelper"
    helper.opacity = 0
    helper.index = layer.index + 1
    helper.draggable.enabled = true
    helper.draggable.momentum = false
    
    exports.helper = helper  
    exports.isDragging = false
    exports.velocityX = 0
    exports.velocityY = 0
                
    helper.on Events.DragStart, ->
        
        layerAnimates = false
        layer.animateStop()
        
        layer.emit Events.DragStart
        exports.isDragging = true
                           
    helper.on Events.DragMove, ->
               
        layer.emit Events.DragMove
        
        exports.velocityX = helper.draggable.velocity.x
        exports.velocityY = helper.draggable.velocity.y
        exports.isDragging = true
        
        d = (helper.x - circleCenterX) ** 2 + (helper.y - circleCenterY) ** 2
                
        if d > radius ** 2
            vX = helper.x - circleCenterX
            vY = helper.y - circleCenterY
            magV = Math.sqrt(vX*  vX + vY * vY)
            aX = circleCenterX + vX / magV * radius
            aY = circleCenterY + vY / magV * radius
		
            layer.x = aX
            layer.y = aY
            
        else
            layer.x = helper.x
            layer.y = helper.y
                                
    helper.on Events.DragEnd, ->
        
        layer.emit Events.DragEnd
        
        exports.isDragging = false
        exports.velocityX = 0
        exports.velocityY = 0
        
        helper.x = layer.x
        helper.y = layer.y
    
    layer.on Events.AnimationStart, ->
        layerAnimates = true

    layer.on Events.AnimationEnd, ->
        layerAnimates = false    
    
    layer.on "change:frame", ->
                 
        if layerAnimates == true
            helper.x = layer.x
            helper.y = layer.y
            helper.width = layer.width
            helper.height = layer.height
            helper.rotation = layer.rotation
            helper.index = layer.index + 1
    
    
    # Updates
    exports.update = (layer,circleCenterX,circleCenterY,radius) ->
        
        helper.destroy()
        exports.enable(layer,circleCenterX,circleCenterY,radius)
        
    # Disables dragging
    exports.disable = (layerA) ->
        
        helper.destroy()