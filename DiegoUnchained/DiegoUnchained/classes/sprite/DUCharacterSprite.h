//
//  DUCharacter.h
//  DiegoUnchained
//
//  Created by Jabari on 5/18/14.
//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

#import "DUParallaxSprite.h"

@class DUBaseLevelScene;

@interface DUCharacterSprite : DUParallaxSprite

@property (nonatomic, assign) CGFloat movementSpeed;
@property (nonatomic, assign) CGFloat animationSpeed;

- (instancetype)initWithTexture:(SKTexture *)texture andPosition:(CGPoint)position;

+ (void)loadSharedAssets;

- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval;

- (void)moveTowards:(CGPoint)position withTimeInterval:(NSTimeInterval)timeInterval;

- (DUBaseLevelScene *)characterScene;

@end
