//
//  MiniBoss_OneTwo.m
//  Xenophobe
//
//  Created by James Linnell on 9/16/11.
//  Copyright 2011 PDHS. All rights reserved.
//

#import "MiniBoss_OneTwo.h"

@implementation MiniBoss_OneTwo

- (id)initWithLocation:(CGPoint)aPoint andPlayerShipRef:(PlayerShip *)playerRef {
    self = [super initWithBossID:kMiniBoss_OneTwo initialLocation:aPoint andPlayerShipRef:playerRef];
    if (self) {
        // Initialization code here.
        state = kOneTwo_Entry;
        
        deathAnimation = [[ParticleEmitter alloc] initParticleEmitterWithImageNamed:@"texture.png"
                                                                           position:Vector2fMake(currentLocation.x, currentLocation.y)
                                                             sourcePositionVariance:Vector2fZero
                                                                              speed:0.8
                                                                      speedVariance:0.2
                                                                   particleLifeSpan:0.8
                                                           particleLifespanVariance:0.2
                                                                              angle:0
                                                                      angleVariance:360
                                                                            gravity:Vector2fZero
                                                                         startColor:Color4fMake(1.0, 0.2, 0.2, 1.0)
                                                                 startColorVariance:Color4fMake(0.1, 0.1, 0.1, 0.0)
                                                                        finishColor:Color4fMake(0.2, 0.2, 0.2, 1.0)
                                                                finishColorVariance:Color4fMake(0.1, 0.1, 0.1, 0.0)
                                                                       maxParticles:1000
                                                                       particleSize:12.0
                                                                 finishParticleSize:12.0
                                                               particleSizeVariance:0.0
                                                                           duration:0.2
                                                                      blendAdditive:YES];
        floaterOneDeath = [[ParticleEmitter alloc] initParticleEmitterWithImageNamed:@"texture.png"
                                                                           position:Vector2fMake(currentLocation.x, currentLocation.y)
                                                             sourcePositionVariance:Vector2fZero
                                                                              speed:0.8
                                                                      speedVariance:0.2
                                                                   particleLifeSpan:0.8
                                                           particleLifespanVariance:0.2
                                                                              angle:0
                                                                      angleVariance:360
                                                                            gravity:Vector2fZero
                                                                         startColor:Color4fMake(1.0, 0.2, 0.2, 1.0)
                                                                 startColorVariance:Color4fMake(0.1, 0.1, 0.1, 0.0)
                                                                        finishColor:Color4fMake(0.2, 0.2, 0.2, 1.0)
                                                                finishColorVariance:Color4fMake(0.1, 0.1, 0.1, 0.0)
                                                                       maxParticles:1000
                                                                       particleSize:12.0
                                                                 finishParticleSize:12.0
                                                               particleSizeVariance:0.0
                                                                           duration:0.1
                                                                      blendAdditive:YES];
        floaterTwoDeath = [[ParticleEmitter alloc] initParticleEmitterWithImageNamed:@"texture.png"
                                                                           position:Vector2fMake(currentLocation.x, currentLocation.y)
                                                             sourcePositionVariance:Vector2fZero
                                                                              speed:0.8
                                                                      speedVariance:0.2
                                                                   particleLifeSpan:0.8
                                                           particleLifespanVariance:0.2
                                                                              angle:0
                                                                      angleVariance:360
                                                                            gravity:Vector2fZero
                                                                         startColor:Color4fMake(1.0, 0.2, 0.2, 1.0)
                                                                 startColorVariance:Color4fMake(0.1, 0.1, 0.1, 0.0)
                                                                        finishColor:Color4fMake(0.2, 0.2, 0.2, 1.0)
                                                                finishColorVariance:Color4fMake(0.1, 0.1, 0.1, 0.0)
                                                                       maxParticles:1000
                                                                       particleSize:12.0
                                                                 finishParticleSize:12.0
                                                               particleSizeVariance:0.0
                                                                           duration:0.1
                                                                      blendAdditive:YES];
        
        bodyCenterBullet = [[BulletProjectile alloc] initWithProjectileID:kEnemyProjectile_BulletLevelThree_Double location:Vector2fZero andAngle:-90.0f];
        bodyLeftBullet = [[BulletProjectile alloc] initWithProjectileID:kEnemyProjectile_BulletLevelTwo_Double location:Vector2fZero andAngle:-100.0f];
        bodyRightBullet = [[BulletProjectile alloc] initWithProjectileID:kEnemyProjectile_BulletLevelTwo_Double location:Vector2fZero andAngle:-80.0f];
        floaterLeftBullet = [[BulletProjectile alloc] initWithProjectileID:kEnemyProjectile_BulletLevelOne_Single location:Vector2fZero andAngle:-90.0f];
        floaterRightBullet = [[BulletProjectile alloc] initWithProjectileID:kEnemyProjectile_BulletLevelOne_Single location:Vector2fZero andAngle:-90.0f];
        
        projectilesArray = [[NSMutableArray alloc] initWithObjects:bodyCenterBullet, bodyLeftBullet, bodyRightBullet, floaterLeftBullet, floaterRightBullet, nil];
        
        for(int i = 1; i < self.numberOfModules; i++){
            modularObjects[i].desiredLocation.x = modularObjects[i].defaultLocation.x;
            modularObjects[i].desiredLocation.y = modularObjects[i].defaultLocation.y;
        }
    }
    return self;
}

