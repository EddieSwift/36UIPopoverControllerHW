//
//  DateViewController.h
//  36UIPopoverControllerHW
//
//  Created by Eduard Galchenko on 3/19/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DatePickDelegete;

@interface DateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) id <DatePickDelegete> delegate;
@property (strong, nonatomic) NSDate *dateOfBirth;

- (IBAction)dateDoneAction:(UIBarButtonItem *)sender;

@end

@protocol DatePickDelegete <NSObject>

@required

- (void)didFinishEditingDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
