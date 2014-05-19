//
//  DUTestLevelScene.m
//  DiegoUnchained
//
//  Created by Jabari on 5/18/14.
//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

#import "DUTestLevelScene.h"
#import "DUDiegoSprite.h"

@implementation DUTestLevelScene

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        DUDiegoSprite *diego = [[DUDiegoSprite alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame) - 300, CGRectGetMidY(self.frame) - 200)];
        [self addChild:diego atWorldLayer:DUWorldLayerMidGround];
    }
    return self;
}

@end
