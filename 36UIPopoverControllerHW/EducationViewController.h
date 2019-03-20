//
//  EducationViewController.h
//  36UIPopoverControllerHW
//
//  Created by Eduard Galchenko on 3/19/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol EducationViewDelegate;

@interface EducationViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id <EducationViewDelegate> delegate;
@property (strong, nonatomic) NSIndexPath *lastIndexPath;
@property (strong, nonatomic) NSString *education;

- (IBAction)educationDoneAction:(UIBarButtonItem *)sender;

@end

@protocol EducationViewDelegate <NSObject>

@required

- (void)didChoseEducation:(NSString *)education atIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