- (void)update:(GLfloat)delta {
    [super update:delta];
    
    if(!shipIsDeployed){
        currentLocation.x += ((desiredLocation.x - currentLocation.x) / bossSpeed) * (pow(1.584893192, bossSpeed)) * delta;
        currentLocation.y += ((desiredLocation.y - currentLocation.y) / bossSpeed) * (pow(1.584893192, bossSpeed)) * delta;
    }
    else {
        currentLocation.x += ((desiredLocation.x - currentLocation.x) / bossSpeed) * (pow(1.584893192, bossSpeed/3)) * delta;
        currentLocation.y += ((desiredLocation.y - currentLocation.y) / bossSpeed) * (pow(1.584893192, bossSpeed/3)) * delta;
        
        for(int i = 1; i < self.numberOfModules; i++){
            modularObjects[i].location.x += ((modularObjects[i].desiredLocation.x - modularObjects[i].location.x) / bossSpeed) * (pow(1.584893192, bossSpeed/3)) * delta;
            modularObjects[i].location.y += ((modularObjects[i].desiredLocation.y - modularObjects[i].location.y) / bossSpeed) * (pow(1.584893192, bossSpeed/3)) * delta;
        }
    }
    
    for(int i = 0; i < numberOfModules; i++){
        if(modularObjects[i].isDead == NO){
            for(Polygon *modulePoly in modularObjects[i].collisionPolygonArray){
                [modulePoly setPos:CGPointMake(modularObjects[i].location.x + currentLocation.x, modularObjects[i].location.y + currentLocation.y)];
            }
        }
    }
    
    [deathAnimation setSourcePosition:Vector2fMake(currentLocation.x, currentLocation.y)];
    [floaterOneDeath setSourcePosition:Vector2fMake(currentLocation.x + modularObjects[1].location.x, currentLocation.y + modularObjects[1].location.y)];
    [floaterTwoDeath setSourcePosition:Vector2fMake(currentLocation.x + modularObjects[2].location.x, currentLocation.y + modularObjects[2].location.y)];
    
    if(shipIsDeployed){
        [bodyCenterBullet setLocation:Vector2fMake(currentLocation.x + modularObjects[0].weapons[0].weaponCoord.x, currentLocation.y + modularObjects[0].weapons[0].weaponCoord.y)];
        [bodyLeftBullet setLocation:Vector2fMake(currentLocation.x + modularObjects[0].weapons[1].weaponCoord.x, currentLocation.y + modularObjects[0].weapons[1].weaponCoord.y)];
        [bodyRightBullet setLocation:Vector2fMake(currentLocation.x + modularObjects[0].weapons[2].weaponCoord.x, currentLocation.y + modularObjects[0].weapons[2].weaponCoord.y)];
        [floaterLeftBullet setLocation:Vector2fMake(currentLocation.x + modularObjects[1].location.x + modularObjects[1].weapons[0].weaponCoord.x, currentLocation.y + modularObjects[1].location.y + modularObjects[1].weapons[0].weaponCoord.y)];
        [floaterRightBullet setLocation:Vector2fMake(currentLocation.x + modularObjects[2].location.x + modularObjects[2].weapons[0].weaponCoord.x, currentLocation.y + modularObjects[2].location.y + modularObjects[2].weapons[0].weaponCoord.y)];
        
        [bodyCenterBullet update:delta];
        if(modularObjects[1].isDead && modularObjects[2].isDead){
            [bodyLeftBullet update:delta];
            [bodyRightBullet update:delta];
        }
        if(!modularObjects[1].isDead){
            [floaterLeftBullet update:delta];
        }
        if(!modularObjects[2].isDead){
            [floaterRightBullet update:delta];
        }
    }
    
    if(state == kOneTwo_Entry){
        if(shipIsDeployed){
            state = kOneTwo_Holding;
        }
    }
    else if(state == kOneTwo_Holding){
        holdingTimer += delta;
        attackTimer += delta;
        
        if(holdingTimer >= 1.2){
            holdingTimer = 0.0;
            
            if(currentLocation.x <= 160){
                desiredLocation.x = (MAX(0.4, RANDOM_0_TO_1()) * 160) + 160;
            }
            else if(currentLocation.x >= 160){
                desiredLocation.x = (MIN(0.6, RANDOM_0_TO_1()) * 160);
            }
            
            desiredLocation.y = currentLocation.y + (RANDOM_MINUS_1_TO_1() * 150);
            
            desiredLocation.x = MAX(50, desiredLocation.x);
            desiredLocation.y = MAX(320, desiredLocation.y);
            
            desiredLocation.x = MIN(desiredLocation.x, 270);
            desiredLocation.y = MIN(desiredLocation.y, 430);
            
            
            //Floater floating
            for(int i = 1; i < self.numberOfModules; i++){
                if(modularObjects[i].location.x <= modularObjects[i].defaultLocation.x){
                    modularObjects[i].desiredLocation.x = (RANDOM_0_TO_1() * 10) + modularObjects[i].defaultLocation.x;
                }
                else if(modularObjects[i].location.x >= modularObjects[i].defaultLocation.x){
                    modularObjects[i].desiredLocation.x = (RANDOM_0_TO_1() * -10) + modularObjects[i].defaultLocation.x;
                }
                modularObjects[i].desiredLocation.y = (RANDOM_MINUS_1_TO_1() * 10) + modularObjects[i].defaultLocation.y;
            }

        }
        
        if(attackTimer >= 6 && kamikazeState == kKamikaze_Idle){
            state = kOneTwo_Attacking;
            attackTimer = 0;
            holdingTimer = 0;
        }
        if(modularObjects[0].isDead){
            state = kOneTwo_Death;
        }
    }
    else if(state == kOneTwo_Attacking){
        if(!attackingPath){
            oldPointBeforeAttack = Vector2fMake(currentLocation.x, currentLocation.y);
            
            //Randomize direction
            if(RANDOM_0_TO_1() > 0.5){
                attackingPath = [[BezierCurve alloc] initCurveFrom:Vector2fMake(currentLocation.x, currentLocation.y) 
                                                     controlPoint1:Vector2fMake((160 - 350), 100)
                                                     controlPoint2:Vector2fMake((160 + 350), 100)
                                                          endPoint:Vector2fMake(currentLocation.x, currentLocation.y)
                                                          segments:50];
            }
            else {
                attackingPath = [[BezierCurve alloc] initCurveFrom:Vector2fMake(currentLocation.x, currentLocation.y) 
                                                     controlPoint1:Vector2fMake((160 + 350), 100)
                                                     controlPoint2:Vector2fMake((160 - 350), 100)
                                                          endPoint:Vector2fMake(currentLocation.x, currentLocation.y)
                                                          segments:50];
            }
        }
        attackPathtimer += delta;
        currentLocation.x = [attackingPath getPointAt:attackPathtimer/4].x;
        currentLocation.y = [attackingPath getPointAt:attackPathtimer/4].y;
        
        if(abs(oldPointBeforeAttack.x - currentLocation.x) <= 5 && abs(oldPointBeforeAttack.y - currentLocation.y) <= 5 && attackPathtimer > 1){
            state = kOneTwo_Holding;
            attackPathtimer = 0;
            [attackingPath release];
            attackingPath = nil;
        }if(modularObjects[0].isDead){
            state = kOneTwo_Death;
        }
    }
    if(state == kOneTwo_Death){
        [bodyCenterBullet stopProjectile];
        [bodyLeftBullet stopProjectile];
        [bodyRightBullet stopProjectile];
        [floaterLeftBullet stopProjectile];
        [floaterRightBullet stopProjectile];
        
        [deathAnimation update:delta];
        modularObjects[0].isDead = NO;
        if(deathAnimation.particleCount == 0){
            modularObjects[0].isDead = YES;
        }
    }
    
    if(kamikazeState == kKamikaze_Idle){
        if(state == kOneTwo_Holding){
            kamikazeTimer += delta;
        }
        
        if(kamikazeTimer > 4 && state == kOneTwo_Holding){
            if(RANDOM_MINUS_1_TO_1() > 0){
                kamikazeState = kKamikaze_LeftAttack;
            }
            else {
                kamikazeState = kKamikaze_RightAttack;
            }
            kamikazeTimer = 0;
        }
    }
    else if(kamikazeState == kKamikaze_LeftAttack){
        modularObjects[1].location.y -= 200 * delta;
        
        if(modularObjects[1].location.y < -480){
            kamikazeState = kKamikaze_LeftReturn;
            
            modularObjects[1].location.y = modularObjects[1].defaultLocation.y + 250;
        }
    }
    else if(kamikazeState == kKamikaze_LeftReturn){
        modularObjects[1].location.y -= 150 * delta;
        
        if(modularObjects[1].location.y < modularObjects[1].defaultLocation.y){
            modularObjects[1].location.y = modularObjects[1].defaultLocation.y;
            kamikazeState = kKamikaze_Idle;
        }
    }
    else if(kamikazeState == kKamikaze_RightAttack){
        modularObjects[2].location.y -= 200 * delta;
        
        if(modularObjects[2].location.y < -480){
            kamikazeState = kKamikaze_RightReturn;
            
            modularObjects[2].location.y = modularObjects[2].defaultLocation.y + 250;
        }
    }
    else if(kamikazeState == kKamikaze_RightReturn){
        modularObjects[2].location.y -= 150 * delta;
        
        if(modularObjects[2].location.y < modularObjects[2].defaultLocation.y){
            modularObjects[2].location.y = modularObjects[2].defaultLocation.y;
            kamikazeState = kKamikaze_Idle;
        }
    }
    
    if(modularObjects[1].isDead && !floaterOneDeathAnimating){
        modularObjects[1].isDead = NO;
        floaterOneDeathAnimating = YES;
        
        if(floaterLeftBullet){
            [floaterLeftBullet release];
            floaterLeftBullet = nil;
        }
    }
    if(modularObjects[2].isDead && !floaterTwoDeathAnimating){
        modularObjects[2].isDead = NO;
        floaterTwoDeathAnimating = YES;
        
        if(floaterRightBullet){
            [floaterRightBullet release];
            floaterRightBullet = nil;
        }
    }
    if(floaterOneDeathAnimating){
        [floaterOneDeath update:delta];
        if(floaterOneDeath.particleCount == 0){
            floaterOneDeathAnimating = NO;
            modularObjects[1].isDead = YES;
        }
    }
    if(floaterTwoDeathAnimating){
        [floaterTwoDeath update:delta];
        if(floaterTwoDeath.particleCount == 0){
            floaterTwoDeathAnimating = NO;
            modularObjects[2].isDead = YES;
        }
    }
}

