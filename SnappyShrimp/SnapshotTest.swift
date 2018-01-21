//  Copyright © 2017 One by AOL : Publishers. All rights reserved.

import FBSnapshotTestCase
import UIKit
///The base class of view snapshotting tests on all possible screens. By default, you have to create schemes for testing and for record. Both of them must contain enviroment arguments with paths to save images and with a value that indicates the record mode state ("RECORD_MODE" by default). For your own implementation of setting record mode true or false, override the setUp method and design your own way of running tests.
open class SnapshotTest: FBSnapshotTestCase{
    
    ///Settings for snapshot testing.
    override open func setUp() {
        super.setUp()
        isDeviceAgnostic = false
        recordMode = ProcessInfo.processInfo.environment["RECORD_MODE"] == "TRUE"
    }
    
    ///Verifies your snapshots with specified controller, whose view you're going to test and a device with its parameteres.
    public final func verify(
        _ controller: UIViewController,
        for presentation: Presentation,
        in context: Context = Context(),
        file: StaticString = #file,
        line: UInt = #line) {
        
        guard presentation.userInterfaceIdiom == UIDevice.current.userInterfaceIdiom else { return }
        guard presentation.scale == UIScreen.main.scale else { return }
        
        let window = HostWindow(presentation: presentation, context: context)
        controller.view.frame = presentation.size.asRect
        
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight, forKey: "orientation")
        window.addSubview(controller.view)
        if #available(iOS 11.0, *) {
            controller.view.translatesAutoresizingMaskIntoConstraints = false
            let guide = window.safeAreaLayoutGuide
            NSLayoutConstraint.activate([controller.view.topAnchor.constraint(equalTo: guide.topAnchor),
                                         controller.view.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
                                         controller.view.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
                                         controller.view.trailingAnchor.constraint(equalTo: guide.trailingAnchor)])
        }
        
        let name = [presentation.name,
                    context.name,
                    UIDevice.current.systemName,
                    UIDevice.current.systemVersion]
            .map { $0.replacingOccurrences(of: " ", with: "_") }
            .filter { !$0.isEmpty }
            .joined(separator: "_")
        
        window.makeKeyAndVisible()
        FBSnapshotVerifyView(window, identifier: name, suffixes: [""], file: file, line: line)
    }
}


