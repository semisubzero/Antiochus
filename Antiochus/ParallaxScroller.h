//
//  ParallaxScroller.h
//  Antiochus
//
//  Created by Brandon Ramirez on 2/8/13.
//
//

#import "CCLayer.h"
#import "ParallaxLayer.h"

@interface ParallaxScroller : NSObject

// Contains all the background objects
@property NSMutableArray *backgroundLayers;

@property id parentClass;

-(id)initWithParent:(id)parent;

// Adds a background to the Parallax
-(void)addBackground:(NSString *)spriteFileName withSpeed:(int *)scrollSpeed;

-(void)update:(float)dt;

@end