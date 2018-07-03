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
}
