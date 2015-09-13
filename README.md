## framer-constrainToCircle
‚constrainToCircle‘ is a module that enables dragging for a layer and constrains its movement to a circle.


#### Demo

![gif](http://i.giphy.com/3oEduEH7JgcM3Jh8sM.gif)

*Live Demo*: http://share.framerjs.com/z37yx6kb4mb7/


#### Getting started

```CoffeeScript
# Copy ‚constrainToCircle.coffee’ into your project’s ‚modules‘-folder

# Include module
constrainToCircle = require „constrainToCircle“

# enables dragging for ‚layer‘ and constrains its movement to a circle
constrainToCircle.enable(layer,circleCenterX,circleCenterY,radius)

# updates an existing constrainToCircle-layer
constrainToCircle.update(layer,circleCenterX,circleCenterY,radius)

# disables dragging for ‚layer‘
constrainToCircle.disable(layer)

# variables: values from the invisible ‚helper’-layer
constrainToCircle.isDragging # returns true/false
constrainToCircle.velocityX # returns float
constrainToCircle.velocityY # returns float

```