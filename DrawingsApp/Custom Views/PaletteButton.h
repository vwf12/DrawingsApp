//
//  PaletteButton.h
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 18.07.2021.
//

#import <UIKit/UIKit.h>
#import "PaletteViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaletteButton : UIButton
@property (nonatomic) IBInspectable NSString *color;
@property (nonatomic) BOOL isToggled;
@property (nonatomic) UIView *colorView;
- (void)timerFired;
@property (nonatomic) PaletteViewController *delegate;
@end

NS_ASSUME_NONNULL_END
