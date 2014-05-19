//
//  DUMyScene.h
//  DiegoUnchained
//

//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

typedef NS_ENUM(NSInteger, DUWorldLayer) {
    DUWorldLayerUnknown = -1,
    DUWorldLayerSky,
    DUWorldLayerMidGround,
    DUWorldLayerForeground,
    DUWorldLayerDebug,
    DUWorldLayerCount
};

#import <SpriteKit/SpriteKit.h>

#import "DUCharacterSprite.h"

@interface DUBaseLevelScene : SKScene

@property (nonatomic, copy, readonly) NSArray *layers;
@property (nonatomic, strong, readonly) SKNode *world;

- (void)addChild:(SKNode *)node atWorldLayer:(DUWorldLayer)layer;

@end
