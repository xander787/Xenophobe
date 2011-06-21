//
//  GameLevelScene.h
//  Xenophobe
//
//  Created by Alexander on 10/20/10.
//  Copyright 2010 Alexander Nabavi-Noori, XanderNet Inc. All rights reserved.
//  
//  Team:
//  Alexander Nabavi-Noori - Software Engineer, Game Architect
//	James Linnell - Software Engineer, Creative Design, Art Producer
//	Tyler Newcomb - Creative Design, Art Producer
//
//  Last Updated - 1/31/20101 @8PM - Alexander
//  - Began implementing tasks necessary to load
//  level files. Moved other tasks from GameScene
//  to this class such as collisions and health

#import <Foundation/Foundation.h>
#import "BossShip.h"
#import "BossShipAtlas.h"
#import "MiniBossGeneral.h"
#import "EnemyShip.h"
#import "PlayerShip.h"
#import "AbstractScene.h"

@class GameScene;

@protocol GameLevelDelegate <NSObject>
@required
- (void)levelEnded;
- (void)scoreChangedBy:(int)scoreChange;
- (void)playerHealthChangedBy:(int)healthChange;
@end

typedef enum _LevelType {
    kLevelType_MiniBoss = 0,
    kLevelType_Boss,
    kLevelType_Cutscene
} LevelType;


@interface GameLevelScene : NSObject {
    id <GameLevelDelegate>  delegate;
    
    NSUserDefaults          *settings;
    CGRect                  screenBounds;
    
    NSString                *currentLevelFile;
    PlayerShip              *playerShip;
    BossShip                *bossShip;
    
    // Controlling the player ship
    BOOL            touchOriginatedFromPlayerShip;
    BOOL            touchFromSecondShip;
    
    // Storing objects in play
    NSSet               *enemiesSet;
    
    NSMutableDictionary *levelDictionary;
    LevelType           levelType;
}

@property (nonatomic, retain) id <GameLevelDelegate> delegate;
@property (readonly, retain) PlayerShip *playerShip;

- (id)initGameLevelSceneWithLevelFile:(NSString *)levelFile withDelegate:(id <GameLevelDelegate>)del;

- (void)update:(GLfloat)aDelta;
- (void)updateCollisions;
- (void)updateWithTouchLocationBegan:(NSSet *)touches withEvent:(UIEvent *)event view:(UIView *)aView;
- (void)updateWithTouchLocationMoved:(NSSet *)touches withEvent:(UIEvent *)event view:(UIView *)aView;
- (void)render;

@end
