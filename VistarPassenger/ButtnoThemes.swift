//
//  ButtnoThemes.swift
//  VistarPassenger
//
//  Created by Всеволод on 03.07.2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import Foundation
import UIKit

protocol ButtonTheme {
    var backgroundColor: UIColor {get}
    var buttonSize: CGFloat {get set}
    var cornerRadius: CGFloat {get}
    var maskToBounds: Bool {get}
    var shadowColor: UIColor {get}
    var shadowOfset: CGSize {get}
    var shadowRadius: CGFloat {get set}
    var shadowOpacity: Float {get set}
    var imageName: String {get set}
}

struct ListButtonTheme: ButtonTheme {
    var backgroundColor: UIColor = .white
    var buttonSize: CGFloat
    var cornerRadius: CGFloat = 0
    var maskToBounds: Bool = false
    var shadowColor: UIColor = .black
    var shadowOfset: CGSize = CGSize(width: 0.0, height: 4.0)
    var shadowRadius: CGFloat
    var shadowOpacity: Float
    var imageName: String
    
    init(buttonSize: CGFloat , shadowRadius: CGFloat , shadowOpacity: Float , imageName: String){
        self.buttonSize = buttonSize
        self.cornerRadius = buttonSize/2
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.imageName = imageName
    }
}

struct SettingsButtonTheme: ButtonTheme {
    var backgroundColor: UIColor = .clear
    var buttonSize: CGFloat
    var cornerRadius: CGFloat = 0
    var maskToBounds: Bool = false
    var shadowColor: UIColor = .clear
    var shadowOfset: CGSize = CGSize(width: 0.0, height: 0.0)
    var shadowRadius: CGFloat
    var shadowOpacity: Float
    var imageName: String
    
    init(buttonSize: CGFloat , shadowRadius: CGFloat , shadowOpacity: Float , imageName: String){
        self.buttonSize = buttonSize
        self.cornerRadius = buttonSize/2
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.imageName = imageName
    }
}

class MappButton: UIButton {
    var buttonSize: CGFloat = 0
    
    var theme: ButtonTheme? {
        didSet{
            styleButton()
        }
    }
    
    private func styleButton() {
        if let theme = theme {
            backgroundColor = theme.backgroundColor
            buttonSize = theme.buttonSize
            layer.cornerRadius = theme.cornerRadius
            layer.masksToBounds = theme.maskToBounds
            layer.shadowColor = theme.shadowColor.cgColor
            layer.shadowOpacity = theme.shadowOpacity
            layer.shadowRadius = theme.shadowRadius
            layer.shadowOffset = theme.shadowOfset
            self.setImage(UIImage(named: theme.imageName), for: .normal)
        }
    }
    
    
    
}
