//
//  DUDiegoSprite.h
//  DiegoUnchained
//
//  Created by Jabari on 5/18/14.
//  Copyright (c) 2014 Antelope Smash. All rights reserved.
//

#import "DUCharacterSprite.h"

@interface DUDiegoSprite : DUCharacterSprite

- (instancetype)initAtPosition:(CGPoint)position;
- (void)run;
- (void)jump;

@end
