## framer-constrainToCircle
Makes a layer draggable and constrains its „draggability“ to a defined circle.

#### Demo

![Video](http://giphy.com/gifs/26BkNVMxvNBO6RluM/html5)

![Live Demo](http://share.framerjs.com/z37yx6kb4mb7/)

#### Getting started

```CoffeeScript
# Include module
constrainToCircle = require „constrainToCircle“

# enables dragging within a circle
constrainToCircle.enable(layer,circleCenterX,circleCenterY,radius)

# updates a constrainToCircle-layer
constrainToCircle.update(layer,circleCenterX,circleCenterY,radius)

# disables dragging constrainToCircle functionality
constrainToCircle.disable(layer)
```

