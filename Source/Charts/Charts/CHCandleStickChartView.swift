//
//  CandleStickChartView.swift
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

/// Financial chart type that draws candle-sticks.
open class CHCandleStickChartView: CHBarLineChartViewBase, CHCandleChartDataProvider
{
    internal override func initialize()
    {
        super.initialize()
        
        renderer = CHCandleStickChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
        
        self.xAxis.spaceMin = 0.5
        self.xAxis.spaceMax = 0.5
    }
    
    // MARK: - CandleChartDataProvider
    
    open var candleData: CHCandleChartData?
    {
        return _data as? CHCandleChartData
    }
}
