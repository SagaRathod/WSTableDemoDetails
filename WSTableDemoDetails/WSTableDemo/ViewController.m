//
//  ViewController.m
//  WSTableDemo
//
//  Created by Sagar on 15/06/18.
//  Copyright © 2018 sagar. All rights reserved.
//
//http://services.groupkt.com/country/get/all for practce
#import "ViewController.h"
#import "webCell.h"
#import "newViewController.h"
@interface ViewController ()
{
    NSMutableArray *array;
}
@property(nonatomic,strong)webCell *cell;
@end

@implementation ViewController
@synthesize mytab,cell;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url=[NSURL URLWithString:@"http://api.androidhive.info/contacts/"];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *  response, NSData * data, NSError *  connectionError)
    {
        array=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"array==%@",array);
        
        //NSError *err;
       // NSDictionary *green=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
        
        NSDictionary *dicAllNetworks = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        array = [NSMutableArray array];
        for (NSDictionary *dic in [dicAllNetworks objectForKey:@"contacts"])
        {
            [array addObject:@{@"id" : [dic objectForKey:@"id"], @"name": [dic objectForKey:@"name"]}];
            
        }
              //array=[green  valueForKey:@"Contacts"];
              NSLog(@"array==%@",array);
           [mytab reloadData];
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *iden=@"Cell";
    cell=[tableView dequeueReusableCellWithIdentifier:iden];
    cell.idText.text=[NSString stringWithFormat:@"%@",[[array objectAtIndex:indexPath.row] objectForKey:@"id"]];
    cell.contentText.text=[NSString stringWithFormat:@"%@",[[array objectAtIndex:indexPath.row] objectForKey:@"name"]];
    
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"showdetail" sender:[tableView cellForRowAtIndexPath:indexPath]];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showdetail"])
    {
        NSIndexPath *indexPath=[self.mytab indexPathForSelectedRow];
        newViewController *dataController=segue.destinationViewController;
        dataController.strName=[NSString stringWithFormat:@"%@",[[array objectAtIndex:indexPath.row] objectForKey:@"id"]];
        dataController.strAddress=[NSString stringWithFormat:@"%@",[[array objectAtIndex:indexPath.row] objectForKey:@"name"]];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
