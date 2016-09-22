//
//  CXYGameSettingViewController.m
//  CXYHBChess
//
//  Created by iMac on 14-9-4.
//  Copyright (c) 2014年 ___cxy___. All rights reserved.
//

#import "CXYGameSettingViewController.h"


@interface CXYGameSettingViewController ()
{
    IBOutlet UISegmentedControl* colorSegment;
    IBOutlet UISegmentedControl* levelSegment;
}
@end

@implementation CXYGameSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    colorSegment.selectedSegmentIndex = _colorIndex;
    levelSegment.selectedSegmentIndex = _levelIndex;
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)onSeleteColor:(UISegmentedControl*)sender
{
    if (self.colorBlock) {
        self.colorBlock(sender.selectedSegmentIndex);
    }
}

- (IBAction)onSeleteLevel:(UISegmentedControl*)sender
{
    if (self.levelBlock) {
        self.levelBlock(sender.selectedSegmentIndex);
    }
}

- (IBAction)onSaveSetting:(id)sender
{
    __typeof (&*self) __weak weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        if (weakSelf.saveBlock) {
            weakSelf.saveBlock();
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
