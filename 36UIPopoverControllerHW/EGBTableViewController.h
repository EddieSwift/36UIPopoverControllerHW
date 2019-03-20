//
//  EGBTableViewController.h
//  36UIPopoverControllerHW
//
//  Created by Eduard Galchenko on 3/17/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverViewController.h"
#import "DateViewController.h"
#import "EducationViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EGBTableViewController : UITableViewController <UITextFieldDelegate, DatePickDelegete, EducationViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthTextField;
@property (weak, nonatomic) IBOutlet UITextField *educationTextField;

- (IBAction)infoPopoverAction:(UIBarButtonItem *)sender;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *allTextFields;

@end

NS_ASSUME_NONNULL_END
