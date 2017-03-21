//
//  StartView.m
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import "StartView.h"

@implementation StartView
@synthesize delegate;
@synthesize model;

-(id)initWithStartModel:(StartModel *)m
{
    if(self=[super init])
    {
        model=m;
        CGSize size=[[CCDirector sharedDirector]winSize];
        startbutton=[CCMenuItemImage itemWithNormalImage:@"start.png" selectedImage:@"start_2.png" block:^(id sender){
            [delegate SelectMission];
        }];
        background=[CCSprite spriteWithFile:@"startmenu.png"];
        background.position=ccp(size.width/2,size.height/2);
        [self addChild:background];
        startbutton.position=ccp(420,43);
        menu=[CCMenu menuWithItems:startbutton, nil];
        menu.position=ccp(0,0);
        [self addChild:menu z:2];
        
        
    }
    return self;
}


@end
