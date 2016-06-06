//
//  SecondViewController.m
//  SpotlightDemo
//
//  Created by xmc on 16/2/12.
//  Copyright © 2016年 parkycloud. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"梦幻西游";
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    
    self.navigationItem.rightBarButtonItem = ({
    
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelCurrentView:)];
        
    
        cancelItem;
        
    });
    
}


- (void)cancelCurrentView:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
