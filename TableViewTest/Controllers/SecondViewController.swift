//
//  SecondViewController.swift
//  TableViewTest
//
//  Created by Emily Thomas on 9/22/18.
//  Copyright © 2018 TS Myers. All rights reserved.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestore

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    func setUpNavigation() {
        navigationItem.title = "New Route"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
    func setupButton() {
        let button = UIButton(type: UIButton.ButtonType.system) as UIButton
        
//        let xPostion:CGFloat = 0
//        let yPostion:CGFloat = 400
//        let buttonWidth:CGFloat = 150
//        let buttonHeight:CGFloat = 45
        button.layer.cornerRadius = 35

//        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Create New Route", for: UIControl.State.normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(self.buttonAction(_:)), for: .touchUpInside)
        button.center = self.view.center
        

        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupTextField() {

        routeNameField.placeholder = "Enter Route Name"
        routeNameField.font = UIFont.systemFont(ofSize: 25)
        routeNameField.borderStyle = UITextField.BorderStyle.roundedRect
        routeNameField.autocorrectionType = UITextAutocorrectionType.yes
        routeNameField.keyboardType = UIKeyboardType.default
        routeNameField.returnKeyType = UIReturnKeyType.done
        routeNameField.clearButtonMode = UITextField.ViewMode.whileEditing;
        routeNameField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        routeNameField.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        routeNameField.delegate = self
        
        self.view.addSubview(routeNameField)
        
        routeNameField.translatesAutoresizingMaskIntoConstraints = false
        routeNameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        routeNameField.heightAnchor.constraint(equalToConstant: 70).isActive = true
        routeNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        routeNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true

        
    }
    
    
    func setupRatingPicker() {
        rotationAngle = -90 * (.pi/180)
        ratingPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        ratingPicker.frame = CGRect(x: -100, y: 160, width: view.frame.width + 200, height: 100)
        ratingPicker.backgroundColor = UIColor.white
        self.view.addSubview(ratingPicker)
        let height : NSLayoutDimension = view.heightAnchor
        let width : NSLayoutDimension = view.widthAnchor
        let spacing = CGFloat(view.frame.height) / 6
        ratingPicker.translatesAutoresizingMaskIntoConstraints = false
        ratingPicker.centerYAnchor.constraint(equalTo: routeNameField.centerYAnchor, constant: spacing).isActive = true
        ratingPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingPicker.heightAnchor.constraint(equalTo: width, multiplier: 1.25).isActive = true
        ratingPicker.widthAnchor.constraint(equalTo: height, multiplier: 0.25).isActive = true
        
        ratingPicker.delegate = self
    }

    func setupColorPicker() {
        rotationAngle = -90 * (.pi/180)
        colorPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        colorPicker.frame = CGRect(x: -100, y: 220, width: view.frame.width + 200, height: 100)
        colorPicker.backgroundColor = UIColor.white
        self.view.addSubview(colorPicker)
        
        let height : NSLayoutDimension = view.heightAnchor
        let width : NSLayoutDimension = view.widthAnchor
        let spacing = CGFloat(view.frame.height) / 6
        colorPicker.translatesAutoresizingMaskIntoConstraints = false
        colorPicker.centerYAnchor.constraint(equalTo: ratingPicker.centerYAnchor, constant: spacing).isActive = true
        colorPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorPicker.heightAnchor.constraint(equalTo: width, multiplier: 1.25).isActive = true
        colorPicker.widthAnchor.constraint(equalTo: height, multiplier: 0.25).isActive = true
        
        colorPicker.delegate = self
    }
    

//    func createToolBar() {
//        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
//
//        //Customizations
//        toolBar.barTintColor = .black
//        toolBar.tintColor = .white
//
//
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SecondViewController.dismissKeyboard))
//
//        toolBar.setItems([doneButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
//
//        ratingSelectField.inputAccessoryView = toolBar
//    }

    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func goBackToFirst() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    

    let routeNameField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
    let ratingSelectField = UITextField(frame: CGRect(x: 20, y: 160, width: 300, height: 40))
    let ratingPicker = UIPickerView()
    let colorPicker = UIPickerView()

    var rotationAngle: CGFloat!
   
    let colors = [nil,
                   "blue",
                   "green",
                   "purple",
                   "red"
                   ]
    
    let ratings = [nil,
                   "5.8",
                   "5.9",
                   "5.10a",
                   "5.10b",
                   "5.10c",
                   "5.10d",
                   "5.11a",
                   "5.11b",
                   "5.11c",
                   "5.11d",
                   "5.12a",
                   "5.12b",
                   "5.12c",
                   "5.12d",
                   "5.13a",
                   "5.13b",
                   "5.13c",
                   "5.13d",
                   ]

    let numericalRatings = [nil,
                   1,
                   2,
                   3,
                   4,
                   5,
                   6,
                   7,
                   8,
                   9,
                   10,
                   11,
                   12,
                   13,
                   14,
                   15,
                   16,
                   17,
                   18,
                   ]
    

    let db = Firestore.firestore()
