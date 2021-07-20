//
//  DrawingView.m
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 19.07.2021.
//

#import "DrawingView.h"
#import "PathsStorage.h"
#import "MyManager.h"
#import "DrawingsApp-Swift.h"
#import "ViewController.h"
#import "NSMutableArray+Shuffling.h"

@implementation DrawingView

-(void)drawImage {
    MyManager *sharedManager = [MyManager sharedManager];
    self.layers = [[NSMutableArray alloc] init];
    float drawingFrequency = 1.0/60.0;
    
    PathsStorage *paths = [PathsStorage new];
    
    switch ([self.delegate.selectedPicture intValue]) {
        case 1:
            self.selectedPath = [NSArray arrayWithArray:[paths planet]];
            break;
        case 2:
            self.selectedPath = [NSArray arrayWithArray:[paths head]];
            break;
        case 3:
            self.selectedPath = [NSArray arrayWithArray:[paths tree]];
            break;
        case 4:
            self.selectedPath = [NSArray arrayWithArray:[paths landscape]];
            break;
        default:
            break;
    }
    
   


    NSMutableArray *randomColors = [[sharedManager colors] mutableCopy];
    [randomColors shuffle];
    int counter = 0;
    for (UIBezierPath *path in self.selectedPath) {
        if (counter == 3) {
            counter = 0;
        }
        CAShapeLayer *layer = [[CAShapeLayer alloc]init];
        layer.strokeStart = 0.0;
        layer.strokeEnd = 0.0;
        
        
        NSLog(@"%@", randomColors);
        NSString *colorString = [randomColors objectAtIndex:counter];
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.strokeColor = [UIColor colorNamed:colorString].CGColor;
        NSLog(@"Layers color: %@", [UIColor colorNamed:colorString]);
        layer.path = path.CGPath;
        layer.lineCap = kCALineCapRound;
        layer.lineJoin = kCALineJoinRound;
        [self.layers addObject:layer];
        [self.layer addSublayer:layer];
//        [finalPath appendPath:path];
        counter += 1;
    }
//    self.drawingLayer.path = finalPath.CGPath;
//    [self.layer addSublayer:self.drawingLayer];
    self.drawingTimer = [NSTimer scheduledTimerWithTimeInterval:drawingFrequency
                                                                 target:self
                                                               selector:@selector(updateDrawing)
                                                               userInfo:nil
                                                                repeats:true];
}

-(void)updateDrawing {

    MyManager *sharedManager = [MyManager sharedManager];
    double timeMultiplier = [sharedManager time];
//    self.drawingLayer.strokeEnd += 1.0/(60.0 * timeMultiplier);

    for (CAShapeLayer *layer in self.layers) {
        
        layer.strokeEnd += 1.0/(60.0 * timeMultiplier);
    }
    BOOL drawingFinished = true;
    for (CAShapeLayer *layer in self.layers) {
        
        if (layer.strokeEnd < 1.0) {
            drawingFinished = false;
        }
    }
    if (drawingFinished == true) {
        [self.drawingTimer invalidate];
        [self setDrawingTimer:nil];
        [self.delegate drawingComplete];
    }
    
//    if (self.drawingLayer.strokeEnd >= 1.0) {
//    [self.drawingTimer invalidate];
//    }
}

-(void)resetState {
    
//    NSEnumerator *enumerator = [self.layer.sublayers reverseObjectEnumerator];
//    for(CALayer *layer in enumerator) {
//        [layer removeFromSuperlayer];
//    }
    
    for (CAShapeLayer *layer in self.layer.sublayers) {
        while (layer.strokeEnd > 0.0) {
            layer.strokeEnd -= 1.0/(60.0);
        }
    }

    [self.delegate readyToDraw];
    
}

-(UIImage *)renderImage {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 300), true, 0);
//    [self setClipsToBounds:false];
//    [self.layer setMasksToBounds:YES];
    self.layer.cornerRadius = 0.0;
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    self.layer.cornerRadius = 8.0;
        return image;
}

-(int)getRandomNumberBetween:(int)from and:(int)to {

    return (int)from + arc4random() % (to-from+1);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
