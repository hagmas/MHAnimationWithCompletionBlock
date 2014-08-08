# MHAnimationWithCompletionBlock

This small framework lets you set the completion block to the CAAnimation object directly and *might* improve the comprehensibility of your animation code. 

##Background
There are two most well-known ways to get notified of the completion of CAAnimation, the first one is to use the delegate method of the class and the second one is to use the function setCompletionBlock of CATransaction. However, I personally think that both of them are not really perfect solutions since the former one requires you to write animation objects and the completion logic at the different place in the code and end up with code fragmentation, and the second one dupilicates the CATransaction start and commit statement every time you add the animation object to the CALayer. This framework adds the property "completionBlock" to the CAAnimation object and automatically sets the completion block before using CATransaction before the animation object was added to the layer using method swezzling and let you write the CAAnimation code simpler.

##Usage
1. Add the following line in the podfile and include this framework in your project.
2. Import "MHAnimationWithCompletionBlock.h" wherever you need.
3. Set the completion block to the CAAniamtion object and add it to the CALayer to start the animation.
