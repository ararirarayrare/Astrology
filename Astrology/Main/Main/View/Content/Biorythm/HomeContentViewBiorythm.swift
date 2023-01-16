//
//  HomeContentViewBiorythm.swift
//  Astrology
//
//  Created by mac on 28.12.2022.
//

import UIKit

class HomeContentViewBiorythm: HomeContentViewItem {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Biorythm"
        
        return label
    }()

    private let containerView: HomeContentViewBiorythmContainerView = {
        let view = HomeContentViewBiorythmContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func layout() {
        super.layout()
        
        addSubview(titleLabel)
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 12),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            

            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: 24),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
}
