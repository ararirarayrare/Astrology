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
        scrollView.isScrollEnabled = false
        return scrollView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        setup()
        layout()
    }
    
    @objc
    private func panned(_ gesture: UIPanGestureRecognizer) {
        guard scrollView.contentOffset.y <= 0, !infoView.isAnimating else {
            return
        }
        
        let translation = gesture.translation(in: view)
                
        let offset = (infoView.bounds.height - headerView.bounds.height)
        
        let initialConstant = infoView.isOpen ? 0 : -offset
        
        let panningInCorrectDirection = (infoView.isOpen && translation.y < 0) || (!infoView.isOpen && translation.y > 0)
        
        if panningInCorrectDirection, !infoView.isPrehidden {
                
            infoView.prehide()
            
            if scrollView.isScrollEnabled { scrollView.isScrollEnabled = false }
        }
        
        print(translation.y)
                
        switch gesture.state {
        case .changed:
            
            let neededConstant = (initialConstant + translation.y)
            
            guard (-offset...0).contains(neededConstant) else {
                return
            }

            infoView.topConstraint?.constant = neededConstant
            view.layoutIfNeeded()
            
        case .ended, .cancelled:
            
            let shouldHide = infoView.isOpen ? (-translation.y >= 60) : (translation.y < 60)
            let constant = shouldHide ? -offset : 0
            
            infoView.animate(transparent: shouldHide,
                             topConstraintConstant: constant) { [weak self] in
                
                self?.scrollView.isScrollEnabled = shouldHide
                print(self!.scrollView.isScrollEnabled)
            }
            
            

        default:
            ()
        }
        
        
    }
    
    private func setup() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 23/255, alpha: 1.0)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        panGesture.delegate = self
        contentView.addGestureRecognizer(panGesture)
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

extension MainViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
