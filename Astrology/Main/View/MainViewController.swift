//
//  ViewController.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainViewController: ViewController {
    
    private lazy var headerView: MainHeaderView = {
        let headerView = MainHeaderView(coordinator: self.coordinator)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let infoView: MainInfoView = {
        let infoView = MainInfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()

    private lazy var contentView: MainContentView = {
        let contentView = MainContentView(coordinator: self.coordinator)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
//        scrollView.bounces = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 23/255, alpha: 1.0)
                
        layout()
    }

    private func layout() {
        view.addSubview(headerView)
        view.insertSubview(infoView, belowSubview: headerView)
        view.insertSubview(scrollView, belowSubview: infoView)
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
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        if y >= 15 {
            let constant = -(infoView.bounds.height - headerView.bounds.height)
            infoView.animate(transparent: true, topConstraintConstant: constant)
//            headerView.shadow(hide: false)
        }
        
        if y <= -50 {
            infoView.animate(transparent: false)
//            headerView.shadow(hide: true)
        }
        
    }
}