//    let settings = db.settings
//    settings.areTimestampsInSnapshotsEnabled = true
//    db.settings = settings

    var selectedRating: String?
    var selectedColor: String?
    var sortableRating: Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigation()

        setupTextField()
        setupRatingPicker()
        setupColorPicker()
        setupButton()
//        createToolBar()
        view.backgroundColor = UIColor.testBlue

    }
    
    
    
    @objc func buttonAction(_ sender:UIButton)
    {
        print("Button tapped")
        if routeNameField.text?.isEmpty ?? true {
            print("Please name the Route")
        } else if selectedRating?.isEmpty ?? true {
            print("Please select a rating")
        } else if selectedColor?.isEmpty ?? true {
            print("Please select a color")
        } else {
            print("Ready to go")
            
            RouteAPI.addNewRouteData(newSort: sortableRating! ,newName: routeNameField.text, newRouteRating: selectedRating, newRouteColor: selectedColor)

//            let dict : [String : Any]  = [
//                "sortRating" : sortableRating as Any,
//                "name" : routeNameField.text as Any,
//                "routeRating" : selectedRating as Any,
//                "routeColor" : selectedColor as Any]
//
//            db.collection("routes").document().setData(dict as [String : Any]){ err in
//                if err != nil {
//                    print("issue here")
//                }else{
//                    print("Document sent")
//                }
//            }
            
            guard let routeName = routeNameField.text else {return}
            guard let routeColor = selectedColor else {return}
            guard let routeRating = selectedRating else {return}

            let route = firestoreRoute(routeName: routeName, routeColor: routeColor, routeRating: routeRating)

            let routeRef = self.db.collection("routes")

            routeRef.document().setData(route.dictionary){ err in
                if let err = err {
                    print("Error writing Document: \(err)")
                }else{
                    print("Document successfully written!")
                }
            }
//            db.collection("routes").document().setData([
//                "name": "Test",
//                "rating": "5.10"
//            ]){err in
//                if let err = err {
//                    print("Error writing Document: \(err)")
//                }else{
//                    print("Document successfully written!")
//                }
//            }
            
            
            goBackToFirst()
            selectedColor = nil
            selectedRating = nil
            
        }
    }
    

    
    
    
//functions for text field
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        textField.resignFirstResponder()

        return true
    }

    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }

}


extension SecondViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == ratingPicker){
        return ratings.count
        }else{
        return colors.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == ratingPicker){
        return ratings[row]
        }else{
        return colors[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == ratingPicker){
        selectedRating = ratings[row]
        sortableRating = numericalRatings[row]
        }else{
        selectedColor = colors[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 75
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 50
    }
    
    //Customizations
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        
            
        if (pickerView == ratingPicker){
        label.text = ratings[row]
            }else{
        label.text = colors[row]
        }
        
        label.transform = CGAffineTransform(rotationAngle: (90 * (.pi/180)))
        
        return label
    }
}
