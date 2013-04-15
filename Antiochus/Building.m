//
//  Building.m
//  Antiochus
//
//  Created by Brandon Ramirez on 2/11/13.
//
//

#import "Building.h"
#import "cocos2d.h"

@implementation Building

@synthesize BuildingSprites;
@synthesize TempArray;

@synthesize leftBuildingSprite;
@synthesize middleBuildingSprite;
@synthesize rightBuildingSprite;

const NSInteger *TileWidth = 32;
const NSInteger *TileHeight = 32;

enum {
    RedBrick,
    BlackBrick
};

-(id)initWithWidth:(NSInteger)width withHeight:(NSInteger)height ParentClass:(id)parent{
    
    if( [super init] ){
        // Allocate and initialize the array that will hold the sprites
        BuildingSprites = [[NSMutableArray alloc] init];
        [self createBuildingWithWidth:width withHeight:height ParentClass:parent];
    }
    
    return self;
}

-(void)createBuildingWithWidth:(NSInteger)width withHeight:(NSInteger)height ParentClass:(id)parent{
    // Temp values until kathy adds tiles
    int wallWidth = 60;
    int wallHeight = 36;
    int max = BlackBrick;
    int min = RedBrick;
    
    // the offset for the building spawn
    int minOffset = 10;
    int maxOffset = 50;
    
    int BuildingType = (arc4random() % (max-min+1)) + min;
    int Offset = (arc4random() % (maxOffset-minOffset+1)) + minOffset;
    
    if(BuildingType == RedBrick){
        leftBuildingSprite = [CCSprite spriteWithFile:@"wall left edge 2.png"];
        middleBuildingSprite = [CCSprite spriteWithFile:@"wall 2.jpg"];
        rightBuildingSprite = [CCSprite spriteWithFile:@"wall right edge 2.jpg"];
    }
    else if (BuildingType == BlackBrick){
        leftBuildingSprite = [CCSprite spriteWithFile:@"wall left edge 1.png"];
        middleBuildingSprite = [CCSprite spriteWithFile:@"wall 1.jpg"];
        rightBuildingSprite = [CCSprite spriteWithFile:@"wall right edge 1.jpg"];
    }
    
    // Ask director for the window size
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    // Construct the building
    for (int i = 1; i <= width; i++){
        TempArray = [[NSMutableArray alloc] init];
        for(int c = 1; c <= height; c++){
            // Allocate and initialize the vertical component of the 2d array
            CCSprite *tile;
            
            // if this is the leftmost wall of the building
            if(i == 1){
                // Create the tile from an image
                tile = [CCSprite spriteWithTexture:[leftBuildingSprite texture]];
            }
            
            // if this is a middle tile
            else if(i < width && i > 1){
                // Create the tile from an image
                tile = [CCSprite spriteWithTexture:[middleBuildingSprite texture]];
            }
            
            // if this is the rightmost tile
            else if(i == width){
                // create the tile from an image
                tile = [CCSprite spriteWithTexture:[rightBuildingSprite texture]];
            }
            // position the image
            tile.position = ccp(size.width + wallWidth*i + Offset,wallHeight/2*c);
            [parent addChild:tile];
            [TempArray addObject:tile];
        }
        DLog(@"%i",[TempArray count]);
        [BuildingSprites addObject:TempArray];
    }
}

-(void)updateTile:(CCSprite *)sprite time:(float)dt{
    sprite.position = ccp(sprite.position.x - (200*dt), sprite.position.y );
}

-(void)update:(float)dt{
    
    // iterate over the arrays inside the array
    for (int i = 0; i < [BuildingSprites count]; i++) {
        //iterate over the sprites and update them
        for (int c = 0; c < [[BuildingSprites objectAtIndex:i] count]; c++) {
            [self updateTile:[[BuildingSprites objectAtIndex:i] objectAtIndex:c] time:dt];
        }
    }
}

@end
