//
//  DrawingView.h
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 19.07.2021.
//

#import <UIKit/UIKit.h>
#import "MyManager.h"
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DrawingView : UIView
@property (weak, nonatomic) UIViewController <DrawingViewDelegate> *delegate;
@property (assign, nonatomic) NSNumber *selectedDrawing;
@property (assign, nonatomic) NSInteger progress;
@property (nonatomic, retain) CAShapeLayer *drawingLayer;
@property (assign, nonatomic) MyManager *sharedManager;
@property (weak, nonatomic) NSTimer *drawingTimer;
@property (retain, nonatomic) NSMutableArray *layers;
@property (retain, nonatomic) NSArray *selectedPath;
-(void)drawImage;
-(void)resetState;
-(UIImage *)renderImage;
-(int)getRandomNumberBetween:(int)from and:(int)to;

@end

NS_ASSUME_NONNULL_END
