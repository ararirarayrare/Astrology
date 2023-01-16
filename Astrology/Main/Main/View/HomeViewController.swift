//
//  ViewController.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class HomeViewController: ViewController {
    
    private let topView: HomeTopView = {
        let view = HomeTopView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerView: HomeHeaderView = {
        let headerView = HomeHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()

    private lazy var contentView: HomeContentView = {
        let contentView = HomeContentView(coordinator: self.coordinator)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
        
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = false
        scrollView.indicatorStyle = .white
        
        return scrollView
    }()
    
    let coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        headerView.animator.topOffset = -(headerView.bounds.height - topView.bounds.height)
    }
    
    override func setup() {
        super.setup()
        
        setBackground(image: .background0)
    
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        panGesture.delegate = self
        scrollView.addGestureRecognizer(panGesture)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(fractionListener))
        displayLink.add(to: .main, forMode: .common)
    }

    override func layout() {
        super.layout()
        
        view.addSubview(topView)
        view.insertSubview(headerView, belowSubview: topView)
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
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            
            
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 300),
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
    
    @objc
    private func fractionListener() {
        let fraction = headerView.animator.fractionComplete
        let shouldHide = headerView.animator.shouldHide
        
        if shouldHide {
            scrollView.isScrollEnabled = false
        } else {
            scrollView.isScrollEnabled = (fraction == 0)
        }
    }
    
    @objc
    private func panned(_ gesture: UIPanGestureRecognizer) {
        guard scrollView.contentOffset.y <= 0 else {
            return
        }
        
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        let offset = (headerView.bounds.height - topView.bounds.height)
        let fraction = abs(translation.y / offset)

        let panningInCorrectDirection = (headerView.animator.shouldHide && translation.y < 0) || (!headerView.animator.shouldHide && translation.y > 0)
        
        let shouldCompleteAnimation = (headerView.animator.shouldHide && translation.y > 0) || (!headerView.animator.shouldHide && translation.y < 0)
                
        if !headerView.animator.hasAnimations, panningInCorrectDirection {
//            self.scrollView.isScrollEnabled = false
            
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            
            headerView.resetAnimations { isHidden in
//                self.scrollView.isScrollEnabled = isHidden
                gesture.isEnabled = true
                self.view.setNeedsDisplay()
            
            }
        }
        
        if shouldCompleteAnimation, headerView.animator.hasAnimations {
            gesture.isEnabled = false
            headerView.animator.completeAnimation()
        }
     
        switch gesture.state {
        case .changed:

            if panningInCorrectDirection {
                headerView.animator.fractionComplete = fraction
            }
            
        case .ended, .cancelled:
                    
            if headerView.animator.hasAnimations {
                gesture.isEnabled = false
                headerView.animator.completeAnimation()
            }

        default:
            break
        }
        
    }
}

extension HomeViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
