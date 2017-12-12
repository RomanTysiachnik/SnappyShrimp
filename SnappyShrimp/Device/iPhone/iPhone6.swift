//
//  6.swift
//  Snapshot-tests
//
//  Created by Andrey Doroshko on 12/11/17.
//  Copyright © 2017 Andrey Doroshko. All rights reserved.
//

import Foundation

extension Device {
    public enum iPhone6 {
        public static let portrait = Presentation(
            name: "iPhone 6 Portrait",
            size: CGSize.iPhone,
            traitCollection: UITraitCollection.iPhone.portrait)
        public static let landscape = Presentation(
            name: "iPhone 6 Landscape Left",
            size: CGSize.iPhone.rotated,
            traitCollection: UITraitCollection.iPhone.landscape)
    }
}
