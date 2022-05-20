//
//  ViewController.swift
//  TextFiieldProject
//
//  Created by 김영욱 on 2022/05/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        //화면의 탭을 감지하는 메서드
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        setup()
        
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType =  UIKeyboardType.emailAddress
        textField.placeholder = "이메일을 입력해주세요"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        
        textField.becomeFirstResponder()
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 글자수 제한
//        let maxLength = 10
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
//        return newString.length <= maxLength
        
        // 입력되고 있는 글자가 "숫자"안 경우 입력을 허용하지 않는 논리
        if Int(string) != nil { return false } // 숫자로 변환이 된다면 nil이 아니다
        else {
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
        
        // 10글자 이상 입력뙤는 것을 막는 코드 (또 다른 구현)
//        if (textField.text?.count)! + string.count > 10 { return false }
//        else { return true }

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
        
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        textField.resignFirstResponder()
        
    }
    

}

