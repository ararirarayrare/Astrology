//
//  HomeContentViewMoonCalendar.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

final class HomeContentViewMoonCalendar: HomeContentViewItem {
    
    private var borderLayer: CALayer?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = .regularPoppinsFont(ofSize: 20)
        label.text = "Moon calendar"
        
        return label
    }()
    
    private let currentMoonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let currentMoonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    init(currentPhase: Moon, nextPhases: [Moon]) {
        super.init()
    
        setup(currentPhase: currentPhase, nextPhases: nextPhases)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if borderLayer == nil, bounds.size != .zero {
            let gradient = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = [
                UIColor(red: 122/255, green: 194/255, blue: 224/255, alpha: 1.0).cgColor,
                UIColor(red: 83/255, green: 39/255, blue: 197/255, alpha: 1.0).cgColor
            ]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            
            gradient.cornerRadius = layer.cornerRadius

            let shape = CAShapeLayer()
            shape.lineWidth = 0.75
            shape.path = UIBezierPath(roundedRect: bounds,
                                      cornerRadius: layer.cornerRadius).cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.fillColor = UIColor.clear.cgColor
            
            gradient.mask = shape
            
            self.borderLayer = gradient
            
            layer.insertSublayer(gradient, at: 0)
        }
        
    }
    
    private func setup(currentPhase: Moon, nextPhases: [Moon]) {
        backgroundColor = UIColor(red: 141/255, green: 112/255, blue: 1, alpha: 0.1)
        
        layer.cornerRadius = 20
        
        currentMoonImageView.image = currentPhase.image
        
        let attributedString = NSMutableAttributedString()
        
        attributedString.append(
            NSAttributedString(
                string: currentPhase.phase.string + "\n",
                attributes: [
                    .font : UIFont.regularPoppinsFont(ofSize: 20) ?? .boldSystemFont(ofSize: 20),
                    .foregroundColor : UIColor.white
                ]
            )
        )
        
        let dateString = DateFormatter().string(from: currentPhase.date, format: "MMM d, yyyy")
        
        attributedString.append(
            NSAttributedString(
                string: dateString,
                attributes: [
                    .font : UIFont.regularNunitoFont(ofSize: 16) ?? .systemFont(ofSize: 16),
                    .foregroundColor : UIColor(red: 205/255, green: 186/255, blue: 231/255, alpha: 1.0)
                ]
            )
        )
        
        currentMoonLabel.attributedText = attributedString
        
        for phase in nextPhases {
            let view = createPhaseView(phase: phase)
            stackView.addArrangedSubview(view)
        }
    }
  
    override func layout() {
        super.layout()
        
        addSubview(titleLabel)
        addSubview(currentMoonImageView)
        addSubview(currentMoonLabel)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -12),
            
            
//            currentMoonImageView.trailingAnchor.constraint(equalTo: centerXAnchor),
//            currentMoonImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
//                                                      constant: 20),
//            currentMoonImageView.heightAnchor.constraint(equalTo: widthAnchor,
//                                                         multiplier: 0.3),
//            currentMoonImageView.widthAnchor.constraint(equalTo: currentMoonImageView.heightAnchor),
            
            currentMoonImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                          constant: 24),
            currentMoonImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                      constant: 20),
            currentMoonImageView.widthAnchor.constraint(equalTo: widthAnchor,
                                                        multiplier: 0.25),
            currentMoonImageView.heightAnchor.constraint(equalTo: currentMoonImageView.widthAnchor),
            
            
            currentMoonLabel.leadingAnchor.constraint(equalTo: currentMoonImageView.trailingAnchor,
                                                constant: 16),
            currentMoonLabel.topAnchor.constraint(equalTo: currentMoonImageView.topAnchor,
                                            constant: 16),
            currentMoonLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -16),
            
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: -12),
            stackView.topAnchor.constraint(equalTo: currentMoonImageView.bottomAnchor,
                                           constant: 20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                              constant: -12)
        ])
    }
    
    private func createPhaseView(phase: Moon) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = phase.image
        imageView.contentMode = .scaleAspectFill
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .regularNunitoFont(ofSize: 14)
        label.textColor = UIColor(red: 199/255, green: 199/255, blue: 199/255, alpha: 1.0)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let dateString = dateFormatter.string(from: phase.date)
        
        label.text = dateString
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 8),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -8),
            imageView.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: 8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                       constant: 12),
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                          constant: -8)
        ])
        
        return view
    }
    
}
