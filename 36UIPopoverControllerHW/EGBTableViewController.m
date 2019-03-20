//
//  EGBTableViewController.m
//  36UIPopoverControllerHW
//
//  Created by Eduard Galchenko on 3/17/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import "EGBTableViewController.h"
#import "PopoverViewController.h"
#import "DateViewController.h"
#import "EducationViewController.h"

@interface EGBTableViewController ()

@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) NSDate *date;

@end

@implementation EGBTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    PopoverViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PopoverViewController"];

    if ([segue.identifier  isEqual: @"InfoPopover"] && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {

        [self showViewControllerAsModal:vc];
    }
}

#pragma mark - Actions

- (IBAction)infoPopoverAction:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) showViewControllerAsModal:(UIViewController*) vc {
    
    [self presentViewController:vc animated:YES completion:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self dismissViewControllerAnimated:YES completion:nil];
        });
        
    }];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.nameTextField]) {
        
        [self.surnameTextField becomeFirstResponder];
        
    } else if ([textField isEqual:self.surnameTextField]) {
        
        [textField resignFirstResponder];
        
    }
    
    return YES;
}

#pragma mark - DatePickDelegete

- (void)didFinishEditingDate:(NSDate *)date {
    
    self.date = date;
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MMM/yyyy"];
    self.dateOfBirthTextField.text = [formatter stringFromDate:date];
    [self.tableView reloadData];
}

#pragma mark - EducationViewDelegate

- (void)didChoseEducation:(NSString *)education atIndexPath:(NSIndexPath *)indexPath {
    
    self.educationTextField.text = education;
    self.indexPath = indexPath;
    [self.tableView reloadData];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField == self.dateOfBirthTextField) {

        DateViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DateViewController"];
        vc.delegate = self;
        
        if (self.date) {
            
            vc.dateOfBirth = self.date;
        }
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {

            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            nav.modalPresentationStyle                   = UIModalPresentationPopover;
            nav.popoverPresentationController.sourceView = self.view;
            CGRect dateOfBirthRect = [self.tableView convertRect:textField.frame fromView:textField.superview];
            nav.popoverPresentationController.sourceRect = dateOfBirthRect;
            [self presentViewController:nav animated:YES completion:nil];
            
        } else {
            
            [self presentViewController:nav animated:YES completion:nil];
        }
        
        return NO;
        
    } else if (textField == self.educationTextField) {
        
        EducationViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EducationViewController"];
        vc.delegate = self;
        
        if (self.educationTextField.text) {
            
            vc.lastIndexPath = self.indexPath;
        }
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {

            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            nav.modalPresentationStyle                   = UIModalPresentationPopover;
            nav.popoverPresentationController.sourceView = self.view;
            CGRect dateOfBirthRect = [self.tableView convertRect:textField.frame fromView:textField.superview];
            nav.popoverPresentationController.sourceRect = dateOfBirthRect;
            [self presentViewController:nav animated:YES completion:nil];
            
        } else {
            
            [self presentViewController:nav animated:YES completion:nil];
        }
        
        return NO;
        
    } else {
        
        return YES;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
