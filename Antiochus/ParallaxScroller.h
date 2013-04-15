//
//  ParallaxScroller.h
//  Antiochus
//
//  Created by Brandon Ramirez on 2/8/13.
//
//

@class Building;
@interface ParallaxScroller : NSObject

// Contains all the background objects
@property NSMutableArray *backgroundLayers;

// Array that holds the building objects
@property NSMutableArray *Buildings;

@property BOOL buildingReady;

@property id parentClass;

-(id)initWithParent:(id)parent;

// Adds a background to the Parallax
-(void)addBackground:(NSString *)spriteFileName withSpeed:(int *)scrollSpeed;

-(void)addBuilding;

-(void)update:(float)dt;

@end