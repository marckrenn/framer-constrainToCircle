# 'nonlinearModulate' module
# by Marc Krenn, Dec. 13th, 2015 | marc.krenn@gmail.com | @marc_krenn
#
# 'nonlinearModulate' extends 'Utils.modulate' with the ability to interpolate a value in a non-liniar way.
#
# 
# Utils.modulate(value, [a, a], [b, b], limit) ... linear, limit = false
# Utils.modulate(value, [a, a], [b, b], curve) ... curve, limit = false
# Utils.modulate(value, [a, a], [b, b], curve, limit) ... curve, limit = true/false
#
#
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
#
#
# for a visual representation see: http://easings.net/en
#
# easeElastic,easeBack, easeBounce are NOT implemented, yet
# Add the following line to your project in Framer Studio. 
# '   require "nonlinearModulate"   '


Utils.modulate = (value, rangeA, rangeB, curve="linear", limit=false) ->

	[fromLow, fromHigh] = rangeA
	[toLow, toHigh] = rangeB

	# curve formulas by http://gizma.com/easing/

	# t = current
	# b = start value
	# c = change in value
	# d = duration

	if toLow > toHigh

		t = value
		b = toLow
		c = toHigh - toLow
		d = fromHigh
		i = 1

	else

		t = value
		b = toLow
		c = toLow - toHigh
		d = fromHigh
		i = -1


	if curve is "linear"

		result = c*t/d*i + b


	else if curve is "easeInQuad" or curve is "ease-in"

		t /= d
		result = c*t*t* +i + b


	else if curve is "easeOutQuad" or curve is "ease-out"

		t /= d
		result = -c * t*(t-2)*i + b


	else if curve is "easeInOutQuad" or curve is "ease-in-out"

		t /= d/2

		if t < 1

			result = c/2*t*t*i + b

		else

			t--
			result = -c/2 * (t*(t-2) - 1)*i + b


	else if curve is "easeInCubic"

		t /= d
		result = c*t*t*t*i + b


	else if curve is "easeOutCubic"

		t /= d
		t--
		result = c*(t*t*t + 1)*1 + b


	else if curve is "easeInOutCubic"
	
		t /= d/2

		if t < 1

			result = c/2*t*t*t*i + b

		else

			t -= 2
			result = c/2*(t*t*t + 2)*i + b


	else if curve is "easeInQuart"

		t /= d
		result = c*t*t*t*t*i + b


	else if curve is "easeOutQuart"

		t /= d
		t--
		result = -c * (t*t*t*t - 1)*i + b


	else if curve is "easeInOutQuart"

		t /= d/2

		if t < 1

			result = c/2*t*t*t*t*i + b

		else

			t -= 2
			result = -c/2 * (t*t*t*t - 2)*i + b


	else if curve is "easeInQuint"

		t /= d
		result = c*t*t*t*t*t*i + b


	else if curve is "easeOutQuint"

		t /= d
		t--
		result = c*(t*t*t*t*t + 1)*i + b


	else if curve is "easeInOutQuint"

		t /= d/2

		if t < 1

			result = c/2*t*t*t*t*t*i + b

		else

			t -= 2
			result = c/2*(t*t*t*t*t + 2)*i + b


	else if curve is "easeInSine"

		result = -c * Math.cos(t/d * (Math.PI/2))*i + c + b


	else if curve is "easeOutSine"
	
		result = c * Math.sin(t/d * (Math.PI/2))*i + b


	else if curve is "easeInOutSine"
	
		result = -c/2 * (Math.cos(Math.PI*t/d) - 1)*i + b


	else if curve is "easeInExpo"
	
		result = c * Math.pow( 2, 10 * (t/d - 1) )*i + b;


	else if curve is "easeOutExpo"

		result = c * ( -Math.pow( 2, -10 * t/d ) + 1 )*i + b;


	else if curve is "easeInOutExpo"

		t /= d/2

		if t < 1

			result = c/2 * Math.pow( 2, 10 * (t - 1) )*i + b;

		else

			t--
			result = c/2 * ( -Math.pow( 2, -10 * t) + 2 )*i + b;


	else if curve is "easeInCirc"

		t /= d
		result = -c * (Math.sqrt(1 - t*t) - 1)*i + b


	else if curve is "easeOutCirc"

		t /= d
		t--
		result = c * Math.sqrt(1 - t*t)*i + b


	else if curve is "easeInOutCirc"

		t /= d/2

		if t < 1

			result = -c/2 * (Math.sqrt(1 - t*t) - 1)*i + b

		else

			t -= 2
			result = c/2 * (Math.sqrt(1 - t*t) + 1)*i + b


	else if curve is true

		limit = true
		result = c*t/d*i + b


	else if curve is false

		limit = false
		result = c*t/d*i + b



	if limit is true
		if toLow < toHigh
			return toLow if result < toLow
			return toHigh if result > toHigh
		else
			return toLow if result > toLow
			return toHigh if result < toHigh


	return result