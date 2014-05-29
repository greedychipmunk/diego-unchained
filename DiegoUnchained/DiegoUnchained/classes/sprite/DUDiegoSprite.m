//
//  DUDiegoSprite.m
//  DiegoUnchained
//
//  Created by Jabari on 5/18/14.
//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

#import "DUDiegoSprite.h"

@implementation DUDiegoSprite {
    NSMutableArray *_runFrames;
    SKTextureAtlas *atlas;
}

- (instancetype)initAtPosition:(CGPoint)position
{
    //TODO: refactor these atlas names out into global constants
    atlas = [SKTextureAtlas atlasNamed:@"placeholderImages"];
    self = [super initWithTexture:[atlas textureNamed:@"diego-small"] andPosition:position];
    if (self) {
        self.name = @"diego";
        self.anchorPoint = CGPointMake(0, 0);
        //_diego.position    = CGPointMake(CGRectGetMidX(self.frame) - 100, CGRectGetMidY(self.frame));
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
        self.physicsBody.allowsRotation = NO;
        
        _runFrames = [NSMutableArray array];
        [_runFrames addObject:[atlas textureNamed:@"diego-small"]];
        [_runFrames addObject:[atlas textureNamed:@"diego-walk1"]];
    }
    return self;
}

-(void)jumpPhysicsBody:(SKPhysicsBody*)bodyToJump {
    [bodyToJump applyForce:CGVectorMake(0, 100)];
}

-(void)run
{
    [self runAction:[SKAction repeatActionForever:
                        [SKAction animateWithTextures:_runFrames
                                         timePerFrame:0.1f
                                               resize:NO
                                              restore:YES]] withKey:@"walkingInPlaceDiego"];
}

-(void)jump
{
    [self jumpPhysicsBody:self.physicsBody];
    [self setTexture:[atlas textureNamed:@"diego-small"]];
}

@end
