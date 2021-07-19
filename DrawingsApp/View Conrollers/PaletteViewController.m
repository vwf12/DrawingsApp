//
//  PaletteViewController.m
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 18.07.2021.
//

#import "PaletteViewController.h"
#import "CustomButton.h"
#import "PaletteButton.h"
#import "MyManager.h"

@interface PaletteViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet PaletteButton *palette1;
@property (weak, nonatomic) IBOutlet PaletteButton *palette2;
@property (weak, nonatomic) IBOutlet PaletteButton *palette3;
@property (weak, nonatomic) IBOutlet PaletteButton *palette4;
@property (weak, nonatomic) IBOutlet PaletteButton *palette5;
@property (weak, nonatomic) IBOutlet PaletteButton *palette6;
@property (weak, nonatomic) IBOutlet PaletteButton *palette7;
@property (weak, nonatomic) IBOutlet PaletteButton *palette8;
@property (weak, nonatomic) IBOutlet PaletteButton *palette9;
@property (weak, nonatomic) IBOutlet PaletteButton *palette10;
@property (weak, nonatomic) IBOutlet PaletteButton *palette11;
@property (weak, nonatomic) IBOutlet PaletteButton *palette12;

@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = 40;
    self.view.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    self.view.layer.shadowRadius = 4;
    [self.view.layer setShadowOffset:CGSizeZero];
    [self.view.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.view.layer setShadowOpacity:0.25];
    self.palette1.delegate = self;
    self.palette2.delegate = self;
    self.palette3.delegate = self;
    self.palette4.delegate = self;
    self.palette5.delegate = self;
    self.palette6.delegate = self;
    self.palette7.delegate = self;
    self.palette8.delegate = self;
    self.palette9.delegate = self;
    self.palette10.delegate = self;
    self.palette11.delegate = self;
    self.palette12.delegate = self;
}
- (IBAction)saveAction:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void)checkForUntoggle {
    MyManager *sharedManager = [MyManager sharedManager];
    NSLog(@"%@", sharedManager.toggledButtons);
    if (sharedManager.toggledButtons.count == 4) {
        NSString *buttonToUntoggle =  [sharedManager.toggledButtons objectAtIndex:0];
        NSLog(@"%@", buttonToUntoggle);
        [[NSNotificationCenter defaultCenter]
                postNotificationName:buttonToUntoggle
                object:self];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
