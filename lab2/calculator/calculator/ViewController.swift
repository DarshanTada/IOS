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
        buttonZero.layer.cornerRadius = 12
        buttonZero.layer.borderWidth = 1
        buttonZero.layer.borderColor = UIColor.white.cgColor
    
// 1
        buttonOne.layer.cornerRadius = 12
        buttonOne.layer.borderWidth = 1
        buttonOne.layer.borderColor = UIColor.white.cgColor
        
// 2
        buttonTwo.layer.cornerRadius = 12
        buttonTwo.layer.borderWidth = 1
        buttonTwo.layer.borderColor = UIColor.white.cgColor
        
        
// 3
        buttonThree.layer.cornerRadius = 12
        buttonThree.layer.borderWidth = 1
        buttonThree.layer.borderColor = UIColor.white.cgColor
        
        
// 4
        buttonFour.layer.cornerRadius = 12
        buttonFour.layer.borderWidth = 1
        buttonFour.layer.borderColor = UIColor.white.cgColor
        
        
// 5
        buttonFive.layer.cornerRadius = 12
        buttonFive.layer.borderWidth = 1
        buttonFive.layer.borderColor = UIColor.white.cgColor
        
        
// 6
        buttonSix.layer.cornerRadius = 12
        buttonSix.layer.borderWidth = 1
        buttonSix.layer.borderColor = UIColor.white.cgColor
        
// 7
        buttonSeven.layer.cornerRadius = 12
        buttonSeven.layer.borderWidth = 1
        buttonSeven.layer.borderColor = UIColor.white.cgColor
        
        
// 8
        buttonEight.layer.cornerRadius = 12
        buttonEight.layer.borderWidth = 1
        buttonEight.layer.borderColor = UIColor.white.cgColor
        
        
// 9
        buttonNine.layer.cornerRadius = 12
        buttonNine.layer.borderWidth = 1
        buttonNine.layer.borderColor = UIColor.white.cgColor
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
        buttonDot.layer.borderColor = UIColor.white.cgColor

        
        
        
        
    }
    
    
    
// Outlets

//    0
    @IBOutlet weak var buttonZero: UIButton!
    
//    1
    @IBOutlet weak var buttonOne: UIButton!
    
//    AC
    @IBOutlet weak var buttonAC: UIButton!
    
//    2
    @IBOutlet weak var buttonTwo: UIButton!
    
//    3
    @IBOutlet weak var buttonThree: UIButton!
    
//    +/-
    @IBOutlet weak var buttonPlusMinus: UIButton!
    
//    4
    @IBOutlet weak var buttonFour: UIButton!
    
//    6
    @IBOutlet weak var buttonSix: UIButton!
    
//    5
    @IBOutlet weak var buttonFive: UIButton!
    
//    7
    @IBOutlet weak var buttonSeven: UIButton!
    
//    8
    @IBOutlet weak var buttonEight: UIButton!
    
//    9
    @IBOutlet weak var buttonNine: UIButton!
    
//x^2
    @IBOutlet weak var buttonXSquare: UIButton!
    
//    /
    @IBOutlet weak var buttonDivide: UIButton!
    
//    *
    @IBOutlet weak var buttonMultiply: UIButton!
    
//    -
    @IBOutlet weak var buttonMinus: UIButton!
    
//    +
    @IBOutlet weak var buttonPlus: UIButton!
    
//    .
    @IBOutlet weak var buttonDot: UIButton!
    
//    =
    @IBOutlet weak var buttonEqual: UIButton!
    
//    result
    @IBOutlet weak var result: UILabel!
    
  
    
    
    
    
    
// ACTIONS
  
    
    

//    txtFiled 1
    
    @IBAction func textField1Func(_ sender: UITextField) {
        
    }

    
//    txtField 2
    
    @IBAction func textField2Func(_ sender: UITextField) {
        
    }
    
    
// x^2
    
    @IBAction func buttonXSquareFunc(_ sender: UIButton) {
        print("x^2")
    }
    
    
//    +/-
    
    @IBAction func buttonPlusMinusFunc(_ sender: UIButton) {
        print("+/-")
    }
    
    
//    /
    
    @IBAction func buttonDivideFunc(_ sender: UIButton) {
        print("/")
    }
    
    
//    7
    
    @IBAction func buttonSevenFunc(_ sender: UIButton) {
        print("7")
    }
    
    
//    8
    @IBAction func buttonEightFunc(_ sender: UIButton) {
        print("8")
    }
    
    
//    9
    @IBAction func buttonNineFunc(_ sender: UIButton) {
        print("9")
    }
    
    
//    *
    
    @IBAction func buttonMultiplyFunc(_ sender: UIButton) {
        print("*")
    }
    
    
//    4
    
    @IBAction func buttonFourFunc(_ sender: UIButton) {
        print("4")
    }
    
    
//    5
    @IBAction func buttonFiveFunc(_ sender: UIButton) {
        print("5")
    }
    
    
//    6
    
    @IBAction func buttonSixFunc(_ sender: UIButton) {
        print("6")
    }
    
    
//    -
    
    @IBAction func buttonMinusFunc(_ sender: UIButton) {
        print("-")
    }
    
    
//    1
    
    @IBAction func buttonOneFunc(_ sender: UIButton) {
        print("1")
    }
    
    
//    2
    
    @IBAction func buttonTwoFunc(_ sender: UIButton) {
        print("2")
    }
    
    
//    3
    
    @IBAction func buttonThreeFunc(_ sender: UIButton) {
        print("3")
    }
    
    
//    +
    
    @IBAction func buttonPlusFunc(_ sender: UIButton) {
        print("+")
    }
    
    
//    0
    
    @IBAction func buttonZeroFunc(_ sender: UIButton) {
        print("0")
    }
    

//    .
    
    @IBAction func buttonDotFunc(_ sender: UIButton) {
        print(".")
    }
    
    
//    AC
    
    @IBAction func buttonACFunc(_ sender: UIButton) {
        print("AC")
    }
    
    
//    =
    
    @IBAction func buttonEqualFunc(_ sender: UIButton) {
        print("=")
    }
    
}

