//
//  ViewController.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainViewController: ViewController {
    
    private let headerView: MainHeaderView = {
        let headerView = MainHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let infoView: MainInfoView = {
        let infoView = MainInfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()

    private let contentView: MainContentView = {
        let contentView = MainContentView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .blue.withAlphaComponent(0.1)
        
        layout()
    }

    private func layout() {
        view.addSubview(headerView)
        view.insertSubview(infoView, belowSubview: headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let infoViewTopConstraint = infoView.topAnchor.constraint(equalTo: view.topAnchor)
        infoView.topConstraint = infoViewTopConstraint
        
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        
        let contentGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            
            
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 400),
            infoViewTopConstraint,

            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: infoView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            contentView.leadingAnchor.constraint(equalTo: contentGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: contentGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentGuide.bottomAnchor),
            
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight
        ])
    }
    
    private func infoView(shouldSnap: Bool) {
        guard !infoView.isAnimating else {
            return
        }

        infoView.isAnimating = true

        let neededConstant = shouldSnap ? -(infoView.bounds.height - headerView.bounds.height) : 0
//        let neededAlpha = shouldSnap ? 0.75 : 0
        
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.infoView.topConstraint?.constant = neededConstant
            self?.infoView.alpha = shouldSnap ? 0.3 : 1.0
//            self?.infoView.blurEffectView.alpha = neededAlpha
            self?.view.layoutIfNeeded()
        } completion: { [weak self] _ in
            self?.infoView.isAnimating = false
        }
    }
    
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        if y >= 15 {
            infoView(shouldSnap: true)
        }
        
        if y <= -50 {
            infoView(shouldSnap: false)
        }
    }
}
