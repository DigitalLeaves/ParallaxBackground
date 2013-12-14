ParallaxBackground
==================

ParallaxBackground allows you to integrate a parallax background effect in your SpriteKit games.

Usage
=====

It is really easy to integrate the parallax background into your project. You just need to copy the files PBParallaxBackground.m and PBParallaxBackground.h in your Xcode project.

You should initialize and insert the PBParallaxBackground in the scene initialization:

```
NSArray * imageNames = @[@"pForeground", @"pMiddle", @"pBackground"];
PBParallaxBackground * parallax = [[PBParallaxBackground alloc] initWithBackgrounds:imageNames size:size direction:kPBParallaxBackgroundDirectionLeft fastestSpeed:kPBParallaxBackgroundDefaultSpeed andSpeedDecrease:kPBParallaxBackgroundDefaultSpeedDifferential];
self.parallaxBackground = parallax;
[self addChild:parallax];
```     
You must specify a NSArray of either images, NSStrings (containing valid image names included in the bundle), SKSpriteNodes or SKTextures.

"direction" represents the direction of the parallax movement, and can be either kPBParallaxBackgroundDirectionUp, kPBParallaxBackgroundDirectionDown, kPBParallaxBackgroundDirectionRight or kPBParallaxBackgroundDirectionLeft.

the fastestSpeed refers to the speed of the fastest element. Nice values are between 1 and 4.

the speedDecrease is a number between 0 and 1. The bigger the speed decrease, the slower each layer of the parallax will go. A speed decrease of 0 means no speed decrease (i.e: all layers will move at the same speed) whereas a speed decrease of 1 means that every layer will move at half the speed of the immediatly faster layer.

Then in your scene update method, you just need to call:

```
-(void)update:(CFTimeInterval)currentTime {
    ...
    [self.parallaxBackground update:currentTime];
}
```

It is that simple. If you find it useful, please let me know. Thanks!

License
=======

The MIT License (MIT)

Copyright (c) 2013 Ignacio Nieto Carvajal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
