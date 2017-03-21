//
//  MainController.h
//  FinaDesign
//
//  Created by  use on 15/11/1.
//  Copyright 2015年  use. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MainModel.h"
#import "MainView.h"

@interface MainController : CCNode <callMainDelegate>
{
    MainModel *model;
    MainView *view;
}

@end
