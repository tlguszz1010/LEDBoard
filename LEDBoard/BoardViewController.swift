//
//  BoardViewController.swift
//  LEDBoard
//
//  Created by 박시현 on 2022/07/06.
//

import UIKit

class BoardViewController: UIViewController{

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var textColorButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet var buttonList: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
//        resultLabel.numberOfLines = 0 // 무한대 줄로 사용가능
        
        // 함수의 호출 순서대로 진행
        designTextField()
        designButton(sendButton, buttonTitle: "전송", HightlightedTitle: "눌러눌러", bgColor: .yellow)
        designButton(textColorButton, buttonTitle: "색상변경", HightlightedTitle: "바꿔", bgColor: .blue)
//        userTextField.delegate = self
        
    }
    
    func designTextField() {
        userTextField.placeholder = "내용을 작성해주세요"
        userTextField.text = "안녕하세요"
        userTextField.keyboardType = .emailAddress
    }
    
    // buttonOutletVariableName: 외부 매개변수, Argument Label - 실질적으로 호출할 값에 대한 이름 -> 생략가능
    // buttonName: 파라미터 이름
    // _ : 와일드 카드 식별자
    func designButton(_ buttonName: UIButton, buttonTitle: String, HightlightedTitle: String, bgColor: UIColor) {
        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setTitle(HightlightedTitle, for: .highlighted)
        buttonName.backgroundColor = .yellow
        buttonName.layer.cornerRadius = 8
        buttonName.layer.borderColor = UIColor.black.cgColor
        buttonName.layer.borderWidth = 3
        buttonName.setTitleColor(UIColor.red, for: UIControl.State.normal)
        buttonName.setTitleColor(UIColor.blue, for: UIControl.State.highlighted)
    }
// delegate 패턴 사용해서 키보드 return키 눌렀을 때 종료
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        userTextField.resignFirstResponder()
//        return true
//    }
    func studyOutletCollection() {
        // 1. 반복문
        let buttonArray: [UIButton] = [sendButton, textColorButton]
        
        for item in buttonArray {
            item.backgroundColor = .blue
            item.layer.cornerRadius = 2
        }
        
        // 2. 아웃렛 컬렉션
        for item in buttonList {
            item.backgroundColor = .blue
            item.layer.cornerRadius = 2
           
        }
    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        print(userTextField.text)
        resultLabel.text = userTextField.text
    }
    
    var flag = 0
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        if flag == 0 {
            View1.isHidden = true
            flag = 1
        }
        else {
            View1.isHidden = false
            flag = 0
        }
    }
    @IBAction func DidEndOnExit(_ sender: Any) {
        view.endEditing(true)
//        userTextField.becomeFirstResponder()
    }
    
    @IBAction func exampleButton1(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    // 연결관계를 다 끊어보고 Any로 - 타입에 상관없이 같은 기능을 구현하고 싶다.
}
