//
//  ViewController.m
//  DatePickerDemo
//
//  Created by 李冲 on 2018/9/27.
//  Copyright © 2018年 com.lc. All rights reserved.
//

#import "ViewController.h"
#import "HotelCalendarViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)packer:(id)sender {
    HotelCalendarViewController *vc =  [[HotelCalendarViewController alloc] init];
    vc.selectCheckDateBlock = ^(NSString *startDate, NSString *endDate, NSString *days) {
        self.dateLab.text = [NSString stringWithFormat:@"%@ --- %@  共%@晚",startDate,endDate,days];
    };
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}


@end
