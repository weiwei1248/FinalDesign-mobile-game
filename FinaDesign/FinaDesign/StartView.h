//
//  StartView.h
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "StartModel.h"
@protocol callStartDelegate <NSObject>
-(void)SelectMission;
@end

@interface StartView : CCNode {
    StartModel *model;
    id<callStartDelegate> delegate;
    CCMenuItemImage *startbutton;
    CCSprite *background;
    CCMenu *menu;
    
}
@property(nonatomic,retain) id<callStartDelegate> delegate;
@property(nonatomic,retain) StartModel *model;

-(id)initWithStartModel:(StartModel *)m;

@end
