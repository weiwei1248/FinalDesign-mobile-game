//
//  MainScene.m
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import "MainView.h"

@implementation MainView
@synthesize delegate;
@synthesize model;

-(id)initWithMainModel:(MainModel *)m delegate:(id)aDelegate
{
    if(self=[super init])
    {
        CGSize size=[[CCDirector sharedDirector]winSize];
        
        model=m;
        
        CCSprite *background=[CCSprite spriteWithFile:@"background.jpg"];
        background.position=ccp(size.width/2,size.height/2);
        [self addChild:background];
        
        self.isTouchEnabled=true;
        
        timecount=[CCLabelTTF labelWithString:@"60" fontName:@"Arial" fontSize:20];
        timecount.position=ccp(90,266);
        [timecount setColor:ccBLACK];
        [self addChild:timecount z:10];
        
        scorecount=[CCLabelTTF labelWithString:@"0" fontName:@"Arial" fontSize:20];
        scorecount.position=ccp(90,180);
        [scorecount setColor:ccBLACK];
        [self addChild:scorecount z:10];
        
        CCMenu *menu;
        pan=[CCMenuItemImage itemWithNormalImage:@"pan.png" selectedImage:@"pan.png" block:^(id sender) {
            if(!model.cantouch&&!model.stopGame)
            {
                movesprite=[CCSprite spriteWithFile:@"pan.png"];
                movesprite.position=ccp(size.width/2,size.height/2);
                [self addChild:movesprite];
                [delegate changeTouch:1];
                [delegate setTouchType:5];
            }
        }];
        pan.scale=0.5;
        pan.position=ccp(110,100);

        
        sources=[CCMenuItemImage itemWithNormalImage:@"source.png" selectedImage:@"source.png" block:^(id sender) {
            if(!model.cantouch&&!model.stopGame)
            {
                movesprite=[CCSprite spriteWithFile:@"source.png"];
                movesprite.position=ccp(size.width/2,size.height/2);
                movesprite.scale=2;
                [self addChild:movesprite ];
                [delegate changeTouch:1];
                [delegate setTouchType:1];
            }
        }];
        sources.position=ccp(250,100);
        
        
        vegetables=[CCMenuItemImage itemWithNormalImage:@"vegetable.png" selectedImage:@"vegetable.png" block:^(id sender) {
            if(!model.cantouch&&!model.stopGame)
            {
            movesprite=[CCSprite spriteWithFile:@"vegetable.png"];
            movesprite.position=ccp(size.width/2,size.height/2);
            movesprite.scale=2;
            [self addChild:movesprite ];
            [delegate changeTouch:1];
                [delegate setTouchType:2];
            }
        }];
        vegetables.scale=1.2;
        vegetables.position=ccp(100,40);

        
        meat=[CCMenuItemImage itemWithNormalImage:@"meat.png" selectedImage:@"meat.png" block:^(id sender) {
            if(!model.cantouch&&!model.stopGame)
            {
                movesprite=[CCSprite spriteWithFile:@"meat.png"];
            movesprite.position=ccp(size.width/2,size.height/2);
            movesprite.scale=2;
            [self addChild:movesprite ];
                [delegate changeTouch:1];
                [delegate setTouchType:3];
            }
        }];
        meat.scale=1.2;
        meat.position=ccp(155,40);
        
        
        
        flower=[CCMenuItemImage itemWithNormalImage:@"flower.png" selectedImage:@"flower.png" block:^(id sender) {
            if(!model.cantouch&&!model.stopGame)
            {
                movesprite=[CCSprite spriteWithFile:@"flower.png"];
                movesprite.position=ccp(size.width/2,size.height/2);
                [self addChild:movesprite];
                [delegate changeTouch:1];
                [delegate setTouchType:6];
            }
        }];
        flower.scale=0.5;
        flower.position=ccp(190,100);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        CCMenuItemImage *done=[CCMenuItemImage itemWithNormalImage:@"done.png" selectedImage:@"done.png" block:^(id sender) {
            [delegate done];
        }];
        done.position=ccp(530,100);
        CCMenuItemImage *discard=[CCMenuItemImage itemWithNormalImage:@"discard.png" selectedImage:@"discard.png" block:^(id sender) {
//            CCSprite *sp=[CCSprite spriteWithFile:@"background_2.jpg"];
//            sp.position=ccp(387,70);
//            [self addChild:sp];
            [delegate discard];
        }];
        discard.position=ccp(530,40);
        CCMenuItemImage *shop=[CCMenuItemImage itemWithNormalImage:@"shop.png" selectedImage:@"shop.png" block:^(id sender) {
            [delegate shop];
        }];
        shop.position=ccp(35,100);
        CCMenuItemImage *_menu=[CCMenuItemImage itemWithNormalImage:@"menu.png" selectedImage:@"menu.png" block:^(id sender) {
            [delegate menu];
        }];
        _menu.position=ccp(35,40);
        
        
        
        menu=[CCMenu menuWithItems:pan,vegetables,meat,sources,flower,done,discard,shop,_menu, nil];
        menu.position=ccp(0,0);
        [self addChild:menu];
        
        model.pizza.position=ccp(400,70);
        [self addChild:model.pizza z:10];
        
        [self initList];
          
    }
    return self;
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!model.stopGame)
    {
       UITouch *touch=[[event allTouches]anyObject];
        float newX=[touch locationInView:touch.view].x;
        float newY=[touch locationInView:touch.view].y;
        [delegate mainModel:model touchedX:newX touchedY:newY With:touches Sprite:movesprite];
    }
    
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!model.stopGame)
    [delegate EndmainModel:model Sprite:movesprite];
}
//-(void)initCustomer
//{
//    
//    customer=[CCSprite spriteWithFile:[model getCustomerPicture]];
//  //  [delegate mainModel:model addCustomersToArray:customer];
//    customer.position=[model getCustomerPosition];
//   // [self addChild:customer];
//   // customer.doing=
//}
-(void)initList
{
    CCSprite *list=[CCSprite spriteWithFile:model.clist];
    list.position=ccp(290,255);
    list.scale=0.8;
    [self addChild:list];
}
-(void)update
{
    NSString *time;
    time=[NSString stringWithFormat:@"%d",model.time];
    [timecount setString:time];
    
    NSString *score;
    score=[NSString stringWithFormat:@"%d",model.score];
    [scorecount setString:score];
}
@end
