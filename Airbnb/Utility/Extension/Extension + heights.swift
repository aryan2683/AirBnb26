//
//  Extension + heights.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 06/07/25.
//

import SwiftUI

import SwiftUI

extension CGFloat {
    static func screenHeightRatio(_ ratio: CGFloat) -> CGFloat {
        UIScreen.main.bounds.height * ratio
    }

    static func screenWidthRatio(_ ratio: CGFloat) -> CGFloat {
        UIScreen.main.bounds.width * ratio
    }
}
