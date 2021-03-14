//
//  AppDelegate.swift
//  SPO_Pr_2
//
//  Created by Astemir Shibzuhov on 3/13/21.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    var main: NSWindowController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
//        main = NSStoryboard(name: "Main", bundle: nil).instantiateInitialController() as! NSWindowController
//        main.window?.contentViewController = ResultVC()
//        main.window?.makeKeyAndOrderFront(nil)
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

