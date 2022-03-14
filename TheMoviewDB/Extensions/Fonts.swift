//
//  UIFonts.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 14/03/22.
//

import Foundation
import SwiftUI

extension Font {
    static var headerFont: Font {
        return Font.custom("SourceSansPro-Bold", size: 40)
    }
    
    static var titleFont: Font {
        return Font.custom("SourceSansPro-Bold", size: 20)
    }
    
    static var bodyFont: Font {
        return Font.custom("SourceSansPro-Regular", size: 16)
    }
    
    static var bodySpecialFont: Font {
        return Font.custom("SourceSansPro-Bold", size: 16)
    }
    
    static var normalFont: Font {
        return Font.custom("SourceSansPro-Bold", size: 14)
    }
    
    static var specialFont: Font {
        return Font.custom("SourceSansPro-SemiBold", size: 12)
    }
}
