//
//  LineChartView.swift
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

/// Chart that draws lines, surfaces, circles, ...
open class CHLineChartView: CHBarLineChartViewBase, CHLineChartDataProvider
{
    internal override func initialize()
    {
        super.initialize()
        
        renderer = CHLineChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
    }
    
    // MARK: - LineChartDataProvider
    
    open var lineData: CHLineChartData? { return _data as? CHLineChartData }
}
