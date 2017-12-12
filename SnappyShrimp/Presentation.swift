//
//  Presentation.swift
//  
//
//  Created by Andrey Doroshko on 12/11/17.
//

import Foundation
public struct Presentation {
    let name: String
    let size: CGSize
    let traitCollection: UITraitCollection
    let mask: UIView?
    
    public init(name: String, size: CGSize,
                traitCollection: UITraitCollection,
                mask: UIView? = nil) {
        self.name = name
        self.size = size
        self.traitCollection = traitCollection
        self.mask = mask
    }
}

extension Presentation {
    var userInterfaceIdiom: UIUserInterfaceIdiom {
        return self.traitCollection.userInterfaceIdiom
    }
}
