//
//  PBParallaxBackground.h
//
// The MIT License (MIT)
//
// Copyright (c) 2013 Ignacio Nieto Carvajal
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import <SpriteKit/SpriteKit.h>

#define kPBParallaxBackgroundDefaultSpeedDifferential   0.90
#define kPBParallaxBackgroundDefaultSpeed 2

typedef enum {
    kPBParallaxBackgroundDirectionUp = 0,
    kPBParallaxBackgroundDirectionDown,
    kPBParallaxBackgroundDirectionRight,
    kPBParallaxBackgroundDirectionLeft
} PBParallaxBackgroundDirection;

@interface PBParallaxScrolling : SKSpriteNode

/** @brief Designated initializer for the parallax backgorund. 
 * Creates and initializes a new parallax background of certain size, with some images, an initial velocity and a differential of this velocity to each background.
 * @param backgrounds a NSArray of the backgrounds, expressed as either NSStrings (containing the name of the image to use), UIImages (with the image used to build the texture), SKTexture (with the textures to build the SKNodes) or SKNodes. They must be ordered from foreground to background, i.e: the closer element must be the first one in the array.
 * @param the direction of the parallax movement (up, down, right or left).
 * @param velocity the velocity of the fastest (= nearest) backgound.
 * @param differential a differential decrease to be applied to each following background, expressed as a float from 0 (every background moves at the same speed) to 1 (each backgrounds moves at half the speed of the previous (=closer) one).
 */
- (id) initWithBackgrounds: (NSArray *) backgrounds size: (CGSize) size direction: (PBParallaxBackgroundDirection) direction fastestSpeed: (CGFloat) speed andSpeedDecrease: (CGFloat) differential;

/** This method, called once in every game loop, will adjust the relative position of the nodes in the parallax background set */
- (void) update: (NSTimeInterval) currentTime;

/** reverse the direction of the movement, left->right, right->left, up->down, down->up */
- (void) reverseMovementDirection;

/** Debug method for watching the positions of the backgrounds at a given time. */
- (void) showBackgroundPositions;
@end
