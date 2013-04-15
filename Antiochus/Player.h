//
//  Player.h
//  Antiochus
//
//  Created by Brandon Ramirez on 2/15/13.
//
//

#import <Foundation/Foundation.h>

// CCSprite placeholder
@class CCSprite;

@interface Player : NSObject

// The image of the player.
@property CCSprite *playerImage;

// The players run speed
@property NSInteger Speed;

@end
