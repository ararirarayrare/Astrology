//
//  File.swift
//  Astrology
//
//  Created by mac on 13.01.2023.
//

import UIKit

class EditProfileViewController: ViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(Icon.arrowLeft, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .boldGothamPro(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Edit profile"
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "cancer-sign")
        
        imageView.layer.cornerRadius = 60
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private let editImageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .italicGothamPro(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Tap to edit"
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var nameLabel = createLabel(text: "Name", textAligment: .center)
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.backgroundColor = UIColor(red: 141/255, green: 112/255, blue: 1, alpha: 0.15)
        
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor(red: 211/255, green: 195/255, blue: 243/255, alpha: 1.0).cgColor
        textField.layer.borderWidth = 0.75
        textField.layer.cornerRadius = 12
        
        textField.textAlignment = .center
        textField.tintColor = .lightGray
        textField.textColor = .white
        
        textField.adjustsFontSizeToFitWidth = true
        
        textField.font = .gothamPro(ofSize: 18)
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "Set new name",
            attributes: [
                .foregroundColor : UIColor(red: 199/255, green: 199/255, blue: 199/255, alpha: 1.0)
            ]
        )
        
        return textField
    }()
    
    private lazy var birthdayLabel = createLabel(text: "Birthday", textAligment: .center)
    
    private let birthdayDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        
        datePicker.tintColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        
        return datePicker
    }()
    
    private lazy var genderLabel = createLabel(text: "Gender", textAligment: .center)
    
    private let genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Female", "Male"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.tintColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        segmentedControl.selectedSegmentTintColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        segmentedControl.backgroundColor = UIColor(red: 141/255, green: 112/255, blue: 1, alpha: 0.15)
        
        segmentedControl.setTitleTextAttributes(
            [
                .font : UIFont.mediumGothamPro(ofSize: 16) ?? .boldSystemFont(ofSize: 14),
                .foregroundColor : UIColor.white
            ],
            for: .normal
        )
        
        segmentedControl.setTitleTextAttributes(
            [
                .font : UIFont.boldGothamPro(ofSize: 16) ?? .boldSystemFont(ofSize: 16),
                .foregroundColor : UIColor.white
            ],
            for: .selected
        )
        
        return segmentedControl
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.titleLabel?.font = .boldGothamPro(ofSize: 20)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    let coordinator: ProfileCoordinator
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabBarController = tabBarController as? TabBarController,
           !tabBarController.tabBar.isHidden {
            
            tabBarController.hideTabBar()
        }
    }
    
    override func setup() {
        super.setup()
        
        setBackground(image: .background1)
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        nameTextField.text = "Poroshenko"
        genderSegmentedControl.selectedSegmentIndex = 1
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func layout() {
        super.layout()
        
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(editImageLabel)
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayDatePicker)
        
        
        view.addSubview(genderLabel)
        view.addSubview(genderSegmentedControl)
        
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 12),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor,
                                              multiplier: 0.65),
            
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            
            editImageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                               constant: 8),
            editImageLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            
            nameLabel.topAnchor.constraint(equalTo: editImageLabel.bottomAnchor,
                                           constant: 24),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                              constant: 16),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                 multiplier: 0.5),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            
            birthdayLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,
                                               constant: 24),
            birthdayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            birthdayDatePicker.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor,
                                                   constant: 16),
            birthdayDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            genderLabel.topAnchor.constraint(equalTo: birthdayDatePicker.bottomAnchor,
                                             constant: 24),
            genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            genderSegmentedControl.topAnchor.constraint(equalTo: genderLabel.bottomAnchor,
                                                        constant: 16),
            genderSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderSegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                          multiplier: 0.55),
            genderSegmentedControl.heightAnchor.constraint(equalToConstant: 36),
            
            
            saveButton.topAnchor.constraint(equalTo: genderSegmentedControl.bottomAnchor,
                                            constant: 24),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 160),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    private func backTapped() {
        coordinator.eventOccured(.pop)
    }
    
    private func createLabel(text: String, textAligment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .italicBoldGothamPro(ofSize: 22)
        label.textColor = .white
        label.textAlignment = textAligment
        label.text = text
        
        return label
    }
    
    @objc
    private func hideKeyboard() {
        view.endEditing(true)
    }
}
