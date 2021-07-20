//
//  NSObject+PaletteStore.h
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 18.07.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface MyManager : NSObject {
    NSString *someProperty;
}

@property (nonatomic, retain) NSString *someProperty;
@property (nonatomic, retain) NSMutableArray *colors;
@property (nonatomic, retain) NSMutableArray *toggledButtons;
@property (nonatomic) double time;

+ (id)sharedManager;

@end

NS_ASSUME_NONNULL_END
