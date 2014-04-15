//
//  PBChooseOrientationViewController.m
//  ParallaxBackground
//
//  Created by Nacho on 15/04/14.
//  Copyright (c) 2014 Ignacio Nieto Carvajal. All rights reserved.
//

#import "PBChooseOrientationViewController.h"
#import "PBViewController.h"

#define kPBDeveloperSite    @"http://digitalleaves.com"
#define kPBSegueHorizontal  @"Horizontal"
#define kPBSegueVertical    @"Vertical"


@interface PBChooseOrientationViewController ()

@end

@implementation PBChooseOrientationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark button actions

- (IBAction)aboutTheDeveloperButtonTouched:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kPBDeveloperSite]];
}

#pragma mark segues

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kPBSegueHorizontal]) {
        PBViewController * pbvc = (PBViewController *) segue.destinationViewController;
        pbvc.direction = kPBParallaxBackgroundDirectionLeft;
    } else if ([segue.identifier isEqualToString:kPBSegueVertical]) {
        PBViewController * pbvc = (PBViewController *) segue.destinationViewController;
        pbvc.direction = kPBParallaxBackgroundDirectionDown;
    }
}


@end














