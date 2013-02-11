//
//  ParallaxScroller.m
//  Antiochus
//
//  Created by Brandon Ramirez on 2/8/13.
//
//

#import "ParallaxScroller.h"
#import "GameScene.h"

@implementation ParallaxScroller

// NSMutableArray that holds the background parallax objects
@synthesize backgroundLayers;

@synthesize parentClass;

-(id)initWithParent:(id)parent{
    
    if( [self init] ){
        
        parentClass = parent;
        backgroundLayers = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addBackground:(NSString *)spriteFileName withSpeed:(int *)scrollSpeed {
    
    // Create a new Parallax Layer
    ParallaxLayer *layer = [[ParallaxLayer alloc] initWithImage:spriteFileName withSpeed:scrollSpeed];
    
    // Add the parallax layer to the end of the NSMutableArray
    [backgroundLayers addObject:layer];
    
    // Add the images as a child to the parent class
    [parentClass addChild:layer.backgroundSprite];
    [parentClass addChild:layer.offScreenSprite];
    DLog(@"Added stuff");
    
}

-(void)update:(ccTime)dt{
    for (int i = 0; i < [backgroundLayers count]; i++) {
        [[backgroundLayers objectAtIndex:i] moveLayers:dt];
    }
}


@end
