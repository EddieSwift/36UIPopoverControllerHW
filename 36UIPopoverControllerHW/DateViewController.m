//
//  DateViewController.m
//  36UIPopoverControllerHW
//
//  Created by Eduard Galchenko on 3/19/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import "DateViewController.h"
#import "EGBTableViewController.h"

@interface DateViewController ()

@end

@implementation DateViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if (self.dateOfBirth) {
        
        self.datePicker.date = self.dateOfBirth;
    }
}

#pragma mark - Actions

- (IBAction)dateDoneAction:(UIBarButtonItem *)sender {
    
    self.dateOfBirth = self.datePicker.date;
    [self.delegate didFinishEditingDate:self.dateOfBirth];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
