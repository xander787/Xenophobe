//
//  GameScene.h
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
//  Last Updated - 12/31/2010 @11AM - Alexander
//  - Added projectilesSet and bossesSet NSSet's
//  to hold projectiles and bosses currently in play
//
//  Last Updated - 12/31/2010 @11AM - Alexander
//  - Added imagery for the health bar
//
//  Last Updated - 6/17/11 @7:30PM - Alexander
//  - Added a health bar background image to let users know how much
//  health of theirs has diminished.
//
//  Last Updated - 6/22/11 @5PM - Alexander & James
//  - Began implementation of GameLevelScene and also
//  moved much of things from this class to that one.
//  Collisions, health, etc are all there now. Also delegated
//  this class to that one as well. This class now keeps a copy
//  of the index of level files in memory as well


#import <Foundation/Foundation.h>
#import "ParticleEmitter.h"
#import "AbstractScene.h"
#import "Image.h"
#import "PlayerShip.h"
#import "EnemyShip.h"
#import "BossShip.h"
#import "BossShipAtlas.h"
#import "Collisions.h"
#import "AngelCodeFont.h"
#import "AbstractProjectile.h"
#import "GameLevelScene.h"

typedef enum _Level {
    kLevel_OneOne = 0,
    kLevel_OneTwo,
    kLevel_OneThree,
    kLevel_TwoOne,
    kLevel_TwoTwo,
    kLevel_TwoThree,
    kLevel_ThreeOne,
    kLevel_ThreeTwo,
    kLevel_ThreeThree,
    kLevel_FourOne,
    kLevel_FourTwo,
    kLevel_FiveOne,
    kLevel_FiveTwo,
    kLevel_FiveThree,
    kLevel_SixOne,
    kLevel_SixTwo,
    kLevel_SixThree,
    kLevel_SevenOne,
    kLevel_SevenTwo,
    kLevel_SevenThree,
    kLevel_DevTest
} Level;

@interface GameScene : AbstractScene <GameLevelDelegate> {
    // In-game graphics
    ParticleEmitter *backgroundParticleEmitter;
    AngelCodeFont   *font;
    NSString        *playerScoreString;
    int             playerScore;
    Image           *healthBar;
    Image           *healthBarBackground;
    
    // Controlling the player ship
    BOOL            touchOriginatedFromPlayerShip;
    BOOL            touchFromSecondShip;
    
    // Loading levels sequentially
    NSArray         *levelFileIndex;
    
    Level           currentLevel;

}

- (void)initGameScene;
- (void)initSound;
- (void)loadLevelIndexFile;
- (Level)convertToLevelEnum:(NSString *)received;

@end
