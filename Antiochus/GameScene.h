//
//  Game.h
//  Antiochus
//
//  Created by Brandon Ramirez on 2/1/13.
//
//

#import "cocos2d.h"
#import "ParallaxScroller.h"

@interface GameScene : CCLayer

@property ParallaxScroller *Parallax;

+(id)scene;

@end