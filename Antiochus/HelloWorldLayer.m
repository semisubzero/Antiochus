//
//  HelloWorldLayer.m
//  Antiochus
//
//  Created by Brandon Ramirez on 2/1/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "GameScene.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        // ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		// create and initialize a Label
		CCLabelTTF *ttfTitle = [CCLabelTTF labelWithString:@"Antiochus" fontName:@"Marker Felt" fontSize:64];
	
		// position the label on the center of the screen
		ttfTitle.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: ttfTitle];
        
        CCMenuItem *prompt = [CCMenuItemFont itemWithString:@"Tap to start" target:self selector:@selector(onTap:)];
        
        CCMenu *menu = [CCMenu menuWithItems:prompt, nil];
        [self addChild:menu];
        
        prompt.position = ccp( 0 , -50 );
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects

#pragma mark GameKit delegate

-(void)onTap:(id)sender {

    DLog(@"Transitioning to GameScene");
    
    // Transition to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1.0 scene:[GameScene scene]]];
}
@end
