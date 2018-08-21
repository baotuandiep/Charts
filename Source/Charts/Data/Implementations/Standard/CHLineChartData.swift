//
//  CHLineChartData.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation

/// Data object that encapsulates all data associated with a LineChart.
open class CHLineChartData: CHChartData
{
    public override init()
    {
        super.init()
    }
    
    public override init(dataSets: [CHIChartDataSet]?)
    {
        super.init(dataSets: dataSets)
    }
}
