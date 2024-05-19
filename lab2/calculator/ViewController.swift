//
//  ViewController.swift
//  calculator
//
//  Created by user226510 on 5/16/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
// 0
        button0.layer.cornerRadius = 12
        button0.layer.borderWidth = 1
        button0.layer.borderColor = UIColor.white.cgColor
    
// 1
        button1.layer.cornerRadius = 12
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.white.cgColor
        
// 2
        button2.layer.cornerRadius = 12
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.white.cgColor
        
        
// 3
        button3.layer.cornerRadius = 12
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.white.cgColor
        
        
// 4
        button4.layer.cornerRadius = 12
        button4.layer.borderWidth = 1
        button4.layer.borderColor = UIColor.white.cgColor
        
        
// 5
        button5.layer.cornerRadius = 12
        button5.layer.borderWidth = 1
        button5.layer.borderColor = UIColor.white.cgColor
        
        
// 6
        button6.layer.cornerRadius = 12
        button6.layer.borderWidth = 1
        button6.layer.borderColor = UIColor.white.cgColor
        
// 7
        button7.layer.cornerRadius = 12
        button7.layer.borderWidth = 1
        button7.layer.borderColor = UIColor.white.cgColor
        
        
// 8
        button8.layer.cornerRadius = 12
        button8.layer.borderWidth = 1
        button8.layer.borderColor = UIColor.white.cgColor
        
        
// 9
        button9.layer.cornerRadius = 12
        button9.layer.borderWidth = 1
        button9.layer.borderColor = UIColor.white.cgColor
        buttonAC.layer.cornerRadius = 12
        buttonAC.layer.borderWidth = 1
        
        
// +/-
        
        buttonPlusMinus.layer.cornerRadius = 12
        buttonPlusMinus.layer.borderWidth = 1
        buttonPlusMinus.layer.borderColor = UIColor.orange.cgColor
      
        
// x^2
        buttonXSquare.layer.cornerRadius = 12
        buttonXSquare.layer.borderWidth = 1
        buttonXSquare.layer.borderColor = UIColor.orange.cgColor
    
        
// /
        buttonDivide.layer.cornerRadius = 12
        buttonDivide.layer.borderWidth = 1
        buttonDivide.layer.borderColor = UIColor.orange.cgColor

        
// X
        buttonMultiply.layer.cornerRadius = 12
        buttonMultiply.layer.borderWidth = 1
        buttonMultiply.layer.borderColor = UIColor.orange.cgColor
        
        
// -
        buttonMinus.layer.cornerRadius = 12
        buttonMinus.layer.borderWidth = 1
        buttonMinus.layer.borderColor = UIColor.orange.cgColor
        
        
// +
        buttonPlus.layer.cornerRadius = 12
        buttonPlus.layer.borderWidth = 1
        buttonPlus.layer.borderColor = UIColor.orange.cgColor

        
// .
        buttonDot.layer.cornerRadius = 12
        buttonDot.layer.borderWidth = 1
        buttonDot.layer.borderColor = UIColor.orange.cgColor

        
        
        
        
    }
    
    
    
// Outlets

    
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var buttonAC: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var buttonPlusMinus: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var buttonXSquare: UIButton!
    
    @IBOutlet weak var buttonDivide: UIButton!
    
    @IBOutlet weak var buttonMultiply: UIButton!
    
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var buttonDot: UIButton!
    
    
    
// Actions
    
    @IBAction func textField1Func(_ sender: UITextField) {
    }
    
    
    @IBAction func textField2Func(_ sender: UITextField) {
    }
    
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func buttonXSquareFunc(_ sender: UIButton) {
    }
    @IBAction func buttonPlusMinusFunc(_ sender: UIButton) {
    }
    @IBAction func buttonDivideFunc(_ sender: UIButton) {
    }
    @IBAction func button7Func(_ sender: UIButton) {
    }
    @IBAction func button8Func(_ sender: UIButton) {
    }
    @IBAction func button9Func(_ sender: UIButton) {
    }
    @IBAction func buttonMultiplyFunc(_ sender: UIButton) {
    }
    @IBAction func button4Func(_ sender: UIButton) {
    }
    @IBAction func button5Func(_ sender: UIButton) {
    }
    @IBAction func button6Func(_ sender: UIButton) {
    }
    @IBAction func buttonMinusFunc(_ sender: UIButton) {
    }
    @IBAction func button1Func(_ sender: UIButton) {
    }
    @IBAction func button2Func(_ sender: UIButton) {
    }
    @IBAction func button3Func(_ sender: UIButton) {
    }
    @IBAction func buttonPlusFunc(_ sender: UIButton) {
    }
    
    
    @IBAction func buttonZeroFunc(_ sender: UIButton) {
    }
    
    
    @IBAction func buttonDotFunc(_ sender: UIButton) {
    }
    @IBAction func buttonACFunc(_ sender: UIButton) {
    }
    
    
    
    
    
    
    
}

