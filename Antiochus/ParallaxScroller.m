//
//  ParallaxScroller.m
//  Antiochus
//
//  Created by Brandon Ramirez on 2/8/13.
//
//

#import "ParallaxScroller.h"
#import "GameScene.h"
#import "ParallaxLayer.h"
#import "Building.h"

@implementation ParallaxScroller

// NSMutableArray that holds the background parallax objects
@synthesize backgroundLayers;

// NSMutableArray that holds the buildings
@synthesize Buildings;

@synthesize buildingReady;

@synthesize parentClass;

-(id)initWithParent:(id)parent{
    
    if( [self init] ){
        
        parentClass = parent;
        backgroundLayers = [[NSMutableArray alloc] init];
        Buildings = [[NSMutableArray alloc] init];
    }
    return self;
}

// Create and add a parallax layer to the array
-(void)addBackground:(NSString *)spriteFileName withSpeed:(int *)scrollSpeed {
    
    // Create a new Parallax Layer
    ParallaxLayer *layer = [[ParallaxLayer alloc] initWithImage:spriteFileName withSpeed:scrollSpeed];
    
    // Add the parallax layer to the end of the NSMutableArray
    [backgroundLayers addObject:layer];
    
    // Add the images as a child to the parent class
    [parentClass addChild:layer.backgroundSprite];
    [parentClass addChild:layer.offScreenSprite];    
}

// Creates a building and adds it to the parallax scrolling queue
-(void)addBuilding{
    // Set the min & max building widths
    int maxWidth = 8;
    int minWidth = 3;
    
    // Set the min & max building heights
    int maxHeight = 8;
    int minHeight = 1;
    
    // generate a random width and height
    int randomWidth = (arc4random() % (maxWidth-minWidth+1)) + minWidth;
    int randomHeight = (arc4random() % (maxHeight-minHeight+1)) + minHeight;
    
    // create a building with the random width and height
    Building *building = [[Building alloc] initWithWidth:randomWidth withHeight:randomHeight ParentClass:parentClass];
    
    // add the building to the buildings array
    [Buildings addObject:building];
}

-(void)update:(ccTime)dt{
    //DLog(@"%i",[backgroundLayers count]);
    
    // Update the backgrounds
    for (int i = 0; i < [backgroundLayers count]; i++) {
        [[backgroundLayers objectAtIndex:i] moveLayers:dt];
    }
    
    // Update the buildings
    for (int i = 0; i < [Buildings count]; i++) {
        [[Buildings objectAtIndex:i] update:dt];
    }
    
    
}


@end
