//
//  ViewController.m
//  Objc-OpenCCDemo
//
//  Created by 熊伟 on 2016/5/18.
//  Copyright © 2016年 熊伟. All rights reserved.
//

#import "ViewController.h"
#import "Objc_OpenCC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)textDidChange:(NSNotification *)notif
{
    NSLog(@"%@",notif.object);
    
    UITextField *field = notif.object;
    
    mLabel.text = [field.text simpleToTrad];
}
//
//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
//    mLabel.text = [textField.text simpleToTrad];
//
//}




-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    mLabel.text = [textField.text simpleToTrad];
    
    return YES;
}


@end
