## framer-nonlinearModulate
‚nonlinearModulate‘ extends ‚Utils.modulate‘ with the ability to interpolate a value in a non-liniar way.


#### Demo

![gif](http://i.giphy.com/3o8dp4wXUMBJSGpesE.gif)

*Live Demo*: http://share.framerjs.com/wd6zgrvhwfus/


#### Getting started

```CoffeeScript
# Copy ‚nonlinearModulate.coffee’ into your project’s ‚modules‘-folder

# Include module
require „nonlinearModulate“

# Use it like the regular ‚Utils.modulate‘
Utils.modulate(value, [a, a], [b, b], limit) # … linear, limit = false
Utils.modulate(value, [a, a], [b, b], curve) # … curve, limit = false
Utils.modulate(value, [a, a], [b, b], curve, limit) # … curve, limit = true/false

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

```