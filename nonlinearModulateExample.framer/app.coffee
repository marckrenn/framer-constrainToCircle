# 'nonlinearModulate' module example project
# by Marc Krenn, Dec. 14th, 2015 | marc.krenn@gmail.com | @marc_krenn

# 'nonlinearModulate' extends 'Utils.modulate' with the ability to interpolate a value in a non-linear way.

require "nonlinearModulate"

# Utils.modulate(value, [a, a], [b, b], limit) ... linear, limit = false
# Utils.modulate(value, [a, a], [b, b], curve) ... curve, limit = false
# Utils.modulate(value, [a, a], [b, b], curve, limit) ... curve, limit = true/false
# Utils.modulate(value, [a, a], [b, b], curve, limit, easeBackMultiplier) ... curve, limit = true/false, easeBackMultiplier (default: 1.70158)

curve = "easeInOutExpo"

# Accepted curve-types (see: http://easings.net/en):
#
# linear
# easeInSine, easeOutSine, easeInOutSine
# easeInQuad/ease-in, easeOutQuad/ease-out, easeInOutQuad/ease-in-out
# easeInCubic, easeOutCubic, easeInOutCubic
# easeInQuart, easeOutQuart, easeInOutQuart
# easeInQuint, easeOutQuint, easeInOutQuint
# easeInExpo, easeOutExpo, easeInOutExpo
# easeInCirc, easeOutCirc, easeInOutCirc
# easeInBack, easeOutBack, easeInOutBack
# easeInElastic, easeOutElastic, easeinOutElastic*
# easeInBounce, easeOutBounce, easeInOutBounce

# * not yet supported



# --------------------------------------



# Variables
plots = []
plotsCount = 200
gray = "#24272c"


# Set background
bg = new BackgroundLayer backgroundColor: "#1a1c20"

# Create slider
slider = new SliderComponent
	y: Screen.height / 3 * 2.5
	width: 470
	min: 0
	max: 100
	backgroundColor: "#16171b"	

slider.knobSize = 65
slider.fill.backgroundColor = gray
slider.knob.backgroundColor = "#b71c1c"
slider.knob.shadowColor = "rgba(0,0,0,0.2)"
slider.knob.shadowBlur = 10
slider.knob.shadowY = 3

slider.centerX()



# Create layers
plotContainer = new Layer
	width: Screen.width
	height: Screen.height / 3
	backgroundColor: gray

plotContainer.center()

plot = new Layer
	height: 100
	width: 100
	originX: 0
	originY: 1
	scale: 0.30
	borderRadius: "100%"
	backgroundColor: "white"
	maxY: plotContainer.maxY

topLayer = new Layer
	height: 150
	width: 150
	backgroundColor: "white"
	midY: Screen.height / 3 * 0.5
	borderRadius: 25

topLayer.centerX()



# Plot diagram
for i in [0..plotsCount]
	p = plots[i] = new Layer
		height: 12
		width: 12
		x: Utils.modulate(i,[0,plotsCount],[Screen.width/2 - 100, Screen.width/2 + 100])
		midY: Utils.modulate(i,[0,plotsCount],[Screen.height/2 + 50, Screen.height/2 - 50],curve,false)
		borderRadius: "100%"
		name: "p" + i
		index: -i
		backgroundColor: "#16171b"


plotContainer.sendToBack()
bg.sendToBack()



# Modulate on slider.change
slider.on "change:value", ->

	#plot.copy() # de-comment for debug trail

	plot.x = Utils.modulate(@value,[slider.min,slider.max],[0,Screen.width - plot.width])
	plot.midY = Utils.modulate(@value,[slider.min,slider.max],[plotContainer.maxY - plot.height/2, plotContainer.minY + plot.height/2],curve)

	plot.scale = Utils.modulate(@value,[slider.min,slider.max],[0.3,1],curve)

	topLayer.rotation = Utils.modulate(@value,[slider.min,slider.max],[0,180],curve)

