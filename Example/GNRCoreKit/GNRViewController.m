//
//  GNRViewController.m
//  GNRCoreKit
//
//  Created by ly918@qq.com on 09/13/2017.
//  Copyright (c) 2017 ly918@qq.com. All rights reserved.
//

#import "GNRViewController.h"
#import "GNRCoreKitHeader.h"

@interface GNRViewController ()

@end

@implementation GNRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor * color = [UIColor colorWithHexString:@"#a123f2"];
    
    UIImage * image = [UIImage imageWithColor:color size:CGSizeMake(50, 60)];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:imageView];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
