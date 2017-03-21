//
//  ShopController.m
//  FinaDesign
//
//  Created by  use on 15/10/31.
//  Copyright 2015年  use. All rights reserved.
//

#import "ShopController.h"


@implementation ShopController
- (id)init {
    if ((self = [super init])) {
        
        view = [ShopScene node];
        model = [ShopModel object];
        
        [self addChild:view];
        
        view.delegate = self;

        
        
        // update
        
    }
    
    return self;
}


-(void) gameStartBtn
{
    NSLog(@"bbbb");
//    view.addbtn()
    
}



//update{
//if (xxx)
//{
//    
//    view.setPos(model.getpos());
//}
//}

@end
