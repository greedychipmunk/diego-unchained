//
//  DUTestLevelScene.m
//  DiegoUnchained
//
//  Created by Jabari on 5/18/14.
//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

#import "DUTestLevelScene.h"
#import "DUDiegoSprite.h"

const int SCROLL_SPEED = 5;

@implementation DUTestLevelScene {
    DUDiegoSprite *_diego;
    
    SKSpriteNode *_ground;
    SKSpriteNode *_groundNext;
    
    SKSpriteNode *_trees;
    SKSpriteNode *_treesNext;
    
    SKSpriteNode *_sky;
    SKSpriteNode *_skyNext;
    
    SKTextureAtlas *_atlas;
    
    BOOL _diegoJumping;
}

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        NSLog(@"SIZE: %@", NSStringFromCGSize(size));
        self.backgroundColor = [SKColor colorWithRed:0 green:.6 blue:.9 alpha:1.0];
        self.physicsWorld.gravity = CGVectorMake(0, -3.0);
        
        _atlas = [SKTextureAtlas atlasNamed:@"placeholderImages"];
        
        _ground = [[SKSpriteNode alloc] initWithTexture:[_atlas textureNamed:@"grass-ground"]];
        _ground.name = @"ground";
        _ground.anchorPoint = CGPointMake(0,0);
        _ground.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(_ground.frame.origin.x, _ground.frame.origin.y, _ground.frame.size.width, _ground.frame.size.height-20)];
        _ground.physicsBody.dynamic = NO;
        
        _groundNext = [_ground copy];
        _groundNext.position = CGPointMake(_ground.frame.size.width, 0);
        
        [self addChild:_ground atWorldLayer:DUWorldLayerMidGround];
        [self addChild:_groundNext atWorldLayer:DUWorldLayerMidGround];
        
        _sky = [[SKSpriteNode alloc] initWithTexture:[_atlas textureNamed:@"sky"]];
        _sky.name = @"sky";
        _sky.position = CGPointMake(0, 200);
        
        _skyNext = [_sky copy];
        _skyNext.position = CGPointMake(_sky.frame.size.width, 200);
        
        [self addChild:_sky atWorldLayer:DUWorldLayerMidGround];
        [self addChild:_skyNext atWorldLayer:DUWorldLayerMidGround];
        
        _trees = [[SKSpriteNode alloc] initWithTexture:[_atlas textureNamed:@"grass-and-trees"]];
        _trees.name = @"trees";
        _trees.position = CGPointMake(0, 139);
        
        _treesNext = [_trees copy];
        _treesNext.position = CGPointMake(_trees.frame.size.width, 139);
        
        [self addChild:_trees atWorldLayer:DUWorldLayerMidGround];
        [self addChild:_treesNext atWorldLayer:DUWorldLayerMidGround];
        
        _diego = [[DUDiegoSprite alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame) - 100, CGRectGetMidY(self.frame))];
        [self addChild:_diego atWorldLayer:DUWorldLayerMidGround];

        CGPoint ceilingPointBegin = CGPointMake(0, size.height);
        CGPoint ceilingPointEnd   = CGPointMake(size.width, size.height);
        SKNode* ceilingNode     = [[SKNode alloc] init];
        ceilingNode.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:ceilingPointBegin toPoint:ceilingPointEnd];
        [self addChild:ceilingNode];
        
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

-(void)parallaxUpdate
{
    [self moveSprite:_ground withSprite:_groundNext withSpeed:5];
    [self moveSprite:_sky withSprite:_skyNext withSpeed:1];
    [self moveSprite:_trees withSprite:_treesNext withSpeed:2.5];

}

-(void)moveSprite:(SKNode *)node withSprite:(SKNode *)nodeNext withSpeed:(float)speed
{
    node.position = CGPointMake(node.position.x - speed, node.position.y);
    nodeNext.position = CGPointMake(nodeNext.position.x - speed, nodeNext.position.y);
    
    if (CGRectGetMaxX(node.frame) < CGRectGetMinX(self.frame)) {
        node.position = CGPointMake(node.position.x + (node.frame.size.width * 2), node.position.y);
    }
    
    if (CGRectGetMaxX(nodeNext.frame) < CGRectGetMinX(self.frame)) {
        nodeNext.position = CGPointMake(nodeNext.position.x + (nodeNext.frame.size.width * 2), nodeNext.position.y);
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if (_diegoJumping) {
        [self jumpPhysicsBody:_diego.physicsBody];
    }
    
    [self parallaxUpdate];
}

-(void)jumpPhysicsBody:(SKPhysicsBody*)bodyToJump {
    [bodyToJump applyForce:CGVectorMake(0, 100)];
}


@end
