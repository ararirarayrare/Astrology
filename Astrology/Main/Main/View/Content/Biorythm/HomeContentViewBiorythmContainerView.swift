//
//  HomeContentViewBiorythmContainerView.swift
//  Astrology
//
//  Created by mac on 10.01.2023.
//

import UIKit

class HomeContentViewBiorythmContainerView: UIView {
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let percentsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "percents")
        
        return imageView
    }()
    
    private let chartView: HomeContentViewBiorythmChartView = {
        let view = HomeContentViewBiorythmChartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        Biorythm.allCases.forEach { biorythm in
            let view = createView(forBiorythm: biorythm)
            topStackView.addArrangedSubview(view)
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        
        var yesterdayString: String {
            guard let date = Date.yesterday else {
                return "Yesterday"
            }
            
            return dateFormatter.string(from: date)
        }
        
        var tomorrowString: String {
            guard let date = Date.tomorrow else {
                return "Tomorrow"
            }
            
            return dateFormatter.string(from: date)
        }
        
        var dayAfterTomorrowString: String {
            guard let date = Date.dayAfterTomorrow else {
                return "Day after tomorrow"
            }
            
            return dateFormatter.string(from: date)
        }
        
        let yesterdayLabel = createLabel(text: yesterdayString, aligment: .left)
        let todayLabel = createLabel(text: "Today", aligment: .center)
        let tomorrowLabel = createLabel(text: tomorrowString, aligment: .right)
        let dayAfterTomorrowLabel = createLabel(text: dayAfterTomorrowString, aligment: .right)
        
        bottomStackView.addArrangedSubview(yesterdayLabel)
        bottomStackView.addArrangedSubview(todayLabel)
        bottomStackView.addArrangedSubview(tomorrowLabel)
        bottomStackView.addArrangedSubview(dayAfterTomorrowLabel)
    }
    
    private func layout() {
        addSubview(topStackView)
        addSubview(percentsImageView)
        addSubview(chartView)
        addSubview(bottomStackView)
        
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topAnchor),
            
            
            percentsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            percentsImageView.heightAnchor.constraint(equalToConstant: 180),
            percentsImageView.widthAnchor.constraint(equalTo: percentsImageView.heightAnchor,
                                                     multiplier: 0.16),
            percentsImageView.topAnchor.constraint(equalTo: topStackView.bottomAnchor,
                                                  constant: 16),
            
            
            chartView.topAnchor.constraint(equalTo: percentsImageView.topAnchor),
            chartView.leadingAnchor.constraint(equalTo: percentsImageView.trailingAnchor,
                                               constant: 4),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: percentsImageView.bottomAnchor),
            
            
            topStackView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor,
                                               constant: 12),
            topStackView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor,
                                               constant: -12),
            
            
            bottomStackView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            bottomStackView.topAnchor.constraint(equalTo: chartView.bottomAnchor,
                                                 constant: 8),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func createView(forBiorythm biorythm: Biorythm) -> UIView {
        let view = UIView()
        
        let colorView = UIImageView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.image = UIImage(named: String(describing: biorythm) + "-bar")
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .regularPoppinsFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.text = biorythm.title
        
        
        view.addSubview(colorView)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            colorView.heightAnchor.constraint(equalToConstant: 4),
            colorView.widthAnchor.constraint(equalToConstant: 24),
            
            
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: colorView.trailingAnchor,
                                          constant: 4)
        ])
        
        return view
    }
    
    private func createLabel(text: String, aligment: NSTextAlignment) -> UILabel {
        let label = UILabel()
         
        let isToday = text == "Today"
        label.font = isToday ? .regularPoppinsFont(ofSize: 16) : .regularNunitoFont(ofSize: 14)
        label.textColor = isToday ? .white : UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
        label.textAlignment = aligment
        label.text = text
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }
    
}
