## framer-constrainToCircle
Makes a layer draggable and constrains its „draggability“ to a defined circle.


#### Demo

![gif](http://i.giphy.com/3oEduEH7JgcM3Jh8sM.gif)

*Live Demo*: http://share.framerjs.com/z37yx6kb4mb7/


#### Getting started

```CoffeeScript
# Include module
constrainToCircle = require „constrainToCircle“

# enables dragging for ‚layer‘ and constrains its movement to a circle
constrainToCircle.enable(layer,circleCenterX,circleCenterY,radius)

# updates an existing constrainToCircle-layer
constrainToCircle.update(layer,circleCenterX,circleCenterY,radius)

# disables dragging for ‚layer‘
constrainToCircle.disable(layer)
```