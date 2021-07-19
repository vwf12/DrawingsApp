//
//  ViewController.h
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 16.07.2021.
//

#import <UIKit/UIKit.h>
//#import <DrawingsApp-Swift.h>

@protocol DrawingViewDelegate <NSObject>

-(void)drawingComplete;
@property (nonatomic) NSNumber *selectedPicture;
-(void)readyToDraw;

@end

@interface ViewController : UIViewController <UIViewControllerTransitioningDelegate, DrawingViewDelegate>
@property (nonatomic) NSNumber *selectedPicture;
- (void)selectedDrawing:(NSNumber *)drawing;
-(void)drawingComplete;
-(void)readyToDraw;

@end

