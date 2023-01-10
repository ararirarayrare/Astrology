//
//  MainContentViewBiorythm.swift
//  Astrology
//
//  Created by mac on 28.12.2022.
//

import UIKit

class MainContentViewBiorythm: MainContentViewItem {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Biorythm"
        
        return label
    }()
    
    private let chartView: MainContentViewBiorythmChartView = {
        let view = MainContentViewBiorythmChartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        return view
    }()

    
    init(biorythms: [Biorythm]) {
        super.init()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        
        addSubview(titleLabel)
        addSubview(chartView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),

            
            chartView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 20),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: -20),
            chartView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: 24),
            chartView.heightAnchor.constraint(equalToConstant: 200.0),
            chartView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setup(with biorythms: [Biorythm]) {
        backgroundColor = .clear

    }
    
    
}

class MainContentViewBiorythmChartView: UIView {
        
    private var physicalShape: CAShapeLayer?
    private var emotionalShape: CAShapeLayer?
    private var intellectualShape: CAShapeLayer?
    
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
        
        if physicalShape == nil,
           emotionalShape == nil,
           intellectualShape == nil,
           bounds.size != .zero {
            
            physicalShape = addShapeLayer(forBiorythm: .physical)
            emotionalShape = addShapeLayer(forBiorythm: .emotional)
            intellectualShape = addShapeLayer(forBiorythm: .intellectual)
            
        }
        
    }
    
    private func setup() {
        backgroundColor = .lightGray.withAlphaComponent(0.1)
    }
    
    private func layout() {
        
    }
    
    private func addShapeLayer(forBiorythm biorythm: Biorythm) -> CAShapeLayer {
        let layer = CAShapeLayer()
        
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = biorythm.barColor.cgColor
        
        layer.lineWidth = 2
        
        layer.lineCap = .round
        layer.lineJoin = .round
        
        layer.path = path(forBiorythm: biorythm)
        
        self.layer.addSublayer(layer)
        
        return layer
    }
    
    private func path(forBiorythm biorythm: Biorythm) -> CGPath {
        let path = UIBezierPath()
        
        let yesterdayPosition = position(x: bounds.minX, biorythmValue: biorythm.yesterdayValue)
        let todayPosition = position(x: bounds.midX, biorythmValue: biorythm.todayValue)
        let tomorrowPosition = position(x: bounds.maxX, biorythmValue: biorythm.tomorrowValue)
        
        path.move(to: yesterdayPosition)
        path.addQuadCurve(to: tomorrowPosition, controlPoint: todayPosition)
        path.addClip()
        
        return path.cgPath
    }

    private func position(x: CGFloat, biorythmValue value: Float) -> CGPoint {
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

}


