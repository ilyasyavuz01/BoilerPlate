//
//  ControlStyle.swift
//  BoilerPlate
//
//  Created by ilyas Y on 7.02.2024.
//

import UIKit

extension Style.Attribute {
    enum Control: Hashable {
        
    }
}

extension Style {
    class Control: View {
        
    }
}

extension UIControl {
    func apply(style: Style.Control?) {
        super.apply(style: style)
    }
}
