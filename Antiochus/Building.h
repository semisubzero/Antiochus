//
//  Building.h
//  Antiochus
//
//  Created by Brandon Ramirez on 2/11/13.
//
//

#import <Foundation/Foundation.h>

// CCSprite placeholder
@class CCSprite;

@interface Building : NSObject

@property NSMutableArray *BuildingSprites;
@property NSMutableArray *TempArray;

// Building body sprites
@property CCSprite *leftBuildingSprite;
@property CCSprite *middleBuildingSprite;
@property CCSprite *rightBuildingSprite;

-(id)initWithWidth:(int)width withHeight:(int)height ParentClass:(id)parent;

-(void)createBuildingWithWidth:(int)width withHeight:(int)height ParentClass:(id)parent;

-(void)updateTile:(CCSprite *)sprite time:(float)dt;

-(void)update:(float)dt;

@end
