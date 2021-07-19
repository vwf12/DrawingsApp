//
//  CustomButton.m
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 17.07.2021.
//

#import "CustomButton.h"

@implementation CustomButton

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 10;
//    self.layer.borderWidth = 1;
//    [self.layer setBorderColor:[UIColor colorWithWhite:0.0f alpha:0.25f].CGColor];
//    [self.layer setBorderWidth:1.5];
//    [self.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];
//    self.layer.shadowRadius = 2;
//    self.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.layer.shadowOpacity = 0.25f;
    self.layer.shadowRadius = 1;
    self.layer.backgroundColor = UIColor.whiteColor.CGColor;
    [self.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.layer setShadowOpacity:0.25];
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    [self setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateHighlighted];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
        [self.layer setShadowColor:[[UIColor colorNamed:@"Light Green Sea"] CGColor]];
        [self.layer setShadowOpacity:1.0];
        self.layer.shadowRadius = 2;
    } else {
        [self.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [self.layer setShadowOpacity:0.25];
        self.layer.shadowRadius = 1;
    }
}

- (void) setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (enabled) {
        self.layer.opacity = 1.0;
    } else {
        self.layer.opacity = 0.5;
    }
}

@end
