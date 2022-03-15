//
//  String.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 14/03/22.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "GeneralStrings",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
