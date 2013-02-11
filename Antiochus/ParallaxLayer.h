//
//  ParallaxLayer.h
//  Antiochus
//
//  Created by Brandon Ramirez on 2/8/13.
//
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface ParallaxLayer : NSObject

// The sprite image
@property CCSprite *backgroundSprite;

// A copy of the background sprite to allow it to loop
@property CCSprite *offScreenSprite;

// The speed at which the background moves
@property int speed;

-(id)initWithImage:(NSString *)fileName withSpeed:(int *)speed;

-(void)moveLayers:(float)dt;

@end
