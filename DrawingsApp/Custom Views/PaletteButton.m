//
//  PaletteButton.m
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 18.07.2021.
//

#import "PaletteButton.h"
#import "DrawingsApp-Swift.h"
#import "MyManager.h"

@implementation PaletteButton

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.tag = [self.color intValue];
    [self addTarget:self action: @selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    NSString *tagString = self.color;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
            name:self.color
            object:nil];
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
    CGRect insideColorView = CGRectMake(self.bounds.origin.x + 8, self.bounds.origin.y + 8, 24, 24);
    self.colorView = [[UIView alloc] initWithFrame:insideColorView];
//    colorView.backgroundColor = UIColor.redColor;
    self.colorView.backgroundColor = [UIColor colorNamed:self.color];
    self.colorView.layer.cornerRadius = 6;
    [self.colorView setUserInteractionEnabled:true];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonClicked)];
    [self.colorView addGestureRecognizer:tapGestureRecognizer];
    [self addSubview:self.colorView];
    
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    [self setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateHighlighted];
}

- (void) receiveNotification:(NSNotification *) notification
{

    if ([[notification name] isEqualToString:self.color]) {
        NSLog (@"Successfully received the test notification!");
        [self buttonClicked];
    }
}

-(void)buttonClicked {
    MyManager *sharedManager = [MyManager sharedManager];
    self.isToggled ^= YES;
    NSLog(self.isToggled ? @"Yes" : @"No");
    
    if (self.isToggled == true) {
        
        
        [sharedManager.colors addObject:self.color];
        if (sharedManager.colors.count == 4) {
            [sharedManager.colors removeObjectAtIndex:0];
        }

        [sharedManager.toggledButtons addObject:self.color];
        [self.delegate checkForUntoggle];
        
        
        self.colorView.frame = CGRectMake(self.bounds.origin.x + 2, self.bounds.origin.y + 2, self.bounds.size.width - 4, self.bounds.size.height - 4);
        self.colorView.layer.cornerRadius = 8;
        MyTimer *timer = [[MyTimer alloc] init];
        [timer setDelegateWithButton:self];
        [timer setTimeWithTime:1.0];

        self.superview.backgroundColor = [UIColor colorNamed:self.color];
//        self.layer.shadowRadius = 0.0;
//        self.layer.shadowOpacity = 0.0;
//        self.layer.cornerRadius = 0.0;
//        self.layer.backgroundColor = [UIColor colorNamed:self.color].CGColor;
        [timer startTimer];
        
    } else {
        [sharedManager.toggledButtons removeObject:self.color];
        self.colorView.frame = CGRectMake(self.bounds.origin.x + 8, self.bounds.origin.y + 8, 24, 24);
//        self.colorView.layer.cornerRadius = 6;
        [self setNeedsDisplay];
    }
}

-(void)timerFired {
    NSLog(@"Timer fired");
    NSLog(@"%@", self.superview.backgroundColor.CGColor);
    NSLog(@"%@", [UIColor colorNamed:self.color].CGColor);
    if (self.superview.backgroundColor.CGColor == [UIColor colorNamed:self.color].CGColor) {
        NSLog(@"Check true");
    self.layer.backgroundColor = UIColor.whiteColor.CGColor;
    self.superview.backgroundColor = [UIColor whiteColor];
    self.layer.shadowRadius = 1;
    }
}




@end
