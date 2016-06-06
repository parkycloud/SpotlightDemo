//
//  FirstViewController.m
//  SpotlightDemo
//
//  Created by xmc on 16/2/12.
//  Copyright © 2016年 parkycloud. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"英雄联盟";
    
    self.view.backgroundColor = [UIColor redColor];
    
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
