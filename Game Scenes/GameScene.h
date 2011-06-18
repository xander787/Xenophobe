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


#import <Foundation/Foundation.h>
#import "ParticleEmitter.h"
#import "AbstractScene.h"
#import "Image.h"
#import "PlayerShip.h"
#import "EnemyShip.h"
#import "BossShip.h"
#import "BossShipAsia.h"
#import "Collisions.h"
#import "AngelCodeFont.h"
#import "AbstractProjectile.h"

typedef enum _LevelType {
    kLevelType_Enemy = 0,
    kLevelType_MiniBoss,
    kLevelTpye_Boss
} LevelType;

@interface GameScene : AbstractScene {
    PlayerShip      *testShip;
    EnemyShip       *testEnemy;
    BossShipAsia    *testBoss;
        
    AbstractProjectile *bulletTest;
    
    // In-game graphics
    ParticleEmitter *backgroundParticleEmitter;
    AngelCodeFont   *font;
    NSString        *playerScoreString;
    int             playerScore;
    
    Image           *healthBar;
    Image           *healthBarBackground;
    
    // Storing objects in play
    NSSet       *enemiesSet;
    NSSet       *projectilesSet;
    NSSet       *bossesSet;
    
    // Controlling the player ship
    BOOL        touchOriginatedFromPlayerShip;
    BOOL        touchFromSecondShip;
}

- (void)initGameScene;
- (void)initSound;
- (void)loadLevelFiles;

@end
