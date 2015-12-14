## framer-nonlinearModulate
‚nonlinearModulate’ extends ‚Utils.modulate‘ with the ability to interpolate a value in a non-linear way.


#### Demo

![gif](http://i.giphy.com/d2YW1MQy30hoZdMQ.gif)

*Live Demo*: http://share.framerjs.com/ob5c22zymlzt/


#### Getting started

```CoffeeScript
# Copy ‚nonlinearModulate.coffee’ into your project’s ‚modules‘-folder

# Include module
require „nonlinearModulate“

# Use it it like a regular Utils.modulate()
# Syntax:
# Utils.modulate(value, [a, a], [b, b], limit) ... linear, limit = false
# Utils.modulate(value, [a, a], [b, b], curve) ... curve, limit = false
# Utils.modulate(value, [a, a], [b, b], curve, limit) ... curve, limit = true/false
# Utils.modulate(value, [a, a], [b, b], curve, limit, easeBackMultiplier) ... curve, limit = true/false, easeBackMultiplier (default: 1.70158)

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

```