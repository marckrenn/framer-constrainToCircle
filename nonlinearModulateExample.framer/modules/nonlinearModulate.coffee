# 'nonlinearModulate' module
# by Marc Krenn, Dec. 14th, 2015 | marc.krenn@gmail.com | @marc_krenn
#
# 'nonlinearModulate' extends 'Utils.modulate' with the ability to interpolate a value in a non-liniar way.
#
# 
# Utils.modulate(value, [a, a], [b, b], limit) ... linear, limit = false
# Utils.modulate(value, [a, a], [b, b], curve) ... curve, limit = false
# Utils.modulate(value, [a, a], [b, b], curve, limit) ... curve, limit = true/false
# Utils.modulate(value, [a, a], [b, b], curve, limit, easeBackMultiplier) ... curve, limit = true/false, easeBackMultiplier (default: 1.70158)
#
#
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
#
# * not yet supported
#
#
# Add the following line to your project in Framer Studio. 
# '   require "nonlinearModulate"   '
#
# curve equations by Robert Prenner (http://gizma.com/easing/) and George McGinley Smith (http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js)




Utils.modulate = (value, rangeA, rangeB, curve="linear", limit=false, multiplier=1.70158) ->


	[fromLow, fromHigh] = rangeA
	[toLow, toHigh] = rangeB


	if toLow > toHigh

		c = toHigh - toLow # toRange delta
		i = 1

	else

		c = toLow - toHigh # toRange delta
		i = -1 # inverse curve



	t = value # to interpolate
	b = toLow # from ...
	d = fromHigh # ... to
	s = multiplier # multiplier for curve type easeBack
	p = 0 # additional variable for curve type easeElastic
	a = c # additional variable for curve type easeElastic




	switch curve


		when "easeInQuad", "ease-in"

			t /= d
			result = c*t*t* +i + b


		when "easeOutQuad", "ease-out"

			t /= d
			result = -c * t*(t-2)*i + b


		when "easeInOutQuad", "ease-in-out"

			t /= d/2

			if t < 1

				result = c/2*t*t*i + b

			else

				t--
				result = -c/2 * (t*(t-2) - 1)*i + b


		when "easeInCubic"

			t /= d
			result = c*t*t*t*i + b


		when "easeOutCubic"

			t /= d
			t--

			result = c*(t*t*t + 1)*i + b


		when "easeInOutCubic"
	
			t /= d/2

			if t < 1

				result = c/2*t*t*t*i + b

			else

				t -= 2
				result = c/2*(t*t*t + 2)*i + b


		when "easeInQuart"

			t /= d
			result = c*t*t*t*t*i + b


		when "easeOutQuart"

			t /= d
			t--
			result = -c * (t*t*t*t - 1)*i + b


		when "easeInOutQuart"

			t /= d/2

			if t < 1

				result = c/2*t*t*t*t*i + b

			else

				t -= 2
				result = -c/2 * (t*t*t*t - 2)*i + b


		when "easeInQuint"

			t /= d
			result = c*t*t*t*t*t*i + b


		when "easeOutQuint"

			t /= d
			t--
			result = c*(t*t*t*t*t + 1)*i + b


		when "easeInOutQuint"

			t /= d/2

			if t < 1

				result = c/2*t*t*t*t*t*i + b

			else

				t -= 2
				result = c/2*(t*t*t*t*t + 2)*i + b


		when "easeInSine"

			result = (-c * Math.cos(t/d * (Math.PI/2)) + c)*i + b


		when "easeOutSine"
	
			result = c * Math.sin(t/d * (Math.PI/2))*i + b


		when "easeInOutSine"
	
			result = -c/2 * (Math.cos(Math.PI*t/d) - 1)*i + b


		when "easeInExpo"
	
			result = c * Math.pow( 2, 10 * (t/d - 1) )*i + b;


		when "easeOutExpo"

			result = c * ( -Math.pow( 2, -10 * t/d ) + 1 )*i + b;


		when "easeInOutExpo"

			t /= d/2

			if t < 1

				result = c/2 * Math.pow( 2, 10 * (t - 1) )*i + b;

			else

				t--
				result = c/2 * ( -Math.pow( 2, -10 * t) + 2 )*i + b;


		when "easeInCirc"

			t /= d
			result = -c * (Math.sqrt(1 - t*t) - 1)*i + b


		when "easeOutCirc"

			t /= d
			t--
			result = c * Math.sqrt(1 - t*t)*i + b


		when "easeInOutCirc"

			t /= d/2

			if t < 1

				result = -c/2 * (Math.sqrt(1 - t*t) - 1)*i + b

			else

				t -= 2
				result = c/2 * (Math.sqrt(1 - t*t) + 1)*i + b


		when "easeInBack"
			
			result = c*(t/=d)*t*((s+1)*t - s)*i + b


		when "easeOutBack"
	
			result = (c*((t=t/d-1)*t*((s+1)*t + s) + 1))*i + b


		when "easeInOutBack"

			if (t/=d/2) < 1

				return c/2*(t*t*(((s*=(1.525))+1)*t - s)) * i + b

			else

				return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2)*i + b


		when "easeInElastic"

			if t==0

				result = b

			if (t/=d)==1

				result = b+c

			if !p

				p=d*.3

			if a < Math.abs(c)

				a=c
				s=p/4


			s = p/(2*Math.PI) * Math.asin (c/a)

			result = -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p ))*i + b


		when "easeOutElastic"

			if t==0

				result = b

			if (t/=d)==1

				result = b+c

			if !p

				p=d*.3

			if a < Math.abs(c)

				a=c
				s=p/4


			s = p/(2*Math.PI) * Math.asin (c/a)

			result = (a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c)*i + b


		when "easeInOutElastic"

			#console.warn("'easeInOutElastic' is not yet supported, curve = linear")
			result = c*t/d*i + b

			###
			if t==0

				result = b

			if (t/=d/2)==2

				result = b+c

			if !p

				p=d*(.3*1.5)

			if a < Math.abs(c)

				a=c
				s=p/4


			s = p/(2*Math.PI) * Math.asin (c/a)

			if t < 1

				result = (-0.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )))*i

			else

			result = (a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c)*i + b
			###


		when "easeInBounce"

			easeOutBounce = (t, b, c, d) ->

				if (t/=d) < (1/2.75)

					return c*(7.5625*t*t) + b

				else if (t < (2/2.75))

					return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b

				else if (t < (2.5/2.75))

					return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b

				else

					return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b


			result = (c - easeOutBounce(d-t, 0, c, d))*i + b


		when "easeOutBounce"

			if (t/=d) < (1/2.75)

				result = c*(7.5625*t*t)*i + b

			else if (t < (2/2.75))

				result = c*(7.5625*(t-=(1.5/2.75))*t + .75)*i + b

			else if (t < (2.5/2.75))

				result = c*(7.5625*(t-=(2.25/2.75))*t + .9375)*i + b

			else

				result = c*(7.5625*(t-=(2.625/2.75))*t + .984375)*i + b


		when "easeInOutBounce"

			easeOutBounce = (t, b, c, d) ->

				if (t/=d) < (1/2.75)

					return c*(7.5625*t*t) + b

				else if (t < (2/2.75))

					return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b

				else if (t < (2.5/2.75))

					return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b

				else

					return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b


			easeInBounce = (t, b, c, d) ->
				return c - easeOutBounce(d-t, 0, c, d) + b


			if t < d/2
				result = (easeInBounce(t*2, 0, c, d) * .5)*i + b
			else
				result = (easeOutBounce(t*2-d, 0, c, d) * .5 + c*.5)*i + b


		when true

			limit = true
			result = c*t/d*i + b


		when false

			limit = false
			result = c*t/d*i + b


		else # fallback = linear

			result = c*t/d*i + b

			# original equation:
			# result = toLow + (((value - fromLow) / (fromHigh - fromLow)) * (toHigh - toLow))




	if limit is true

		if toLow < toHigh

			return toLow if result < toLow
			return toHigh if result > toHigh
	
		else

			return toLow if result > toLow
			return toHigh if result < toHigh


	return result