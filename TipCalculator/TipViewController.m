//
//  ViewController.m
//  TipCalculator
//
//  Created by jiafang_jiang on 3/16/17.
//  Copyright © 2017 jiafang_jiang. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextView;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewWillAppear:(BOOL)animated {

}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Tip Calculator";
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSInteger defaultTipIdx = [defaults integerForKey:@"defaultTipIdx"];
  [self.tipControl setSelectedSegmentIndex:defaultTipIdx];
  [self updateValues];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
  [self.view endEditing:YES];
  [self updateValues];
}

- (void)updateValues {
  float billAmount = [self.billTextView.text floatValue];
  NSArray *tipValues = @[@0.15, @0.18, @0.2];
  float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
  float totalAmount = billAmount + tipAmount;
  
  self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
  self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];

}
- (IBAction)onValueChanged:(UISegmentedControl *)sender {
  [self updateValues];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}


@end
