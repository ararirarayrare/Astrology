//
//  MainContentViewLunarCalendar.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class MainContentViewLunarCalendar: MainContentViewItem {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)
        label.text = "Lunar calendar:"
        
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
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 2
        
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
        
        backgroundColor = .blue.withAlphaComponent(0.25)
        layer.cornerRadius = 20
        
        currentMoonImageView.image = currentPhase.image
        
        let attributedString = NSMutableAttributedString()
        
        attributedString.append(
            NSAttributedString(
                string: currentPhase.phase.string + "\n",
                attributes: [
                    .font : UIFont.boldSystemFont(ofSize: 20),
                    .foregroundColor : UIColor.white
                ]
            )
        )
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let dateString = dateFormatter.string(from: currentPhase.date)
        
        attributedString.append(
            NSAttributedString(
                string: dateString,
                attributes: [
                    .font : UIFont.systemFont(ofSize: 18),
                    .foregroundColor : UIColor.white
                ]
            )
        )
        
        currentMoonLabel.attributedText = attributedString
        
        
        for phase in nextPhases {
            let view = createPhaseView(phase: phase)
            stackView.addArrangedSubview(view)
        }
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            
            
            currentMoonImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                          constant: 12),
            currentMoonImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                      constant: 20),
            currentMoonImageView.heightAnchor.constraint(equalTo: widthAnchor,
                                                         multiplier: 0.3),
            currentMoonImageView.widthAnchor.constraint(equalTo: currentMoonImageView.heightAnchor),
            
            
            currentMoonLabel.leadingAnchor.constraint(equalTo: currentMoonImageView.trailingAnchor,
                                                constant: 16),
            currentMoonLabel.topAnchor.constraint(equalTo: currentMoonImageView.topAnchor,
                                            constant: 16),
            currentMoonLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -16),
            
            
            stackView.leadingAnchor.constraint(equalTo: currentMoonImageView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: currentMoonLabel.trailingAnchor),
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
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
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
