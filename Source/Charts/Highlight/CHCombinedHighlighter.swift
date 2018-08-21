//
//  CombinedHighlighter.swift
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

@objc(CombinedChartHighlighter)
open class CHCombinedHighlighter: CHChartHighlighter
{
    /// bar highlighter for supporting stacked highlighting
    private var barHighlighter: CHBarHighlighter?
    
    @objc public init(chart: CHCombinedChartDataProvider, barDataProvider: CHBarChartDataProvider)
    {
        super.init(chart: chart)
        
        // if there is BarData, create a BarHighlighter
        self.barHighlighter = barDataProvider.barData == nil ? nil : CHBarHighlighter(chart: barDataProvider)
    }
    
    open override func getHighlights(xValue: Double, x: CGFloat, y: CGFloat) -> [CHHighlight]
    {
        var vals = [CHHighlight]()
        
        guard
            let chart = self.chart as? CHCombinedChartDataProvider,
            let dataObjects = chart.combinedData?.allData
            else { return vals }
        
        for i in 0..<dataObjects.count
        {
            let dataObject = dataObjects[i]

            // in case of BarData, let the BarHighlighter take over
            if barHighlighter != nil && dataObject is CHBarChartData,
                let high = barHighlighter?.getHighlight(x: x, y: y)
            {
                high.dataIndex = i
                vals.append(high)
            }
            else
            {
                for j in 0..<dataObject.dataSetCount
                {
                    guard let dataSet = dataObject.getDataSetByIndex(j),
                        dataSet.isHighlightEnabled      // don't include datasets that cannot be highlighted
                        else { continue }

                    let highs = buildHighlights(dataSet: dataSet, dataSetIndex: j, xValue: xValue, rounding: .closest)

                    for high in highs
                    {
                        high.dataIndex = i
                        vals.append(high)
                    }
                }
            }
        }
        
        return vals
    }
}
