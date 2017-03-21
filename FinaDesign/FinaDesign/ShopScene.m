//
//  ShopScene.m
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import "ShopScene.h"


@implementation ShopScene
@synthesize button;
-(id)init
{
    if(self=[super init])
    {
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World from view" fontName:@"Marker Felt" fontSize:48];
        button=[CCMenuItemImage itemWithNormalImage:@"begin.png" selectedImage:@"left.png" block:^(id sender) {
            [self.delegate gameStartBtn];
        }];
        CCMenu*menu=[CCMenu menuWithItems:button, nil];
        menu.position=ccp(100,100);
        
        //button=[CCMenuItemImage itemWithTarget:self selector:@selector(aaa)];
        
        // ask director the the window size
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // position the label on the center of the screen
        label.position =  ccp( size.width /2 , size.height/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        [self addChild:menu];
    }
    return self;
}
-(void)initBg
{
}

//-(void)initSprite
//{}
//setpos(cgpoint p)
//{
//    bg.setposition(p);
////修改button的坐标
//}
//moveTo(pos(x, y), select(
//       ))

@end
