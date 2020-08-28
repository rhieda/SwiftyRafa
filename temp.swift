//
//  ViewController.swift
//  OTPTextField
//
//  Created by Rafael  Hieda on 8/27/20.
//  Copyright © 2020 Rafael Hieda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var oneTimeCodeTextField: OneTimeCodeTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        oneTimeCodeTextField.configure()
        oneTimeCodeTextField.didEnterLastDigit = { [weak self] code in
            print(code)
            guard let self = self else { return }
            //actually do something here
        }
    }
}

class OneTimeCodeTextField: UITextField {
    
    private var isConfigured: Bool = false
    
    var digitLabels: [UILabel] = []
    
    var defaultCharacter = "-"
        
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    public var didEnterLastDigit: ((String) -> Void)?
    
    func configure(with slotCount: Int = 6) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        
        configureTextField()
        
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        
        addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        isSecureTextEntry = true
        setAccessibility()

    }
    
    private func setAccessibility() {
        isAccessibilityElement = true
        accessibilityLabel = "OTP keyboard"
        accessibilityHint = "keyboard for password sent from server"
        accessibilityTraits = .keyboardKey
    }
    
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
    }
    
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 1 ... count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40)
//            label.backgroundColor = .blue
            label.isUserInteractionEnabled = true
            label.text = defaultCharacter
            
            stackView.addArrangedSubview(label)
            
            digitLabels.append(label)
        }
        
        return stackView
    }
    
    @objc
    private func textDidChange() {
        guard let text = self.text, text.count <= digitLabels.count else { return }
        UIDevice.current.playInputClick()
        for i in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            } else {
//                currentLabel.text?.removeAll()
                currentLabel.text = defaultCharacter
            }
        }
        
        if text.count == digitLabels.count {
            didEnterLastDigit?(text)
        }
    }
}

extension OneTimeCodeTextField: UITextFieldDelegate  {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        
        return characterCount < digitLabels.count || string == ""
        
    }
}
//
//  ViewController.swift
//  OTPTextField
//
//  Created by Rafael  Hieda on 8/27/20.
//  Copyright © 2020 Rafael Hieda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var oneTimeCodeTextField: OneTimeCodeTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        oneTimeCodeTextField.configure()
        oneTimeCodeTextField.didEnterLastDigit = { [weak self] code in
            print(code)
            guard let self = self else { return }
            //actually do something here
        }
    }
}

class OneTimeCodeTextField: UITextField {
    
    private var isConfigured: Bool = false
    
    var digitLabels: [UILabel] = []
    
    var defaultCharacter = "-"
        
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    public var didEnterLastDigit: ((String) -> Void)?
    
    func configure(with slotCount: Int = 6) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        
        configureTextField()
        
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        
        addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        isSecureTextEntry = true
        setAccessibility()

    }
    
    private func setAccessibility() {
        isAccessibilityElement = true
        accessibilityLabel = "OTP keyboard"
        accessibilityHint = "keyboard for password sent from server"
        accessibilityTraits = .keyboardKey
    }
    
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
    }
    
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 1 ... count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40)
//            label.backgroundColor = .blue
            label.isUserInteractionEnabled = true
            label.text = defaultCharacter
            
            stackView.addArrangedSubview(label)
            
            digitLabels.append(label)
        }
        
        return stackView
    }
    
    @objc
    private func textDidChange() {
        guard let text = self.text, text.count <= digitLabels.count else { return }
        UIDevice.current.playInputClick()
        for i in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            } else {
//                currentLabel.text?.removeAll()
                currentLabel.text = defaultCharacter
            }
        }
        
        if text.count == digitLabels.count {
            didEnterLastDigit?(text)
        }
    }
}

extension OneTimeCodeTextField: UITextFieldDelegate  {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        
        return characterCount < digitLabels.count || string == ""
        
    }
}
