//
//  ShopModel.h
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ShopModel : NSObject  {
    CGPoint *bgPos;
}

-(ShopModel *)init;

-(void)setBgPos:(CGPoint*)p;
-(CGPoint*)getBgPos;

@end
