//
//  ResultVC.swift
//  SPO_Pr_2
//
//  Created by Astemir Shibzuhov on 3/13/21.
//

import Cocoa

class ResultVC: NSViewController {

    @IBOutlet weak var textASCIIBack: NSView!
    @IBOutlet weak var binaryASCIIBack: NSView!
    @IBOutlet weak var binaryASCIIStringBack: NSView!
    @IBOutlet weak var textASCIIStringBack: NSView!

    
    var textASCII: NSTextView!
    var binaryASCII: NSTextView!
    var binaryASCIIString: NSTextView!
    var textASCIIString: NSTextView!
    let manager = FileManager.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        readFile()

    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        
        textASCII.frame = textASCIIBack.bounds
        binaryASCII.frame = binaryASCIIBack.bounds
        binaryASCIIString.frame = binaryASCIIStringBack.bounds
        textASCIIString.frame = textASCIIStringBack.bounds
        
        
    }
    
    override func viewWillLayout() {
        super.viewWillLayout()
        textASCII.frame = textASCIIBack.bounds
        binaryASCII.frame = binaryASCIIBack.bounds
        binaryASCIIString.frame = binaryASCIIStringBack.bounds
        textASCIIString.frame = textASCIIStringBack.bounds
        
    }
    
    func readFile() {
        
        let path = "Documents/Files/"
        guard let binData = manager.contents(atPath: path + FileNameType.bin.rawValue),
              let textData = manager.contents(atPath: path + FileNameType.txt.rawValue) else {
            return
        }
        let textString = String(data: textData, encoding: .utf8) ?? ""
        let binaryString = String(data: binData, encoding: .utf8) ?? ""
        textASCIIString.string = textString
        binaryASCIIString.string = binaryString
        
        textString.forEach({
            textASCII.string += String($0.asciiValue ?? 0, radix: 16)
            textASCII.string += " "
        })
        binaryString.forEach({
            binaryASCII.string += String($0.asciiValue ?? 0, radix: 16)
            binaryASCII.string += " "
        })
    }
    
    
    func setup() {
        textASCII = NSTextView()
        textASCIIBack.addSubview(textASCII)
        
        binaryASCII = NSTextView()
        binaryASCIIBack.addSubview(binaryASCII)
        
        binaryASCIIString = NSTextView()
        binaryASCIIStringBack.addSubview(binaryASCIIString)
        
        textASCIIString = NSTextView()
        textASCIIStringBack.addSubview(textASCIIString)
        
        [textASCII, binaryASCII, binaryASCIIString, textASCIIString].forEach({
            $0?.isSelectable = false
        })
    }
    
}
