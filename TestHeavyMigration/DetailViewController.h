//
//  DetailViewController.h
//  TestHeavyMigration
//
//  Created by Thomas Dubiel on 05.01.18.
//  Copyright © 2018 Crazy Nexus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestHeavyMigration+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Event *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