- (void)rotateModule:(int)mod aroundPositionWithOldrotation:(GLfloat)oldRot {
    Vector2f tempPoint = modularObjects[mod].location;
    double tempAngle = DEGREES_TO_RADIANS(oldRot - modularObjects[mod].rotation);
    modularObjects[mod].location = Vector2fMake((tempPoint.x * cos(tempAngle)) - (tempPoint.y * sin(tempAngle)), (tempPoint.x * sin(tempAngle)) + (tempPoint.y * cos(tempAngle)));
    
    for(int k = 0; k < [modularObjects[mod].collisionPolygonArray count]; k++){
        for(int i = 0; i < [[modularObjects[mod].collisionPolygonArray objectAtIndex:k] pointCount]; i++){
            Vector2f tempPoint = [[modularObjects[mod].collisionPolygonArray objectAtIndex:k] originalPoints][i];
            double tempAngle = DEGREES_TO_RADIANS(oldRot - modularObjects[mod].rotation);
            [[modularObjects[mod].collisionPolygonArray objectAtIndex:k] originalPoints][i] = Vector2fMake((tempPoint.x * cos(tempAngle)) - (tempPoint.y * sin(tempAngle)), (tempPoint.x * sin(tempAngle)) + (tempPoint.y * cos(tempAngle)));
        }
        [[modularObjects[mod].collisionPolygonArray objectAtIndex:k] buildEdges];
    }
    
    for(int i = 0; i < modularObjects[mod].numberOfWeapons; i++){
        Vector2f tempPoint2 = modularObjects[mod].weapons[i].weaponCoord;
        double tempAngle2 = DEGREES_TO_RADIANS(oldRot - modularObjects[mod].rotation);
        modularObjects[mod].weapons[i].weaponCoord = Vector2fMake((tempPoint2.x * cos(tempAngle2)) - (tempPoint2.y * sin(tempAngle2)),
                                                                  (tempPoint2.x * sin(tempAngle2)) + (tempPoint2.y * cos(tempAngle2)));
    }
}

