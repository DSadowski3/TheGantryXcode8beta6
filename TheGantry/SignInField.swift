//
//  SignInField.swift
//  TheGantry
//
//  Created by Dominik Sadowski on 8/29/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import UIKit

class SignInField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: CGFloat(SHADOW_GRAY), green: CGFloat(SHADOW_GRAY), blue: CGFloat(SHADOW_GRAY), alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    

}
