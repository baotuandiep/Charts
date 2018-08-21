//
//  BarLineScatterCandleBubbleChartDataProvider.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

@objc
public protocol CHBarLineScatterCandleBubbleChartDataProvider: CHChartDataProvider
{
    func getTransformer(forAxis: CHYAxis.AxisDependency) -> CHTransformer
    func isInverted(axis: CHYAxis.AxisDependency) -> Bool
    
    var lowestVisibleX: Double { get }
    var highestVisibleX: Double { get }
}