- (void)hitModule:(int)module withDamage:(int)damage {
    [super hitModule:module withDamage:damage];
    if(module == 0){
        if(modularObjects[1].isDead == NO && modularObjects[2].isDead == NO && kamikazeState == kKamikaze_Idle){
            if(modularObjects[0].moduleHealth > modularObjects[0].moduleMaxHealth/2){
                modularObjects[module].moduleHealth -= damage;
            }
        }
        else {
            modularObjects[module].moduleHealth -= damage;
        }
    }
    else {
        modularObjects[module].moduleHealth -= damage;
    }
    
    shipHealth = modularObjects[0].moduleHealth + modularObjects[1].moduleHealth + modularObjects[2].moduleHealth;
    shipMaxHealth = modularObjects[0].moduleMaxHealth + modularObjects[1].moduleMaxHealth + modularObjects[2].moduleMaxHealth;
}

- (void)render {
    [bodyCenterBullet render];
    [bodyLeftBullet render];
    [bodyRightBullet render];
    [floaterLeftBullet render];
    [floaterRightBullet render];
    
    if(state == kOneTwo_Death){
        [deathAnimation renderParticles];
    }
    [floaterOneDeath renderParticles];
    [floaterTwoDeath renderParticles];
    
    for(int i = 0; i < numberOfModules; i++) {
        if(i != 0){
            if (!modularObjects[i].isDead) {
                [modularObjects[i].moduleImage setRotation:modularObjects[i].rotation];
                [modularObjects[i].moduleImage renderAtPoint:CGPointMake(currentLocation.x + modularObjects[i].location.x, currentLocation.y + modularObjects[i].location.y) centerOfImage:YES];
            }
        }
        else if(state != kOneTwo_Death){
            [modularObjects[0].moduleImage setRotation:modularObjects[i].rotation];
            [modularObjects[0].moduleImage renderAtPoint:CGPointMake(currentLocation.x + modularObjects[i].location.x, currentLocation.y + modularObjects[i].location.y) centerOfImage:YES];
        }
        
    }
    
    
    if(DEBUG) {
        glPushMatrix();
        
        glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
        
        for(int i = 0; i < numberOfModules; i++) {
            if(modularObjects[i].isDead == NO){
                for(int k = 0; k < [modularObjects[i].collisionPolygonArray count]; k++){
                    for(int j = 0; j < ([[modularObjects[i].collisionPolygonArray objectAtIndex:k] pointCount] - 1); j++) {
                        GLfloat line[] = {
                            [[modularObjects[i].collisionPolygonArray objectAtIndex:k] points][j].x, [[modularObjects[i].collisionPolygonArray objectAtIndex:k] points][j].y,
                            [[modularObjects[i].collisionPolygonArray objectAtIndex:k] points][j+1].x, [[modularObjects[i].collisionPolygonArray objectAtIndex:k] points][j+1].y,
                        };
                        
                        glVertexPointer(2, GL_FLOAT, 0, line);
                        glEnableClientState(GL_VERTEX_ARRAY);
                        glDrawArrays(GL_LINES, 0, 2);
                    }
                    
                    GLfloat lineEnd[] = {
                        [[modularObjects[i].collisionPolygonArray objectAtIndex:k] points][([[modularObjects[i].collisionPolygonArray objectAtIndex:k] pointCount] - 1)].x, [[modularObjects[i].collisionPolygonArray objectAtIndex:k] points][([[modularObjects[i].collisionPolygonArray objectAtIndex:k] pointCount] - 1)].y,
                        [[modularObjects[i].collisionPolygonArray objectAtIndex:k] points][0].x, [[modularObjects[i].collisionPolygonArray objectAtIndex:k] points][0].y,
                    };
                    
                    glVertexPointer(2, GL_FLOAT, 0, lineEnd);
                    glEnableClientState(GL_VERTEX_ARRAY);
                    glDrawArrays(GL_LINES, 0, 2);
                }
            }
        }
        
        glPopMatrix();
    }
}

@end
