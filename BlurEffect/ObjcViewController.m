//
//  ObjcViewController.m
//  BlurEffect
//
//  Created by Piotr Debosz on 14/06/2014.
//  Copyright (c) 2014 Piotr Debosz. All rights reserved.
//

#import "ObjcViewController.h"

@interface ObjcViewController()

@property (weak, nonatomic) IBOutlet UIView *squareView;
@property (weak, nonatomic) IBOutlet UIView *blurView;

@property (assign, nonatomic) BOOL shouldAnimate;

@end

@implementation ObjcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBlurEffect *visualEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:visualEffect];
    visualEffectView.frame = self.blurView.bounds;
        
    [self.blurView addSubview:visualEffectView];
    [self.blurView sendSubviewToBack:visualEffectView];
}

- (IBAction)showBlurView:(id)sender {
    self.squareView.hidden = FALSE;
    self.blurView.hidden = FALSE;
    self.shouldAnimate = TRUE;
    [self animateSquare];
}

- (IBAction)hideBlurView:(id)sender {
    self.squareView.hidden = TRUE;
    self.blurView.hidden = TRUE;
    self.shouldAnimate = FALSE;
}

- (void)animateSquare {
    if (!self.shouldAnimate) {
        return;
    }
    
    CGFloat randomX = arc4random() % 320;
    CGFloat randomY = arc4random() % 568;
    NSTimeInterval duration = 1.0;
    
    [UIView animateWithDuration:duration animations:^{
        [self.squareView setFrame:CGRectMake(randomX,
                                            randomY,
                                            self.squareView.frame.size.width,
                                            self.squareView.frame.size.height)];
    } completion:^(BOOL finished) {
        [self animateSquare];
    }];
}

@end