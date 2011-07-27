//
//  AbstractProjectile.h
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
//	Last Updated - 1/26/2011 @ 5:20PM - Alexander
//  - Added ability to change location, and also added properties for
//  public vars
//
//  Last Updated - 6/23/2011 @ 7:45PM - James
//  - Synthesized emitter for use in collision detection

#import <Foundation/Foundation.h>
#import "PhysicalObject.h"
#import "ParticleEmitter.h"
#import "Polygon.h"

typedef enum _ProjectileID {
    kEnemyProjectile_Bullet = 0,
    kEnemyProjectile_Missile,
    kEnemyProjectile_Wave,
    kPlayerProjectile_Bullet,
    kPlayerProjectile_Missile,
    kPlayerProjectile_Wave
} ProjectileID;

typedef enum _ParticleID {
    kEnemyParticle = 0,
    kPlayerParticle
} ParticleID;

@interface AbstractProjectile : PhysicalObject {    
    GLfloat         projectileAngle;
    GLfloat         projectileSpeed;
    ProjectileID    projectileID;
    ParticleID      particleID;
    NSString        *idType;
    
    Vector2f        turretPosition;
    Vector2f        currentLocation;
    Vector2f        desiredLocation;
    
    BOOL            isActive;
    
    NSString        *nameOfImage;
    
    NSMutableArray  *polygonArray;

    //Particle Emitter specific variables
    ParticleEmitter *emitter;
    
@private
    Vector2f        *collisionPoints;
    int             collisionPointCount;
    int             rateOfFire;
    int             particleRadius;
    
    
    //Image specific variables
    Image           *image;
    
    GLfloat         elapsedTime;
    BOOL            isAlive;
    BOOL            isStopped;
}

@property (nonatomic)   Vector2f        turretPosition;
@property (readonly)    Vector2f        currentLocation;
@property (nonatomic)   Vector2f        desiredLocation;
@property (nonatomic)   BOOL            isActive;
@property (nonatomic)   BOOL            isStopped;
@property (nonatomic)   GLfloat         projectileAngle;
@property (nonatomic)   GLfloat         projectileSpeed;
@property (nonatomic)   ProjectileID    projectileID;
@property (nonatomic, retain) ParticleEmitter *emitter;
@property (nonatomic, retain) NSMutableArray *polygonArray;


- (id)initWithProjectileID:(ProjectileID)aProjectileID fromTurretPosition:(Vector2f)aPosition andAngle:(int)aAngle emissionRate:(int)aRate;
- (id)initWithParticleID:(ParticleID)aParticleID fromTurretPosition:(Vector2f)aPosition radius:(int)aRadius rateOfFire:(int)aRate andAngle:(int)aAngle;
- (void)update:(CGFloat)aDelta;
- (void)render;
- (void)pauseProjectile;
- (void)playProjectile;
- (void)stopProjectile;

@end
