//
//  DUDiegoSprite.m
//  DiegoUnchained
//
//  Created by Jabari on 5/18/14.
//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

#import "DUDiegoSprite.h"

@implementation DUDiegoSprite

- (instancetype)initAtPosition:(CGPoint)position
{
    //TODO: refactor these atlas names out into global constants
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"placeholderImages"];
    self = [super initWithTexture:[atlas textureNamed:@"diego-small"] andPosition:position];
    if (self) {
        self.name = @"diego";
        self.anchorPoint = CGPointMake(0, 0);
        //_diego.position    = CGPointMake(CGRectGetMidX(self.frame) - 100, CGRectGetMidY(self.frame));
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
        self.physicsBody.allowsRotation = NO;
    }
    return self;
}

@end
