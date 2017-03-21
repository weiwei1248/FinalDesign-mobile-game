//
//  ShopController.h
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ShopScene.h"
#import "ShopModel.h"

@interface ShopController : CCNode <callParentDelegate>  
{
    ShopScene *view;
    ShopModel *model;
}

-(void) gameStartBtn;
@end
