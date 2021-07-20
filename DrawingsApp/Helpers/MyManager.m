//
//  NSObject+PaletteStore.m
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 18.07.2021.
//

#import "MyManager.h"

@implementation MyManager

@synthesize someProperty;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static MyManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.colors = [NSMutableArray new];
        [sharedMyManager.colors addObject:@"Black"];
        [sharedMyManager.colors addObject:@"Black"];
        [sharedMyManager.colors addObject:@"Black"];
        sharedMyManager.toggledButtons = [NSMutableArray new];
    });
    return sharedMyManager;
}

- (id)init {
  if (self = [super init]) {
      someProperty = @"Default Property Value";
  }
  return self;
}

- (void)dealloc {
  // Should never be called, but just here for clarity really.
}

@end
