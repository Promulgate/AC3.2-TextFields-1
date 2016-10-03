//
//  LoginViewController.swift
//  CatRoll-SignUp
//
//  Created by Louis Tur on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        
    }
    
    // MARK: - Validations
    func textFieldsAreValid() -> Bool {
        
        // 1. some set up
        let textFields: [UITextField] = [self.nameTextField, self.passwordTextField]
        let minimumLengthRequireMents: [UITextField : Int] = [
            self.nameTextField : 1,
            self.passwordTextField : 6
        ]
        
        for field in textFields {
            if let count = field.text?.characters.count , let currentMinimum = minimumLengthRequireMents[field] {
                if count < currentMinimum  {
                    errorLabel.text = "Usernames require at least 1 character \n Passwords require at least 6 characters"
                    errorLabel.isHidden = false
                    return false
                }
                else {
                    errorLabel.isHidden = true
                }
            }
        }
        // 2. iterrate over the text fields
        // 3. if the textfield doesn't have the minimum required characters...
        // 4. make sure that the label isn't hidden
        // 5. display an error to rhe user
        // 6. indicate that the fields are not valid
        // 7. hide the error label if all gets validated
        
        // 8. indicate that the fields are valid
        return true
    }
    
    func textField(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
        if let count = textField.text?.characters.count {
            if count >= minimum {
                return true
            }
        }
        return false
    }
    
    func string(_ string: String, containsOnly characterSet: CharacterSet) -> Bool {
        for chr in string.characters {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
                return false
            }
        }
        return true
    }
    
    
    // MARK: - UI Helper
    // (add the label update function here when the lesson calls for it)
    
    
    // MARK: - UITextFieldDelegate
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Beginning Edit!")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did begin edit")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Should end edit")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Did end edit")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\n ~ \(textField.debugId) SHOULD RETURN")
        
//        if textField == self.nameTextField {
//            let textIsLongEnough: Bool = self.textField(textField, hasMinimumCharacters: 1)
//            if !textIsLongEnough {
//                errorLabel.text = "Username must be atleast 1 character long"
//                errorLabel.isHidden = false
//            }
//            else {
//                errorLabel.isHidden = true
//            }
//            
//            return textIsLongEnough
//        }
//        
//        if textField == self.passwordTextField {
//            let textIsLongEnough: Bool = self.textField(textField, hasMinimumCharacters: 6)
//            if !textIsLongEnough {
//                errorLabel.text = "Password must be atleast 6 characters long"
//                errorLabel.isHidden = false
//                
//            }
//            else {
//                errorLabel.isHidden = true
//            }
//            return textIsLongEnough
//        }
        _ = self.textFieldsAreValid()
        
        return true
    }
}
