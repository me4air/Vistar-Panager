//
//  MainScreenViewController.swift
//  Vistar Panager
//
//  Created by Всеволод on 29.06.2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit
import MapKit

class MainScreenViewController: UIViewController, UITextFieldDelegate {

    
    var HightSearhBackroundAnchor: NSLayoutConstraint?
    var WidthSearhBackroundAnchor: NSLayoutConstraint?
    var searchTextLeftAligmentConstrain: NSLayoutConstraint?
    
    let searchBackgroundViewHight: CGFloat = 50.0
    let searchBackgroundViewWidth: CGFloat = 284.0
    
    var backgroundMap: MKMapView = {
        let backgroundMap = MKMapView()
        backgroundMap.mapType = MKMapType.standard
        backgroundMap.isZoomEnabled = true
        backgroundMap.isScrollEnabled = true
        backgroundMap.showsCompass = false
        return backgroundMap
    }()
    
    var plusButton: MappButton = {
       let plusButton = MappButton(type: UIButtonType.custom) as MappButton
       plusButton.theme = ListButtonTheme(buttonSize: 36, shadowRadius: 12, shadowOpacity: 0.25, imageName: "plusIcon")
       return plusButton
    }()
    
    var minusButton: MappButton = {
        let plusButton = MappButton(type: UIButtonType.custom) as MappButton
        plusButton.theme = ListButtonTheme(buttonSize: 36, shadowRadius: 12, shadowOpacity: 0.25, imageName: "minusButton")
        return plusButton
    }()
    
    var folowButton: MappButton = {
        let plusButton = MappButton(type: UIButtonType.custom) as MappButton
        plusButton.theme = ListButtonTheme(buttonSize: 36, shadowRadius: 12, shadowOpacity: 0.25, imageName: "folowButton")
        return plusButton
    }()
    
    var listButton: UIButton = {
        let listButton = UIButton(type: UIButtonType.custom) as UIButton
        listButton.backgroundColor = UIColor.white
        listButton.layer.masksToBounds = false
        listButton.layer.shadowColor = UIColor.black.cgColor
        listButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        listButton.layer.shadowRadius = 8
        let buttonSize:CGFloat = 60
        listButton.layer.cornerRadius = buttonSize/2
        listButton.layer.shadowOpacity = 0.2
        listButton.setImage(UIImage(named: "list"), for: .normal)
        return listButton
    }()
    
    var searchBackgroundView: UIView = {
        let searchBackgroundView = UIView()
        let searchBackgroundViewHight: CGFloat = 50.0
        searchBackgroundView.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchBackgroundView.layer.masksToBounds = false
        searchBackgroundView.layer.cornerRadius = searchBackgroundViewHight/2
        searchBackgroundView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        searchBackgroundView.layer.shadowRadius = 8
        searchBackgroundView.layer.shadowOpacity = 0.2
        searchBackgroundView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        return searchBackgroundView
    }()
    
