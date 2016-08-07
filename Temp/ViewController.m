//
//  ViewController.m
//  Temp
//
//  Created by ppzc on 16/8/2.
//  Copyright © 2016年 ppzc. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>
#import "OBButton.h"
#import "OBTextField.h"
@interface ViewController ()
{
    OBButton *_obbutton;
    OBTextField *obtext;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    obtext = [[OBTextField alloc] init];
    [obtext.layer setBorderColor:[UIColor redColor].CGColor];
    [obtext.layer setBorderWidth:1.f];
    [self.view addSubview:obtext];
    
//    [obtext addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventAllEditingEvents];
    
    [obtext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.and.width.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
    _obbutton = [[OBButton alloc] init];
    [_obbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_obbutton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_obbutton.titleLabel setFont:[UIFont systemFontOfSize:15.f]];
    
    [_obbutton.layer setBorderColor:[UIColor redColor].CGColor];
    [_obbutton.layer setBorderWidth:1.f];
    [self.view addSubview:_obbutton];
    
    [_obbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(obtext.mas_bottom).offset(10);
        make.right.left.and.width.equalTo(obtext);
    }];
    
    [obtext addObserver:self
             forKeyPath:@"text"
                options:NSKeyValueObservingOptionNew
                context:nil
     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"text"]) {
        [_obbutton setTitle:[change objectForKey:@"new"] forState:UIControlStateNormal];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [obtext resignFirstResponder];
}

- (void)valueChanged{
    [_obbutton setTitle:obtext.text forState:UIControlStateNormal];
}



@end
