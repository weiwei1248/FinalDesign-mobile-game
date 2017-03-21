//
//  MainModel.m
//  FinaDesign
//
//  Created by  use on 15/11/1.
//  Copyright 2015年  use. All rights reserved.
//

#import "MainModel.h"


@implementation MainModel
@synthesize BasicList;
@synthesize PlayerList;
@synthesize MeatNum;
@synthesize CheezeNum;
@synthesize SourcesNum;
@synthesize PanNum;
@synthesize VegetableNum;
@synthesize CustomerArray;
@synthesize pizza;
@synthesize clist;
@synthesize isCheeze;
@synthesize isSources;
@synthesize isMeat;
@synthesize isVegetable;
@synthesize isPan;
@synthesize isFlower;
@synthesize cantouch;
@synthesize time;
@synthesize score;
@synthesize stopGame;

-(id)init
{
    if(self=[super init])
    {
        
        PlayerList=[[NSMutableArray alloc]init];
        CustomerArray=[[NSMutableArray alloc]init];
        doing=false;
        stopGame=false;
        cantouch=false;
        
        pizza=[CCSprite spriteWithFile:@"source.png"];
        pizza.visible=false;
        pizza.scale=3;
        pizza.scaleX=4.5;
        
        time=60;
        score=0;

    }
    return self;
}


-(void)initList
{
    //mission 1
    row1=[[NSMutableArray alloc]initWithObjects:@"meat",@"sources",@"pan",nil];
    row2=[[NSMutableArray alloc]initWithObjects:@"meat",@"sources",@"flower", nil];
    row3=[[NSMutableArray alloc]initWithObjects:@"sources",@"vegetable",@"pan", nil];
    row4=[[NSMutableArray alloc]initWithObjects:@"sources",@"vegetable",@"flower", nil];
    
    row5=[[NSMutableArray alloc]initWithObjects:@"meat",@"sources",@"vegetable",@"pan", nil];
    row6=[[NSMutableArray alloc]initWithObjects:@"meat",@"sources",@"cheeze",@"flower",nil];
    
    row7=[[NSMutableArray alloc]initWithObjects:@"meat",@"sources",@"vegetable",@"pan",@"cheeze", nil];
    row8=[[NSMutableArray alloc]initWithObjects:@"meat",@"sources",@"vegetable",@"flower",@"cheeze", nil];
    
//    NSMutableArray *mission1=[[NSMutableArray alloc]initWithObjects:row1,row2,row3,row4, nil];
//    NSMutableArray *mission2=[[NSMutableArray alloc]initWithObjects:row1,row2,row3,row4,row5,row6, nil];
//    NSMutableArray *mission3=[[NSMutableArray alloc]initWithObjects:row1,row2,row3,row4,row5,row6,row7,row8, nil];
//    
//    BasicList=[[NSMutableArray alloc]initWithObjects:mission1,mission2,mission3, nil];
    
}

-(void)addPlayerList:(NSString *)s
{
    [PlayerList addObject:s];
}

-(void)getNumWith:(int)type With:(int)num
{
    switch(type)
    {
        case MEAT:MeatNum=num;
        case VEGETABLE:VegetableNum=num;
        case FLOWER:FlowerNum=num;
        case CHEEZE:CheezeNum=num;
        case PAN:PanNum=num;
        case SOURCES:SourcesNum=num;
    }
}

-(void)addCustomerArray:(CCSprite *)sprite
{
    [CustomerArray addObject:sprite];
}

-(void)setPositionWithSprite:(CCSprite *)sprite AtIndex:(CGPoint)point
{
    sprite.position=point;
}

-(NSString *)getCustomerPicture
{
    int type=arc4random()%3;
    NSString *string;
    switch(type)
    {
        case 0:string=@"left.png";break;
        case 1:string=@"begin.png";break;
        case 2:string=@"left.png";break;
    }
    return string;
    
}

-(CGPoint)getCustomerPosition
{
    int type=arc4random()%3;
    CGPoint po;

    switch(type)
    {
        case 0:po=ccp(0,100);break;
        case 1:po=ccp(200,100);break;
        case 2:po=ccp(300,100);break;
    }
    return po;
}

-(void)setTouchType:(int)type
{
    isVegetable=false;
    isMeat=false;
    isCheeze=false;
    isSources=false;
    isPan=false;
    isFlower=false;
    
    switch(type)
    {
        case 1:isSources=true;break;
        case 2:isVegetable=true;break;
        case 3:isMeat=true;break;
        case 4:isCheeze=true;break;
        case 5:isPan=true;break;
        case 6:isFlower=true;break;
    }
}

-(void)check
{
    for(NSString *obj in BasicList)
    {
        for(NSString *obj2 in PlayerList)
        {
            if([obj isEqual:obj2])
            {
                score=+10;
            }
        }
    }
    PlayerList=[[NSMutableArray alloc]init];
}
-(void)randomlist:(int)n
{
    BasicList=[[NSMutableArray alloc]init];
    NSLog(@"n=%d",n);
    switch(n)
    {
        case 1:{
           clist=@"pan+sources+meat.png";
            BasicList=row1;
            break;
        }
        case 2:
        {
            clist=@"pan+sources+vegetable.png";
            BasicList=row2;
            break;
        }
        case 3:
        {
            clist=@"flower+sources+meat.png";
            BasicList=row3;
            break;
        }
        case 4:
        {
            clist=@"flower+sources+vegetable.png";
            BasicList=row4;
            break;
        }
    }
}
-(void)update
{
    if(time>=0)
    {
        time--;
    }
    
}
@end
