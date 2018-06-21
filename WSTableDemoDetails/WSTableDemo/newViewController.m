//
//  webCell.h
//  WSTableDemo
//
//  Created by Sagar on 15/06/18.
//  Copyright © 2018 sagar. All rights reserved.
//

#import "newViewController.h"


@interface newViewController ()

@end

@implementation newViewController
@synthesize strAddress,strName;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _name.text=strName;
    _address.text=strAddress;
    
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
