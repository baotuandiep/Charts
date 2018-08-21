//
//  ZoomViewJob.swift
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

@objc(ZoomChartViewJob)
open class CHZoomViewJob: CHViewPortJob
{
    internal var scaleX: CGFloat = 0.0
    internal var scaleY: CGFloat = 0.0
    internal var axisDependency: CHYAxis.AxisDependency = .left
    
    @objc public init(
        viewPortHandler: CHViewPortHandler,
        scaleX: CGFloat,
        scaleY: CGFloat,
        xValue: Double,
        yValue: Double,
        transformer: CHTransformer,
        axis: CHYAxis.AxisDependency,
        view: CHChartViewBase)
    {
        super.init(
            viewPortHandler: viewPortHandler,
            xValue: xValue,
            yValue: yValue,
            transformer: transformer,
            view: view)
        
        self.scaleX = scaleX
        self.scaleY = scaleY
        self.axisDependency = axis
    }
    
    open override func doJob()
    {
        guard
            let viewPortHandler = viewPortHandler,
            let transformer = transformer,
            let view = view
            else { return }
        
        var matrix = viewPortHandler.setZoom(scaleX: scaleX, scaleY: scaleY)
        viewPortHandler.refresh(newMatrix: matrix, chart: view, invalidate: false)
        
        let yValsInView = (view as! CHBarLineChartViewBase).getAxis(axisDependency).axisRange / Double(viewPortHandler.scaleY)
        let xValsInView = (view as! CHBarLineChartViewBase).xAxis.axisRange / Double(viewPortHandler.scaleX)
        
        var pt = CGPoint(
            x: CGFloat(xValue - xValsInView / 2.0),
            y: CGFloat(yValue + yValsInView / 2.0)
        )
        
        transformer.pointValueToPixel(&pt)
        
        matrix = viewPortHandler.translate(pt: pt)
        viewPortHandler.refresh(newMatrix: matrix, chart: view, invalidate: false)
        
        (view as! CHBarLineChartViewBase).calculateOffsets()
        view.setNeedsDisplay()
    }
}
