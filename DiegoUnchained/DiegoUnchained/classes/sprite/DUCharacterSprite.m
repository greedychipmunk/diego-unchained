//
//  DUCharacter.m
//  DiegoUnchained
//
//  Created by Jabari on 5/18/14.
//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

#import "DUCharacterSprite.h"
#import "DUBaseLevelScene.h"

@implementation DUCharacterSprite

#pragma mark - init
- (instancetype)initWithTexture:(SKTexture *)texture andPosition:(CGPoint)position
{
    NSParameterAssert(texture);
    self = [super initWithTexture:texture];
    if (self) {
        self.position = position;
    }
    return self;
}

#pragma mark - shared assets
+ (void)loadSharedAssets
{
    
}

#pragma mark - update since last interval
- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval
{
    
}

#pragma mark - movement stuff
- (void)moveTowards:(CGPoint)position withTimeInterval:(NSTimeInterval)timeInterval
{
    CGPoint curPosition = self.position;
    CGFloat dx = position.x - curPosition.x;
    CGFloat dy = position.y - curPosition.y;
    
    CGFloat distance = sqrt((dx * dx) + (dy * dy));
    
    if (distance < self.movementSpeed) {
        [self setPosition:position];
    } else {
        CGFloat newX = curPosition.x + dx / self.animationSpeed;
        CGFloat newY = curPosition.y + dy / self.animationSpeed;
        
        [self setPosition:CGPointMake(newX, newY)];
    }
}

#pragma mark - scene stuff
- (DUBaseLevelScene *)characterScene
{
    return ([[self scene] isKindOfClass:[DUBaseLevelScene class]]) ? (DUBaseLevelScene *)[self scene] : nil;
}

@end
