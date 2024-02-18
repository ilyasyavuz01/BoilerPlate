//
//  ImageViewStyle.swift
//  BoilerPlate
//
//  Created by ilyas Y on 7.02.2024.
//

import UIKit

extension Style.Attribute {
    enum ImageView: Hashable {
        case image(UIImage?)
        case highlightedImage(UIImage?)
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .image:
                hasher.combine(0)
            case .highlightedImage:
                hasher.combine(1)
            }
        }
        
        static func == (lhs: ImageView, rhs: ImageView) -> Bool {
            lhs.hashValue == rhs.hashValue
        }

        func apply(to imageView: UIImageView) {
            switch self {
            case .image(let image):
                imageView.image = image
            case .highlightedImage(let image):
                imageView.highlightedImage = image
            }
        }
    }
}

extension Style {
    class ImageView: View {
        @discardableResult
        func image(_ image: UIImage?) -> Self {
            insert(.imageView(.image(image)))
        }
        @discardableResult
        func highlightedImage(_ image: UIImage?) -> Self {
            insert(.imageView(.highlightedImage(image)))
        }
    }
}

extension UIImageView {
    func apply(style: Style.ImageView?) {
        super.apply(style: style)
        
        for case let Style.Attribute.imageView(attribute) in style?.attributes ?? [] {
            attribute.apply(to: self)
        }
    }
}
