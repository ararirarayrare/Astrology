//
//  MainInfoView.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainHeaderView: UIView {

    var topConstraint: NSLayoutConstraint?
    
    private var signBottomConstraint: NSLayoutConstraint?
    
    private let signImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cancer-sign")
        imageView.contentMode = .scaleAspectFit
                
        return imageView
    }()
    
    private let signLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .boldGothamPro(ofSize: 14)
        label.textAlignment = .center
        label.textColor = UIColor(red: 189/255, green: 158/255, blue: 1, alpha: 1.0)
        
        label.layer.shadowRadius = 2
        label.layer.shadowColor = label.textColor.cgColor
        label.layer.shadowOpacity = 0.9
        label.layer.shadowOffset.height = 1
        
        label.text = "Cancer"
        
        return label
    }()
    
    private let editLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .boldGothamPro(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        
        let attributedString = NSMutableAttributedString(string: "Edit  ")
        
        let attachment = NSTextAttachment()
        attachment.image = Icon.pencil
        attachment.bounds.size = CGSize(width: 11, height: 11)
        
        attributedString.append(NSAttributedString(attachment: attachment))
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private let leftDetailsView: MainHeaderViewDetails = {
        let details = [
            "Gender" : "Male",
            "Birth stone" : "Ruby",
            "Color" : "White"
        ]
        
        let view = MainHeaderViewDetails(details: details, textAligment: .left)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let rightDetailsView: MainHeaderViewDetails = {
        let details = [
            "Animal" : "Cow",
            "Age" : "20",
            "Name" : "Artem"
        ]
        
        let view = MainHeaderViewDetails(details: details, textAligment: .right)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let animator = MainHeaderViewAnimator(duration: 0.4, dampingRatio: 1.0)
    
    init() {
        super.init(frame: .zero)
                
        setup()
        layout()
    }
    
    
    func resetAnimations(withCompletion completion: @escaping (Bool) -> Void) {

        self.setNeedsLayout()
        self.superview?.setNeedsLayout()
        
        animator.addAnimations { [weak self] animator in
            guard let self = self else {
                return
            }

            self.signImageView.transform = animator.signTransform
            
            self.signBottomConstraint?.constant = animator.bottomConsant
            self.topConstraint?.constant = animator.topConstant
        
            self.signLabel.alpha = animator.shouldHide ? 0 : 1
            self.editLabel.alpha = animator.shouldHide ? -3 : 1
                        
            let x = animator.shouldHide ? 260.0 : 0
            let y = animator.shouldHide ? -12.0 : 0
            
            let leftTransform = animator.detailsTransform.translatedBy(x: x, y: y)
            
            let rightTransform = animator.detailsTransform.translatedBy(x: -x, y: y)
            
            self.leftDetailsView.transform = leftTransform
            self.rightDetailsView.transform = rightTransform
            
            self.leftDetailsView.alpha = animator.alpha
            self.rightDetailsView.alpha = animator.alpha
                                    
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
        }
         
        animator.addCompletion(completion)
    }
    
    private func setup() {
        
    }
    
    private func layout() {
        addSubview(leftDetailsView)
        addSubview(rightDetailsView)
        addSubview(signImageView)
        
        signImageView.addSubview(signLabel)
        signImageView.addSubview(editLabel)
        
        let signBottomConstraint = signImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                         constant: -48)
        self.signBottomConstraint = signBottomConstraint

        
        NSLayoutConstraint.activate([
            signImageView.widthAnchor.constraint(equalTo: widthAnchor,
                                                 multiplier: 0.25),
            signImageView.heightAnchor.constraint(equalTo: signImageView.widthAnchor),
            signImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signBottomConstraint,
            
            
            signLabel.bottomAnchor.constraint(equalTo: signImageView.topAnchor),
            signLabel.centerXAnchor.constraint(equalTo: signImageView.centerXAnchor),
            
            
            editLabel.topAnchor.constraint(equalTo: signImageView.bottomAnchor),
            editLabel.centerXAnchor.constraint(equalTo: signImageView.centerXAnchor),
            

            leftDetailsView.trailingAnchor.constraint(equalTo: signImageView.leadingAnchor,
                                                      constant: -8),
            leftDetailsView.widthAnchor.constraint(equalTo: widthAnchor,
                                                   multiplier: 0.25),
            leftDetailsView.centerYAnchor.constraint(equalTo: signImageView.centerYAnchor),
            

            rightDetailsView.leadingAnchor.constraint(equalTo: signImageView.trailingAnchor,
                                                      constant: 8),
            rightDetailsView.widthAnchor.constraint(equalTo: widthAnchor,
                                                   multiplier: 0.25),
            rightDetailsView.centerYAnchor.constraint(equalTo: signImageView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
