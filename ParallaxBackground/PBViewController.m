//
//  PBViewController.m
//  ParallaxBackground
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

#import "PBViewController.h"

@interface PBViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation PBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SKView * skView = (SKView *) self.view;
    if ([skView.scene isKindOfClass:[PBMyScene class]]) {
        PBMyScene * pbms = (PBMyScene *) skView.scene;
        pbms.direction = self.direction;
    }

}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    if (!skView.scene) { // because viewWillLayoutSubviews is called twice!
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        // Create and configure the scene.
        SKScene * scene = [[PBMyScene alloc] initWithSize:skView.bounds.size andDirection:self.direction];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        // Present the scene.
        [skView presentScene:scene];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if (self.direction == kPBParallaxBackgroundDirectionRight || self.direction == kPBParallaxBackgroundDirectionLeft) {
        return UIInterfaceOrientationMaskLandscape;
    } else return UIInterfaceOrientationMaskPortrait;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark button actions

- (IBAction)backButtonTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
