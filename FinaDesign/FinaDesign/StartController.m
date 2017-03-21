//
//  StartController.m
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import "StartController.h"
#import "OptionController.h"
#import "MainController.h"


@implementation StartController
-(id)init
{
    if(self=[super init])
    {
        CGSize size=[[CCDirector sharedDirector] winSize];
        model=[[StartModel alloc] init];
        view=[[StartView alloc] initWithStartModel:model];
        
        [self addChild:view];
        
        view.delegate=self;
    }
    return self;
}
-(void)SelectMission
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainController node] ]];
}
@end
