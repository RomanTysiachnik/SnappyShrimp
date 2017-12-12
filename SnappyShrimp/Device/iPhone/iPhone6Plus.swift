//
//  6Plus.swift
//  Snapshot-tests
//
//  Created by Andrey Doroshko on 12/11/17.
//  Copyright © 2017 Andrey Doroshko. All rights reserved.
//

import Foundation

extension Device {
    public enum iPhone6Plus {
        public static let portrait = Presentation(
            name: "iPhone6Plus Portrait",
            size: CGSize.iPhonePlus,
            traitCollection: UITraitCollection.iPhonePlus.portrait)
        public static let landscape = Presentation(
            name: "iPhone 6Plus Landscape Left",
            size: CGSize.iPhonePlus.rotated,
            traitCollection: UITraitCollection.iPhonePlus.landscape)
    }
}