    var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.placeholder = "Куда поедем?"
        searchTextField.borderStyle = UITextBorderStyle.none
        searchTextField.font = UIFont.systemFont(ofSize: 18)
        searchTextField.autocorrectionType = UITextAutocorrectionType.no
        searchTextField.keyboardType = UIKeyboardType.default
        searchTextField.returnKeyType = UIReturnKeyType.done
        searchTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        searchTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        return searchTextField
    }()
    
    var searchImage: UIImageView = {
        let searchImage = UIImageView(image: UIImage(named: "searchIcon"))
        return searchImage
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
       
        super.viewWillAppear(animated)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        HightSearhBackroundAnchor?.constant = view.frame.height-searchBackgroundViewHight-25-60-55
        WidthSearhBackroundAnchor?.constant = view.frame.width
        searchTextLeftAligmentConstrain?.isActive = true
        searchBackgroundView.layer.cornerRadius = 10
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        print("TextField should begin editing method called")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        HightSearhBackroundAnchor?.constant = searchBackgroundViewHight
        WidthSearhBackroundAnchor?.constant = searchBackgroundViewWidth
        searchTextLeftAligmentConstrain?.isActive = false
        searchBackgroundView.layer.cornerRadius = 25
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        textField.resignFirstResponder()

        return true
    }
    
    @objc func listButtonAction(_ sender:UIButton!)
    {
        print("List button tapped")
    }
    
    @objc func plusButtonAction(_ sender:UIButton!)
    {
        print("Plus button tapped")
    }
    
    @objc func folowButtonAction(_ sender:UIButton!)
    {
        print("Folow button tapped")
    }
    
    @objc func minusButtonAction(_ sender:UIButton!)
    {
        print("Minus button tapped")
    }
    
    //UI Setup
    
    func setupLayout() {
        
 
        //map
        self.view.addSubview(backgroundMap)
        // Map constriants
        backgroundMap.translatesAutoresizingMaskIntoConstraints = false
        backgroundMap.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundMap.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundMap.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundMap.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundMap.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        backgroundMap.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        //plus button

        self.view.addSubview(plusButton)
        plusButton.addTarget(self, action: #selector(self.plusButtonAction(_:)), for: .touchUpInside)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.topAnchor.constraint(equalTo: backgroundMap.topAnchor, constant: 175).isActive = true
        plusButton.rightAnchor.constraint(equalTo: backgroundMap.rightAnchor, constant: -40).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: (plusButton.buttonSize)).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: (plusButton.buttonSize)).isActive = true
        
        //folow button
        self.view.addSubview(folowButton)
        folowButton.addTarget(self, action: #selector(self.folowButtonAction(_:)), for: .touchUpInside)
        folowButton.translatesAutoresizingMaskIntoConstraints = false
        folowButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 40).isActive = true
        folowButton.rightAnchor.constraint(equalTo: backgroundMap.rightAnchor, constant: -40).isActive = true
        folowButton.widthAnchor.constraint(equalToConstant: (folowButton.buttonSize)).isActive = true
        folowButton.heightAnchor.constraint(equalToConstant: (folowButton.buttonSize)).isActive = true
        
        //minus button
        self.view.addSubview(minusButton)
        minusButton.addTarget(self, action: #selector(self.minusButtonAction(_:)), for: .touchUpInside)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.topAnchor.constraint(equalTo: folowButton.bottomAnchor, constant: 40).isActive = true
        minusButton.rightAnchor.constraint(equalTo: backgroundMap.rightAnchor, constant: -40).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: (plusButton.buttonSize)).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: (plusButton.buttonSize)).isActive = true
        
        //List Button
        listButton.addTarget(self, action: #selector(self.listButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(listButton)
        // List Button constriants
        let buttonSize:CGFloat = 60
        listButton.translatesAutoresizingMaskIntoConstraints = false
        listButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        listButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55).isActive = true
        listButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        listButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        
        
        //searchView BG
        self.view.addSubview(searchBackgroundView)
        // BG constriants
        searchBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        searchBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        WidthSearhBackroundAnchor = searchBackgroundView.widthAnchor.constraint(equalToConstant: searchBackgroundViewWidth)
        WidthSearhBackroundAnchor?.isActive = true

        HightSearhBackroundAnchor =  searchBackgroundView.heightAnchor.constraint(equalToConstant: searchBackgroundViewHight)
        HightSearhBackroundAnchor?.isActive = true

        searchBackgroundView.bottomAnchor.constraint(equalTo: listButton.topAnchor, constant: -25).isActive = true
        
        
        //searchView image
        searchBackgroundView.addSubview(searchImage)
        // image constriants
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.leftAnchor.constraint(equalTo: searchBackgroundView.leftAnchor, constant: 17).isActive = true
        searchImage.topAnchor.constraint(equalTo: searchBackgroundView.topAnchor, constant: 12).isActive = true
        //searchImage.centerYAnchor.constraint(equalTo: searchBackgroundView.centerYAnchor).isActive = true
        searchImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        //searchView textField
        searchTextField.delegate = self
        searchBackgroundView.addSubview(searchTextField)
        // TF constriants
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.centerXAnchor.constraint(equalTo: searchBackgroundView.centerXAnchor).isActive = true
        searchTextField.topAnchor.constraint(equalTo: searchBackgroundView.topAnchor, constant: 12).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: searchBackgroundView.bottomAnchor, constant: 12)
        //searchTextField.centerYAnchor.constraint(equalTo: searchBackgroundView.centerYAnchor).isActive = true
        searchTextLeftAligmentConstrain = searchTextField.leftAnchor.constraint(equalTo: searchImage.rightAnchor, constant: 10)
        searchTextLeftAligmentConstrain?.isActive = false
        
       // searchTextField.leftAnchor.constraintGreaterThanOrEqualToSystemSpacingAfter(searchImage.rightAnchor, multiplier: 2).isActive = true
    }
    
}

/*// TEXT FIELD EXTENSION
 extension MainScreenViewController: UITextFieldDelegate {
 
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
 
 func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
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
 
 
 }
 */
