//
//  BubbleChartDataSet.swift
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


open class CHBubbleChartDataSet: BarLineScatterCandleBubbleChartDataSet, CHIBubbleChartDataSet
{
    // MARK: - Data functions and accessors
    
    internal var _maxSize = CGFloat(0.0)
    
    open var maxSize: CGFloat { return _maxSize }
    @objc open var normalizeSizeEnabled: Bool = true
    open var isNormalizeSizeEnabled: Bool { return normalizeSizeEnabled }
    
    open override func calcMinMax(entry e: CHChartDataEntry)
    {
        guard let e = e as? CHBubbleChartDataEntry
            else { return }
        
        super.calcMinMax(entry: e)
        
        let size = e.size
        
        if size > _maxSize
        {
            _maxSize = size
        }
    }
    
    // MARK: - Styling functions and accessors
    
    /// Sets/gets the width of the circle that surrounds the bubble when highlighted
    open var highlightCircleWidth: CGFloat = 2.5
    
    // MARK: - NSCopying
    
    open override func copyWithZone(_ zone: NSZone?) -> AnyObject
    {
        let copy = super.copyWithZone(zone) as! CHBubbleChartDataSet
        copy._xMin = _xMin
        copy._xMax = _xMax
        copy._maxSize = _maxSize
        copy.highlightCircleWidth = highlightCircleWidth
        return copy
    }
}
