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
    
   
    UIBezierPath *finalPath = [UIBezierPath new];
//    self.drawingLayer = [[CAShapeLayer alloc] init];
//    self.drawingLayer.strokeStart = 0.0;
//    self.drawingLayer.strokeEnd = 1.0;
//    self.drawingLayer.fillColor = [UIColor clearColor].CGColor;
//    self.drawingLayer.strokeColor = [UIColor colorNamed:@"Chill Sky"].CGColor;
    int counter = 0;
    for (UIBezierPath *path in self.selectedPath) {
        if (counter == 3) {
            counter = 0;
        }
        CAShapeLayer *layer = [[CAShapeLayer alloc]init];
        layer.strokeStart = 0.0;
        layer.strokeEnd = 0.0;
        NSString *colorString = [[sharedManager colors] objectAtIndex:counter];
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.strokeColor = [UIColor colorNamed:colorString].CGColor;
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
    NSLog(@"%lu", (unsigned long)self.layers.count);
    MyManager *sharedManager = [MyManager sharedManager];
    double timeMultiplier = [sharedManager time];
//    self.drawingLayer.strokeEnd += 1.0/(60.0 * timeMultiplier);
    int completedLayers = 0;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
