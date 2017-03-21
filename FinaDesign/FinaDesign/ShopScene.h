//
//  ShopScene.h
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol callParentDelegate <NSObject>
//-(void) setlable;
@end


@interface ShopScene : CCNode {
    id<callParentDelegate> delegate;
    CCMenuItemImage *button;
    
}
@property CCMenuItemImage *button;
-(void)aaa;
@property(nonatomic,retain) id<callParentDelegate> delegate;  
@end
