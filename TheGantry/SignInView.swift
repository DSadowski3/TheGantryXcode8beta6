//
//  SignInView.swift
//  TheGantry
//
//  Created by Dominik Sadowski on 8/29/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import UIKit

class SignInView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: CGFloat(SHADOW_GRAY), green: CGFloat(SHADOW_GRAY), blue: CGFloat(SHADOW_GRAY), alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }

}
