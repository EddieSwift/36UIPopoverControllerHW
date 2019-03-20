//
//  EducationViewController.m
//  36UIPopoverControllerHW
//
//  Created by Eduard Galchenko on 3/19/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()

@property (strong, nonatomic) NSArray* educationDegrees;

@end

@implementation EducationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if (self.lastIndexPath) {
        
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.lastIndexPath];
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.lastIndexPath) {
        
        [[tableView cellForRowAtIndexPath:self.lastIndexPath] setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    if (cell.detailTextLabel.text) {
        
        self.education = [NSString stringWithFormat:@"%@ (%@)", cell.textLabel.text, cell.detailTextLabel.text];
        
    } else {
        
        self.education = cell.textLabel.text;
    }
    
    self.lastIndexPath = indexPath;
}

#pragma mark - Actions

- (IBAction)educationDoneAction:(UIBarButtonItem *)sender {
    
    [self.delegate didChoseEducation:self.education atIndexPath:self.lastIndexPath];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
