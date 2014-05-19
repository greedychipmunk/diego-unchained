//
//  DUTestLevelScene.m
//  DiegoUnchained
//
//  Created by Jabari on 5/18/14.
//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

#import "DUTestLevelScene.h"
#import "DUDiegoSprite.h"

@implementation DUTestLevelScene {
    DUDiegoSprite *_diego;
    SKSpriteNode *_ground;
    SKNode *_cieling;
    
    BOOL _diegoJumping;
}

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.physicsWorld.gravity = CGVectorMake(0, -3.0);
        
        _diego = [[DUDiegoSprite alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame) - 300, CGRectGetMidY(self.frame) - 160)];
        _diego.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_diego.frame.size];
        [self addChild:_diego atWorldLayer:DUWorldLayerMidGround];
        
        /*
         * TODO: add cieling to keep diego from flying away
        _cieling = [[SKNode alloc] init];
        _cieling.position = CGPointMake(100, 0);
        _cieling.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(size.width, 100)];
        [self addChild:_cieling atWorldLayer:DUWorldLayerMidGround];
        */
        
        _ground = [[SKSpriteNode alloc] initWithImageNamed:@"ground.png"];
        _ground.name = @"ground";
        _ground.anchorPoint = CGPointZero;
        _ground.position = CGPointMake(0, _ground.frame.size.height + 40);
        
        _ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_ground.frame.size];
        _ground.physicsBody.dynamic = NO;
        [self addChild:_ground atWorldLayer:DUWorldLayerMidGround];
        
        _diegoJumping = NO;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    _diegoJumping = YES;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch ends */
    _diegoJumping = NO;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if (_diegoJumping) {
        [_diego.physicsBody applyForce:CGVectorMake(0, 300)];
    }
}

@end
