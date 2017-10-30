//
//  GNRViewController.m
//  GNRCoreKit
//
//  Created by ly918@qq.com on 09/13/2017.
//  Copyright (c) 2017 ly918@qq.com. All rights reserved.
//

#import "GNRViewController.h"
#import <GNRCoreKit/GNRCoreKitHeader.h>

@interface GNRViewController ()

__PROPERTY_AT_COPY__(NSString, *name);

__PROPERTY_AT_ASSIGN__(NSInteger, count);


@end

@implementation GNRViewController
{
    GNRSwitch *sw;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor * color = [UIColor colorWithHexString:@"#a123f2"];
    
    UIImage * image = [UIImage imageWithColor:color size:CGSizeMake(50, 60)];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:imageView];
    
    sw = [[GNRSwitch alloc]init];
    sw.frame = CGRectMake(200, 200, 45*2, 25*2);
    [self.view addSubview:sw];
    [sw addTarget:self action:@selector(switchPressed:) forControlEvents:UIControlEventValueChanged];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [sw setOn:!sw.isOn animated:YES];
}

- (void)switchPressed:(GNRSwitch *)sender{
    NSLog(@"value %@ %d",sender, sender.isOn);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
