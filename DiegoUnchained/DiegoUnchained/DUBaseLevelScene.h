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

@interface DUBaseLevelScene : SKScene

@end
