//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by jiafang_jiang on 3/18/17.
//  Copyright © 2017 jiafang_jiang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipAmount;

@end

@implementation SettingsViewController

- (void)viewWillAppear:(BOOL)animated {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSInteger defaultTipIdx = [defaults integerForKey:@"defaultTipIdx"];
  if (defaultTipIdx != 0) {
    [self.defaultTipAmount setSelectedSegmentIndex:defaultTipIdx];
  }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender {
  NSInteger updatedIdx = self.defaultTipAmount.selectedSegmentIndex;
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setInteger:updatedIdx forKey:@"defaultTipIdx"];
  [defaults synchronize];
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
