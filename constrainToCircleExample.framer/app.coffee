# 'constrainToCircle' module example project v1.0
# by Marc Krenn, Sept. 2015 | marc.krenn@gmail.com | @marc_krenn

# Include module
constrainToCircle = require "constrainToCircle"

# Set background
bg = new BackgroundLayer backgroundColor: "#28affa"
bg.bringToFront()

# Create layer
layerA = new Layer
	width: 100
	height: 100
	backgroundColor: "#fff"
	borderRadius: "100%"
	
# Constraints/circle layer
constraints = new Layer 
	width: 400
	height: 400
	backgroundColor: "rgba(255,255,255, 0.2)"
	borderRadius: "100%"
	
# Center layers
constraints.center()
layerA.center()

# Find centerpoint of constraints-layer
circleCenterX = constraints.midX  - (layerA.width/2)
circleCenterY = constraints.midY - (layerA.height/2)

# Enable dragging and constrain dragging-distance to a defined circle
# constrainToCircle.enable(layer,circleCenterX,circleCenterY,radius)
constrainToCircle.enable(layerA,circleCenterX,circleCenterY,constraints.width/2)

# ... can be disabled with
# constrainToCircle.disable(layerA)

# Animate to original position
layerA.on Events.DragEnd, ->
	layerA.animate
		properties:
			x: circleCenterX
			y : circleCenterY
		curve: "spring(300,10,0)"
		
# Update on window-resize
window.onresize = ->	
	constraints.center()
	layerA.center()
	circleCenterX = constraints.midX  - (layerA.width/2)
	circleCenterY = constraints.midY - (layerA.height/2)
	constrainToCircle.update(layerA,circleCenterX,circleCenterY,constraints.width/2)