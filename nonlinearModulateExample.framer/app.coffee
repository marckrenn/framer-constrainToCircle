# 'nonlinearModulate' module example project
# by Marc Krenn, Dec. 13th, 2015 | marc.krenn@gmail.com | @marc_krenn

# 'nonlinearModulate' extends 'Utils.modulate' with the ability to interpolate a value in a non-liniar way.

require "nonlinearModulate"

# Utils.modulate(value, [a, a], [b, b], limit) ... linear, limit = false
# Utils.modulate(value, [a, a], [b, b], curve) ... curve, limit = false
# Utils.modulate(value, [a, a], [b, b], curve, limit) ... curve, limit = true/false

curve = "easeInExpo"

# accepted curve-types:
#
# linear
# easeInQuad/ease-in, easeOutQuad/ease-out, easeInOutQuad/ease-in-out
# easeInCubic, easeOutCubic, easeInOutCubic
# easeInQuart, easeOutQuart, easeInOutQuart
# easeInQuint, easeOutQuint, easeInOutQuint
# easeInSine, easeOutSine, easeInOutSine
# easeInExpo, easeOutExpo, easeInOutExpo
# easeInCirc, easeOutCirc, easeInOutCirc

# for a visual representation see: http://easings.net/en

# easeElastic,easeBack, easeBounce are NOT implemented, yet





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
plotContainer = new Layer
	width: 500
	height: 500
	backgroundColor: "rgba(255,255,255,0.1)"
	borderRadius: 12.5

plotContainer.center()

plot = new Layer
	height: 30
	width: 30
	borderRadius: "100%"
	backgroundColor: "white"
	x: slider.knob.screenFrame.x
	maxY: plotContainer.maxY

inverse = new Layer
	backgroundColor: "white"
	borderRadius: 10
	minY: plotContainer.maxY + 100

inverse.centerX()


# Modulate on slider.change
slider.on "change:value", ->

	#plot.copy() #debug

	plot.x = slider.knob.screenFrame.x

	plot.midY = Utils.modulate(@value,[slider.min,slider.max],[plotContainer.maxY - plot.height/2, plotContainer.minY + plot.height/2],curve,true)
	
	inverse.opacity = Utils.modulate(@value,[slider.min,slider.max],[1,0.1],curve,false)