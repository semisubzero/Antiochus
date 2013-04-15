//
//  ParallaxLayer.m
//  Antiochus
//
//  Created by Brandon Ramirez on 2/8/13.
//
//

#import "ParallaxLayer.h"
#import "cocos2d.h"

@implementation ParallaxLayer

// Main image
@synthesize backgroundSprite;

// Copy of main image
@synthesize offScreenSprite;

// Speed of scroll
@synthesize speed;

// Create a new parallax layer
-(id)initWithImage:(NSString *)fileName withSpeed:(int *)spriteSpeed{

    if( [super init] ){
        // Ask director for the window size
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // Initialize the background sprite
        backgroundSprite = [CCSprite spriteWithFile:fileName];
        
        // Position the sprite
        backgroundSprite.position = ccp( size.width/2 , size.height/2 );
        
        // Initialize the offscreen sprite
        offScreenSprite = [CCSprite spriteWithFile:fileName];
        
        // Position the sprite
        offScreenSprite.position = ccp( 1.5 *size.width , size.height/2 );
        
        // Initialize background speed
        speed = spriteSpeed;
    }
    
    return self;
}

-(void)moveLayers:(ccTime)dt{
    // Ask director for the window size
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    // Move the background sprites positions
    backgroundSprite.position = ccp( backgroundSprite.position.x - speed*dt , backgroundSprite.position.y );
    offScreenSprite.position = ccp( offScreenSprite.position.x - speed*dt , offScreenSprite.position.y );
    
    // If either of the sprites go offscreen to the left, move them offscreen to the right
    if(backgroundSprite.position.x < -size.width/2)
        backgroundSprite.position = ccp( offScreenSprite.position.x + size.width - 1 , size.height/2 );
    else if(offScreenSprite.position.x < -size.width/2)
        offScreenSprite.position = ccp( backgroundSprite.position.x + size.width - 1 , size.height/2 );
}

@end
