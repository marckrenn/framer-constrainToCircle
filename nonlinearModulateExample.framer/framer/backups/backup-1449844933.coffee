



# Set background
bg = new BackgroundLayer backgroundColor: "#28affa"

# Create slider
slider = new SliderComponent
	y: 300
	width: 470
	min: 0
	max: 100

slider.centerX()


# Create layers
container = new Layer #purely esthetical 
	width: 500
	height: 500
	backgroundColor: "rgba(255,255,255,0.2)"
	borderRadius: 12.5

container.center()



layerA = new Layer
	height: 30
	width: 30
	borderRadius: "100%"
	backgroundColor: "white"
	x: slider.knob.screenFrame.x
	maxY: container.maxY



slider.on "change:value", ->
	print slider.knob.midX
	layerA.x = slider.knob.screenFrame.x
	
	layerA.maxY = Utils.