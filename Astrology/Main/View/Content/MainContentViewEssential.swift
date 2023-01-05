//
//  MainContentViewEssential.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class MainContentViewEssential: MainContentViewItem {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        
        return stackView
    }()
    
    init(parameters: [String : Float]) {
        super.init()
        
        setup(with: parameters)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setup(with parameters: [String : Float]) {
        backgroundColor = .clear
                
        for (title, progress) in parameters {
            let indicatorView = createIndicatorView(title: title, progress: progress)
            stackView.addArrangedSubview(indicatorView)
        }
    }
    
    private func createIndicatorView(title: String, progress: Float) -> UIView {
        let view = UIView()
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .white
        titleLabel.text = title
        titleLabel.textAlignment = .left
        
        
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .purple
        progressView.trackTintColor = .lightGray.withAlphaComponent(0.5)
        progressView.progress = progress
        
        
        let progressLabel = UILabel()
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.font = .boldSystemFont(ofSize: 18)
        progressLabel.textColor = .systemBlue
        progressLabel.textAlignment = .left
        progressLabel.text = "\(Int(progress * 100))%"
        
        view.addSubview(titleLabel)
        view.addSubview(progressView)
        view.addSubview(progressLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 4),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -4),
            
            progressView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            progressView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                              constant: 4),
            progressView.heightAnchor.constraint(equalToConstant: 4),
            
            
            progressLabel.leadingAnchor.constraint(equalTo: progressView.leadingAnchor),
            progressLabel.trailingAnchor.constraint(equalTo: progressView.trailingAnchor),
            progressLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor,
                                               constant: 4),
            progressLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                  constant: -4)
        ])
        
        return view
    }
    
}
