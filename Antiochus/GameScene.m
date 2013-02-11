//
//  Game.m
//  Antiochus
//
//  Created by Brandon Ramirez on 2/1/13.
//
//

#import "GameScene.h"

@implementation GameScene

@synthesize Parallax;

+(id) scene {
    
    CCScene *scene = [CCScene node];
    
    GameScene *layer = [GameScene node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init {
    
    if( self=[super init] ) {
        // Ask director for screen size
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // Call the update method as often as possible
        [self schedule:@selector(update:)];
        
        // Allocate and initialize the Parallax scroller
        Parallax = [[ParallaxScroller alloc] initWithParent:self];
        
        // Add the sky
        CCSprite *DarkSky = [[CCSprite alloc] initWithFile:@"background.jpg"];
        DarkSky.position = ccp( size.width/2 , size.height/2 );
        [self addChild:DarkSky];
        
        // Add the moon
        CCSprite *Moon = [[CCSprite alloc] initWithFile:@"moon.png"];
        Moon.position = ccp( size.width/2 , size.height/2 );
        [self addChild:Moon];
        
        // Add the first layer background
        [Parallax addBackground:@"midground 3.png" withSpeed:5];
        
        // Add chimeny smoke for midground 2
        [Parallax addBackground:@"chimney smoke.png" withSpeed:20];
        
        // Add the second layer background
        [Parallax addBackground:@"midground 2.png" withSpeed:20];
        
        // Add the third layer background
        [Parallax addBackground:@"midground 1.png" withSpeed:60];
            
    }
    
    return self;
}

// Where all the game logic goes
-(void)update:(ccTime)dt{
    [Parallax update:dt];
}
@end
