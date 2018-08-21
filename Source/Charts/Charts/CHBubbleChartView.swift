//
//  BubbleChartView.swift
//  Charts
//
//  Bubble chart implementation:
//    Copyright 2015 Pierre-Marc Airoldi
//    Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

open class CHBubbleChartView: CHBarLineChartViewBase, CHBubbleChartDataProvider
{
    open override func initialize()
    {
        super.initialize()
        
        renderer = CHBubbleChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
    }
    
    // MARK: - BubbleChartDataProvider
    
    open var bubbleData: CHBubbleChartData? { return _data as? CHBubbleChartData }
}
