//
//  ViewController.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainViewController: ViewController {
    
    private lazy var barView: MainBarView = {
        let barView = MainBarView(coordinator: self.coordinator)
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    private let headerView: MainHeaderView = {
        let headerView = MainHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        headerView.animator.topOffset = -(headerView.bounds.height - barView.bounds.height)
    }
    
    @objc
    private func panned(_ gesture: UIPanGestureRecognizer) {
        guard scrollView.contentOffset.y <= 0, !headerView.animator.isCompletingAnimation else {
            return
        }
        
        
        let translation = gesture.translation(in: view)
//        let velocity = gesture.velocity(in: view)
        let offset = (headerView.bounds.height - barView.bounds.height)
        let initialConstant = headerView.animator.shouldHide ? 0 : -offset
        let fraction = abs(translation.y / offset)

        let panningInCorrectDirection = (headerView.animator.shouldHide && translation.y < 0) || (!headerView.animator.shouldHide && translation.y > 0)
        
        guard panningInCorrectDirection else {
            return
        }

                
        if !headerView.animator.hasAnimations, panningInCorrectDirection {
            self.scrollView.isScrollEnabled = false
            
            headerView.resetAnimations { isHidden in
                self.scrollView.isScrollEnabled = isHidden
            }
        }
        
//        if velocity.y > 1000 {
//            headerView.animator.completeAnimation()
//        }
    
                        
        switch gesture.state {
        case .changed:
            print("changed")
            
            let neededConstant = (initialConstant + translation.y)

//            guard (-offset...0).contains(neededConstant) else {
//                return
//            }
            
            if (-offset...0).contains(neededConstant) {
                headerView.animator.fractionComplete = fraction
            }
            
//            headerView.animator.fractionComplete = fraction
            
    
            
        case .ended, .cancelled:
                        
            if abs(translation.y) > 30 {
                headerView.animator.completeAnimation()
            } else {
                headerView.animator.finishedAtStart = true
                headerView.animator.fractionComplete = 0
                headerView.animator.stopAnimation(false)
                headerView.animator.finishAnimation(at: .start)
            }
            
        default:
            break
        }
        
    }
    
    
    private func setup() {
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "main-bg")
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        panGesture.delegate = self
        scrollView.addGestureRecognizer(panGesture)
    }

    private func layout() {
        view.addSubview(barView)
        view.insertSubview(headerView, belowSubview: barView)
        view.insertSubview(scrollView, belowSubview: headerView)
        scrollView.addSubview(contentView)
        
        let infoViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.topAnchor)
        headerView.topConstraint = infoViewTopConstraint
        
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        
        let contentGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            barView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            barView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            barView.topAnchor.constraint(equalTo: view.topAnchor),
            
            
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 400),
            infoViewTopConstraint,

            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
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
