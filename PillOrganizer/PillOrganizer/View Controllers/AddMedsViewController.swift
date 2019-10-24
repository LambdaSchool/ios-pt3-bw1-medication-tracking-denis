//
//  AddMedsViewController.swift
//  PillOrganizer
//
//  Created by denis cedeno on 10/17/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

protocol AddMedDelegate {
    func medWasAdded(_ med: Medication)
}

class AddMedsViewController: UIViewController {

    var delegate: AddMedDelegate?
    var dailyMedListTVC: DailyMedsListTableViewController?
    var selectedDay: String?
    
    @IBOutlet weak var pickADaytextField: UITextField!
    @IBOutlet weak var addMedsNameTextField: UITextField!
    @IBOutlet weak var addNotesTextField: UITextField!
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let name = addMedsNameTextField.text,
        let notes = addNotesTextField.text,
        let day = pickADaytextField.text else {return}
        
        let med = Medication(name: name, notes: notes, day: day, takeDaily: true)
        delegate?.medWasAdded(med)
        dailyMedListTVC?.updateViews()
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createDayPicker()
        createToolBar()
        self.setupToHideKeyBoardOnTapOnView()
    }
    
    let days = ["-------", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    func createDayPicker() {
        let dayPicker = UIPickerView()
        dayPicker.delegate = self
        pickADaytextField.inputView = dayPicker
    }
    
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddMedsViewController.dismissKeyBoard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        pickADaytextField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    
}

extension UIViewController{
    func setupToHideKeyBoardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension AddMedsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = days[row]
        pickADaytextField.text = selectedDay
    }
    
}


