//
//  DUMyScene.m
//  DiegoUnchained
//
//  Created by Jabari Bell on 5/13/14.
//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

#import "DUBaseLevelScene.h"

@interface DUBaseLevelScene ()

@property (nonatomic, copy, readwrite) NSMutableArray *layers;
@property (nonatomic, strong, readwrite) SKNode *world;

@end

@implementation DUBaseLevelScene

-(id)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        [self setupWorld];
        [self setupLayers];
    }
    return self;
}

#pragma mark - setup stuff
- (void)setupWorld
{
    self.world = [SKNode new];
    self.world.name = @"world";
    [self addChild:self.world];
}

- (void)setupLayers
{
    _layers = [NSMutableArray arrayWithCapacity:DUWorldLayerCount];
    for (int i = 0; i < DUWorldLayerCount; i++) {
        SKNode *layer = [SKNode new];
        layer.zPosition = i - DUWorldLayerCount;
        [self.world addChild:layer];
        [(NSMutableArray *)_layers addObject:layer];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

- (void)addChild:(SKNode *)node atWorldLayer:(DUWorldLayer)layer
{
    SKNode *layerNode = self.layers[layer];
    [layerNode addChild:node];
}

@end
