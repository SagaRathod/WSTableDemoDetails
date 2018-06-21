//
//  ViewController.h
//  WSTableDemo
//
//  Created by Sagar on 15/06/18.
//  Copyright © 2018 sagar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)IBOutlet UITableView *mytab;


@end

