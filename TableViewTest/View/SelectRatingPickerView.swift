//
//  SelectRatingPickerView.swift
//  TableViewTest
//
//  Created by Emily Thomas on 9/23/18.
//  Copyright © 2018 TS Myers. All rights reserved.
//

import UIKit

class SelectRatingPickerView: UIPickerView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
