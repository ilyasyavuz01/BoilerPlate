//
//  R.Font.swift
//  BoilerPlate
//
//  Created by ilyas Y on 2.02.2024.
//

import UIKit

extension R {
    struct Fonts {
        struct SourceSansPro {
            static func black(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-Black", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func blackIt(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-BlackIt", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func bold(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func boldIt(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-BoldIt", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func extraLight(size: CGFloat) -> UIFont {
                 UIFont(name: "SourceSansPro-ExtraLight", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func extraLightId(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-ExtraLightId", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func italic(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-It", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func light(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-Light", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func lightIt(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-LightId", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func regular(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func semibold(size: CGFloat) -> UIFont {
                 UIFont(name: "SourceSansPro-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size)
            }
            
            static func semiboldId(size: CGFloat) -> UIFont {
                UIFont(name: "SourceSansPro-SemiBoldItalic", size: size) ?? UIFont.systemFont(ofSize: size)
            }
        }
    }
}
