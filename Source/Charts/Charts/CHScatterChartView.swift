//
//  ScatterChartView.swift
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

/// The ScatterChart. Draws dots, triangles, squares and custom shapes into the chartview.
open class CHScatterChartView: CHBarLineChartViewBase, CHScatterChartDataProvider
{
    open override func initialize()
    {
        super.initialize()
        
        renderer = CHScatterChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)

        xAxis.spaceMin = 0.5
        xAxis.spaceMax = 0.5
    }
    
    // MARK: - ScatterChartDataProvider
    
    open var scatterData: CHScatterChartData? { return _data as? CHScatterChartData }
}
