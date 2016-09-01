//
//  CircleView.swift
//  TheGantry
//
//  Created by Dominik Sadowski on 8/31/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: CGFloat(SHADOW_GRAY), green: CGFloat(SHADOW_GRAY), blue: CGFloat(SHADOW_GRAY), alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = self.frame.width / 2
    }

}
