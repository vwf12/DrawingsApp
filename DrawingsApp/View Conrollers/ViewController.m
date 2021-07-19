//
//  ViewController.m
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 16.07.2021.
//

#import "ViewController.h"
#import "CustomButton.h"
#import "DrawingsApp-Swift.h"
#import "PaletteViewController.h"
#import "PresentationController.h"
#import "MyManager.h"
#import "PathsStorage.h"
#import "DrawingView.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *drawingsBarButton;
@property (weak, nonatomic) IBOutlet DrawingView *animationView;
@property (weak, nonatomic) IBOutlet CustomButton *openPaletteButton;
@property (weak, nonatomic) IBOutlet CustomButton *openTimerButton;
@property (weak, nonatomic) IBOutlet CustomButton *drawButton;
@property (weak, nonatomic) IBOutlet CustomButton *shareButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goToDrawings;
@property (nonatomic) MyManager *sharedManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyManager *sharedManager = [MyManager sharedManager];
    sharedManager.time = 1.0;
    self.selectedPicture = @1;
    // Do any additional setup after loading the view.
    [self setupView];
    
}

-(void) setupView {
    [self.drawingsBarButton setTitleTextAttributes:@{
         NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17.0]
    } forState:UIControlStateNormal];
    [self.drawingsBarButton setTitleTextAttributes:@{
         NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17.0]
    } forState:UIControlStateHighlighted];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17]}];
    self.navigationController.navigationBar.barTintColor = UIColor.whiteColor;
    
    self.animationView.layer.cornerRadius = 8;
    self.animationView.layer.shadowRadius  = 4;
    self.animationView.layer.shadowColor   = [UIColor colorNamed:@"Chill Sky"].CGColor;
    self.animationView.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
    self.animationView.layer.shadowOpacity = 0.25f;
    self.animationView.layer.masksToBounds = NO;
    self.animationView.backgroundColor = UIColor.whiteColor;
    self.drawButton.enabled = false;
//    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.5f, 0);
//    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(viewCheck.bounds, shadowInsets)];
//    viewCheck.layer.shadowPath    = shadowPath.CGPath;
}
- (IBAction)goToDrawingsAction:(id)sender {
    DrawingsViewController *drawings = [self.storyboard instantiateViewControllerWithIdentifier:@"drawings"];
    drawings.delegate = self;
    [self.navigationController pushViewController:drawings animated:true];
}
- (IBAction)openPalette:(id)sender {
    PaletteViewController *palette = [self.storyboard instantiateViewControllerWithIdentifier:@"palette"];
    palette.modalPresentationStyle = UIModalPresentationCustom;
    palette.transitioningDelegate = self;
    
    [self presentViewController:palette animated:YES completion:nil];
}

- (IBAction)openTimer:(id)sender {
    TimerViewController *palette = [self.storyboard instantiateViewControllerWithIdentifier:@"timer"];
    palette.modalPresentationStyle = UIModalPresentationCustom;
    palette.transitioningDelegate = self;
    
    [self presentViewController:palette animated:YES completion:nil];
}


- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source {
    PresentationController *pc = [[PresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return pc;
    
}

-(void) selectedDrawing: (NSNumber*)drawing {
    NSLog(@"%@", drawing);
}

- (IBAction)shareAction:(id)sender {
    MyManager *sharedManager = [MyManager sharedManager];
    NSLog(@"%@", sharedManager.colors);
    NSLog(@"%@", sharedManager.toggledButtons);
    NSLog(@"%f", sharedManager.time);
    PathsStorage *paths = [PathsStorage new];
    NSLog(@"%lu", (unsigned long)[paths.planet count]);
}
- (IBAction)drawAction:(id)sender {
    self.animationView.delegate = self;
    [self.animationView drawImage];
}

-(void)drawingComplete {
    NSLog(@"Drawing done");
}

-(void)readyToDraw {
    self.drawButton.enabled = true;
}


@end
