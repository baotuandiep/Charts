//
//  DefaultFillFormatter.swift
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

#if !os(OSX)
    import UIKit
#endif

/// Default formatter that calculates the position of the filled line.
@objc(ChartDefaultFillFormatter)
open class CHDefaultFillFormatter: NSObject, CHIFillFormatter
{
    public typealias Block = (
        _ dataSet: CHILineChartDataSet,
        _ dataProvider: CHLineChartDataProvider) -> CGFloat
    
    @objc open var block: Block?
    
    public override init() { }
    
    @objc public init(block: @escaping Block)
    {
        self.block = block
    }
    
    @objc public static func with(block: @escaping Block) -> CHDefaultFillFormatter?
    {
        return CHDefaultFillFormatter(block: block)
    }
    
    open func getFillLinePosition(
        dataSet: CHILineChartDataSet,
        dataProvider: CHLineChartDataProvider) -> CGFloat
    {
        guard block == nil else { return block!(dataSet, dataProvider) }
        var fillMin: CGFloat = 0.0

        if dataSet.yMax > 0.0 && dataSet.yMin < 0.0
        {
            fillMin = 0.0
        }
        else if let data = dataProvider.data
        {
            let max = data.yMax > 0.0 ? 0.0 : dataProvider.chartYMax
            let min = data.yMin < 0.0 ? 0.0 : dataProvider.chartYMin

            fillMin = CGFloat(dataSet.yMin >= 0.0 ? min : max)
        }

        return fillMin
    }
}
