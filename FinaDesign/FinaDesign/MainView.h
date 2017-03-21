//
//  MainScene.h
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MainModel.h"
@protocol callMainDelegate <NSObject>
-(void)mainModel:(MainModel *)mainModel touchedX:(int)newX touchedY:(int)newY With:(NSSet *)touches Sprite:(CCSprite *)ms;
-(void)EndmainModel:(MainModel *)mainModel Sprite:(CCSprite *)ms;
-(void)changeTouch:(int)c;
-(void)setTouchType:(int)type;
-(void)done;
-(void)discard;
-(void)shop;
-(void)menu;
@end

@interface MainView : CCLayer {
    MainModel *model;
    id<callMainDelegate> delegate;
    CCMenuItemImage *meat;
    CCMenuItemImage *sources;
    CCMenuItemImage *cheeze;
    CCMenuItemImage *pan;
    CCMenuItemImage *vegetables;
    CCMenuItemImage *flower;
    CCMenuItemImage *customer;

    CCLabelTTF *timecount;
    CCLabelTTF *scorecount;
    CCSprite *movesprite;
}
@property (nonatomic,retain) id<callMainDelegate> delegate;
@property (nonatomic,retain) MainModel *model;

-(id)initWithMainModel:(MainModel *)m delegate:(id)aDelegate;
-(void)initCustomer;
-(void)update;
@end
