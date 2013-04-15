//
//  Game.h
//  Antiochus
//
//  Created by Brandon Ramirez on 2/1/13.
//
//

#import "cocos2d.h"

@class ParallaxScroller;

@interface GameScene : CCLayer

@property ParallaxScroller *Parallax;

+(id)scene;

-(void)spawnBuilding;

@end