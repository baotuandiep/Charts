//
//  DemoBaseViewController.h
//  ChartsDemo
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

#import <UIKit/UIKit.h>
#import "ChartsDemo_iOS-Swift.h"

@interface DemoBaseViewController : UIViewController
{
@protected
    NSArray *parties;
}

@property (nonatomic, strong) IBOutlet UIButton *optionsButton;
@property (nonatomic, strong) IBOutlet NSArray *options;

@property (nonatomic, assign) BOOL shouldHideData;

- (void)handleOption:(NSString *)key forChartView:(CHChartViewBase *)chartView;

- (void)updateChartData;

- (void)setupPieChartView:(CHPieChartView *)chartView;
- (void)setupRadarChartView:(CHRadarChartView *)chartView;
- (void)setupBarLineChartView:(CHBarLineChartViewBase *)chartView;

@end
