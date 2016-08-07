//
//  OBTextField.m
//  Temp
//
//  Created by ppzc on 16/8/8.
//  Copyright © 2016年 ppzc. All rights reserved.
//

#import "OBTextField.h"

@implementation OBTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addTarget:self
                 action:@selector(valueChanged)
       forControlEvents:UIControlEventAllEditingEvents
         ];
    }
    return self;
}
- (void)valueChanged{
    //self.text 只有经过赋值observer才能够监测到它的改变
    NSString *temp = self.text;
    self.text = temp;
}
@end
