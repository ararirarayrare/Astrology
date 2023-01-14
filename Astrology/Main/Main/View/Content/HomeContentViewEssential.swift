//
//  HomeContentViewEssential.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class HomeContentViewEssential: HomeContentViewItem {
    
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
        titleLabel.font = .boldGothamPro(ofSize: 18)
        titleLabel.textColor = .white
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = true
        
        
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        progressView.trackTintColor = .darkGray
        progressView.progress = progress
        progressView.layer.cornerRadius = 6
        progressView.layer.masksToBounds = true
        

        let progressLabel = UILabel()
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.font = .boldGothamPro(ofSize: 18)
        progressLabel.textColor = .white
        progressLabel.textAlignment = .left
        progressLabel.text = "\(Int(progress * 100))%"
        titleLabel.adjustsFontSizeToFitWidth = true
        
        
        view.addSubview(titleLabel)
        view.addSubview(progressLabel)
        view.addSubview(progressView)
        
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            
            
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                              constant: 6),
            progressView.heightAnchor.constraint(equalToConstant: 12),

            
            progressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor,
                                               constant: 6),
            progressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }
    
}
