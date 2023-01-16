//
//  HomeContentViewBiorythmChartView.swift
//  Astrology
//
//  Created by mac on 10.01.2023.
//

import UIKit

class HomeContentViewBiorythmChartView: UIView {
    
    private let todayLineView: UIView = {
        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 2
        return view
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "biorythm-bg")
        
        return imageView
    }()
        
    private var physicalChart: CALayer?
    private var emotionalChart: CALayer?
    private var intellectualChart: CALayer?
    
    init() {
        super.init(frame: .zero)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if physicalChart == nil,
           emotionalChart == nil,
           intellectualChart == nil,
           bounds.size != .zero {
            
            physicalChart = addShapeLayer(forBiorythm: .physical)
            emotionalChart = addShapeLayer(forBiorythm: .emotional)
            intellectualChart = addShapeLayer(forBiorythm: .intellectual)

            todayLineView.frame.size = CGSize(width: 4, height: bounds.height + 12)
            todayLineView.center.x = bounds.midX * 0.75
            todayLineView.frame.origin.y = -6
        }
        
    }
    
    private func setup() {  }
    
    private func layout() {
        addSubview(backgroundImageView)
        addSubview(todayLineView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func addShapeLayer(forBiorythm biorythm: Biorythm) -> CALayer {
        let shape = CAShapeLayer()
        
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        
        shape.lineWidth = 3
        
        shape.lineCap = .round
        shape.lineJoin = .round
        
        shape.path = path(forBiorythm: biorythm)
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = biorythm.colors
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        gradient.mask = shape
        
        self.layer.addSublayer(gradient)
        
        return gradient
    }
    
    private func path(forBiorythm biorythm: Biorythm) -> CGPath {
        let path = UIBezierPath()
        
        let yesterdayValue = biorythm.value(forDate: .yesterday)
        let todayValue = biorythm.value(forDate: Date())
        let tomorrowValue = biorythm.value(forDate: .tomorrow)
        let dayAfterTomorrowValue = biorythm.value(forDate: .dayAfterTomorrow)
                                        
        
        let yesterdayPoint = position(forBiorythmValue: yesterdayValue,
                                         x: bounds.minX)
        
        let todayPoint = position(forBiorythmValue: todayValue,
                                     x: bounds.midX * 0.75)
        
        let tomorrowPoint = position(forBiorythmValue: tomorrowValue,
                                        x: bounds.maxX * 0.75)
        
        let dayAfterTomorrowPoint = position(forBiorythmValue: dayAfterTomorrowValue,
                                                x: bounds.maxX)
        
        path.move(to: yesterdayPoint)
        path.addCurve(to: dayAfterTomorrowPoint,
                      controlPoint1: todayPoint,
                      controlPoint2: tomorrowPoint)
        path.addClip()
        
        if let color = biorythm.colors.first {
            let center = CGPoint(x: todayPoint.x, y: todayPoint.y - 1.5)
            addPointView(withColor: UIColor(cgColor: color), center: center)
        }

        return path.cgPath
    }

    private func position(forBiorythmValue value: Float, x: CGFloat) -> CGPoint {
        var y: CGFloat {
            let value = CGFloat(value)
            let halfHeight = bounds.height / 2
            
            if value >= 0 {
                return halfHeight * (1 - value)
            } else {
                return (halfHeight * -value) + halfHeight
            }
        }
        
        return CGPoint(x: x, y: y)
    }
    
    private func addPointView(withColor color: UIColor, center: CGPoint) {
        let view = UIView()
        view.frame.size = CGSize(width: 10, height: 10)
        view.center = center
        view.backgroundColor = color
        view.layer.cornerRadius = 5
        
        addSubview(view)
    }

}



