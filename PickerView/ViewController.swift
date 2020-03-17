//
//  ViewController.swift
//  PickerView
//
//  Created by JOEL CRAWFORD on 3/17/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    

    @IBOutlet weak var categoriesTextField: UITextField!
    
    @IBOutlet weak var datePickerTextField: UITextField!
    
    let categoriesPicker: UIPickerView = UIPickerView() //instantiating
    
    
    let datePicker: UIDatePicker = UIDatePicker()
    
    let categoryArray: Array<String> = ["Hobbies", "What", "Hey", "Test", "pickone", "picktwo", "pick5", "sports", "Cars", "Programing"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //=== sets it input to picker =======
        
        categoriesTextField.inputView = categoriesPicker
        
        //set the picker delegates
        categoriesPicker.dataSource  = self
        categoriesPicker.delegate = self
        
        createDatePickerView()
        
        
    }
    
    //=====func to create datepicker
    
    
    func createDatePickerView() {
        //aligning text
        categoriesTextField.textAlignment = .center
        
        
        //creating toolbar for done button
        let toolBar = UIToolbar()
        toolBar.sizeToFit() //fit full screen
        
        
        //====bar button
        
    let doneBtN = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        //adding done button to the tool bar
        
        toolBar.setItems([doneBtN], animated: true)
        
        
        //Assign the toolbar to the keyboard
        datePickerTextField.inputAccessoryView = toolBar
        
        //assign the date picker to the text field
        datePickerTextField.inputView = datePicker
        
        //making the date picker to just show date(mode)
        
        datePicker.datePickerMode = .date
        
        
        
        
    }
    
  @objc  func donePressed() {
    
    // we need to format  the text when done is pressed(formatter)
    
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    
    formatter.timeStyle = .none
    
    
    //assign the selected date to the input field and close the date view
    
    datePickerTextField.text = formatter.string(from: datePicker.date)
    
    //datePickerTextField.text = "\(datePicker.date)" //assigning
    self.view.endEditing(true) // closing the date picker view
        
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
        
        //for one slide
       }
    
    
    
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return  categoryArray.count
        
       }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  categoryArray[row]
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //categoriesTextField.text =  "You selected  \(categoryArray[row])"
        
        
        categoriesTextField.text =   categoryArray[row]
        //pick the string at that index, for varuous component check the index, for eg say 2 use 0 and 1
    }
    
    
    

}

