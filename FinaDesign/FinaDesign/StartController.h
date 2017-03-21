//
//  StartController.h
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "StartModel.h"
#import "StartView.h"

@interface StartController : CCNode <callStartDelegate>
{
    StartView *view;
    StartModel *model;
}

@end
