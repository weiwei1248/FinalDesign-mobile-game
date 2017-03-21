//
//  MainController.m
//  FinaDesign
//
//  Created by  use on 15/11/1.
//  Copyright 2015年  use. All rights reserved.
//

#import "MainController.h"


@implementation MainController
-(id)init
{
    if(self=[super init])
    {
        model=[[MainModel alloc] init];
        [model initList];
        [self getRandomList];
        view=[[MainView alloc] initWithMainModel:model delegate:self];
        [self addChild:view];
        
        view.delegate=self;
        
      //  [view initCustomer];
        [self schedule:@selector(update:) interval:1];

    }
    return self;
}

-(void)mainModel:(MainModel *)mainModel addCustomersToArray:(CCSprite *)sprite
{
    [model addCustomerArray:sprite];
}
-(void)mainModel:(MainModel *)mainModel touchedX:(int)newX touchedY:(int)newY With:(NSSet *)touches Sprite:(CCSprite *)ms
{
    if(mainModel.cantouch)
    {
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        [mainModel setPositionWithSprite:ms AtIndex:ccp(newX,winSize.height-newY)];
    }
}
-(void)EndmainModel:(MainModel *)mainModel Sprite:(CCSprite *)ms
{
        if(ms.position.x<=490&&ms.position.x>=315&&ms.position.y<=315&&ms.position.y>=10)
        {
            ms.position=ccp(400,75);
            if(mainModel.isFlower)
            {
                [mainModel addPlayerList:@"flower"];
            }
            if(mainModel.isPan)
            {
                [mainModel addPlayerList:@"pan"];
            }
            if(mainModel.isSources)
            {
                [ms setTexture:[[CCSprite spriteWithFile:@"sources1.png"]texture]];//2
                [mainModel addPlayerList:@"sources"];
            }
            if(mainModel.isVegetable)
            {
                [ms setTexture:[[CCSprite spriteWithFile:@"vegetable1.png"]texture]];//3
                [mainModel addPlayerList:@"vagetable"];
            }
            if(mainModel.isMeat)
            {
               [ms setTexture:[[CCSprite spriteWithFile:@"meat1.png"]texture]]; //1
                [mainModel addPlayerList:@"meat"];
            }
            [self changeTouch:0];
        }
        else
        {
            ms.visible=false;
            [self changeTouch:0];
            
        }

}
-(void)changeTouch:(int)c
{
    switch(c)
    {
        case 0:model.cantouch=false;break;
        case 1:model.cantouch=true;break;
    }
}

-(void)setTouchType:(int)type
{
    [model setTouchType:type];
}


-(void)getRandomList
{
    int ran=random()%4+1;
    [model randomlist:ran];
}


-(void)done
{
    if(!model.stopGame)
    {
       [model check];
       [self discard]; 
    }
}
-(void)shop
{
    
}
-(void)discard
{
    CCSprite *sp=[CCSprite spriteWithFile:@"background_2.jpg"];
    sp.position=ccp(387,70);
    [view addChild:sp];
    model.PlayerList=[[NSMutableArray alloc]init];
}
-(void)menu
{
    
}


-(void)update:(ccTime)delta
{
  //  [view initCustomer];
    if(!model.stopGame)
    {
        [model update];
        [view update];
    }
    if(model.time==0)
    {
        model.stopGame=true;
    }
}
@end
