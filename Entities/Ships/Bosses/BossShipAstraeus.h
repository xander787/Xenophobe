//
//  BossShipAstraeus.h
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
//	Last Updated - 7/19/2011 @5PM - Alexander
//  - Cannons rotate and also shift positions and everything

#import <Foundation/Foundation.h>
#import "BossShip.h"
#import "ParticleProjectile.h"


@interface BossShipAstraeus : BossShip {
    ModularObject       *ship;
    ModularObject       *cannonFrontLeft;
    ModularObject       *cannonFrontRight;
    ModularObject       *cannonReplacementOneLeft;
    ModularObject       *cannonReplacementOneRight;
    ModularObject       *cannonReplacementTwoLeft;
    ModularObject       *cannonReplacementTwoRight;
    ModularObject       *cannonReplacementThreeLeft;
    ModularObject       *cannonReplacementThreeRight;
    
    float               timeSinceFrontLeftDied;
    float               timeSinceFrontRightDied;
    BOOL                leftSideTransitionComplete;
    BOOL                rightSideTransitionComplete;
    
    BOOL                allReplacementsDead;
    BOOL                leftReplacementsDead;
    BOOL                rightReplaceMentsDead;
    BOOL                allOfLeftSideDead;
    BOOL                allOfRightSideDead;
    GLfloat             holdingTimer;
    
    ParticleEmitter     *leftSideDeathEmitter;
    ParticleEmitter     *rightSideDeathEmitter;
    ParticleEmitter     *mainbodyDeathEmitter;
    BOOL                updateMainBodyDeathEmitter;
    
    ParticleProjectile  *leftCannonProjectile;
    ParticleProjectile  *rightCannonProjectile;

}
@property(readonly) BOOL leftSideTransitionComplete;
@property(readonly) BOOL rightSideTransitionComplete;

- (id)initWithLocation:(CGPoint)aPoint andPlayerShipRef:(PlayerShip *)playerRef;
- (void)update:(GLfloat)delta;

@end
