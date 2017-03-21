//
//  MainModel.h
//  FinaDesign
//
//  Created by  use on 15/11/1.
//  Copyright 2015年  use. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define BLANK 0
#define MEAT 1
#define SOURCES 2
#define VEGETABLE 3
#define CHEEZE 4
#define PAN 5
#define FLOWER 6


@interface MainModel : NSObject {
    NSMutableArray *BasicList;
    NSMutableArray *row1,*row2,*row3,*row4,*row5,*row6,*row7,*row8;
    NSMutableArray *PlayerList;
    NSMutableArray *CustomerArray;
    NSString *clist;
    int MeatNum;
    int SourcesNum;
    int CheezeNum;
    int PanNum;
    int FlowerNum;
    int VegetableNum;
    
    BOOL doing;
    BOOL isVegetable;
    BOOL isMeat;
    BOOL isCheeze;
    BOOL isSources;
    BOOL isPan;
    BOOL isFlower;
    BOOL cantouch;
    BOOL stopGame;
    
    int row;
    int col;
    int time;
    int score;
    
    CCSprite *pizza;

    
}

@property (nonatomic,retain) NSMutableArray *BasicList;
@property (nonatomic,retain) NSMutableArray *PlayerList;
@property (nonatomic,retain) NSMutableArray *CustomerArray;
@property (nonatomic,retain) NSString *clist;
@property (nonatomic,retain) CCSprite *pizza;
@property (nonatomic) int MeatNum;
@property (nonatomic) int SourcesNum;
@property (nonatomic) int FlowerNum;
@property (nonatomic) int CheezeNum;
@property (nonatomic) int PanNum;
@property (nonatomic) int VegetableNum;
@property (nonatomic) int time;
@property (nonatomic) int score;
@property (nonatomic) BOOL isVegetable;
@property (nonatomic) BOOL isMeat;
@property (nonatomic) BOOL isCheeze;
@property (nonatomic) BOOL isSources;
@property (nonatomic) BOOL isPan;
@property (nonatomic) BOOL isFlower;
@property (nonatomic) BOOL cantouch;
@property (nonatomic) BOOL stopGame;

-(void)initSpritePoint;
-(void)initList;
-(void)addCustomerArray:(CCSprite *)sprite;
-(void)setPositionWithSprite:(CCSprite *)sprite AtIndex:(CGPoint)point;
-(void)addPlayerList:(NSString *)s;
-(NSString *)getCustomerPicture;
-(CGPoint)getCustomerPosition;
-(void)setTouchType:(int)type;
-(void)check;
-(void)update;
-(void)randomlist:(int)n;
@end
