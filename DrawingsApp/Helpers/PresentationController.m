//
//  PresentationController.m
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 18.07.2021.
//

#import "PresentationController.h"

@implementation PresentationController

- (CGRect)frameOfPresentedViewInContainerView {
    CGRect bounds = self.containerView.bounds;
    return CGRectMake(0, bounds.size.height / 2, bounds.size.width, bounds.size.height / 2);
}

@end
