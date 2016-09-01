//
//  CircleView.swift
//  TheGantry
//
//  Created by Dominik Sadowski on 8/31/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

}
