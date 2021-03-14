//
//  ViewController.swift
//  SPO_Pr_2
//
//  Created by Astemir Shibzuhov on 3/13/21.
//

import Cocoa


class ViewController: NSViewController {
    var button: NSButton!
    
    @IBOutlet weak var backView: NSView!
    var textView: NSTextView!
    let manager = FileManager.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView = NSTextView()
        textView.font = NSFont.systemFont(ofSize: 20)
        backView.addSubview(textView)
        backView.wantsLayer = true
        backView.layer?.backgroundColor = textView.backgroundColor.cgColor
        
        backView.wantsLayer = true
        backView.layer?.cornerRadius = 10
        
        
        "/n".forEach {
            
            print(String($0.asciiValue ?? 0, radix: 16))
        }
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }
    
    override func viewWillLayout() {
        super.viewWillLayout()
        let cgRect = CGRect(x: 8, y: 8, width: backView.bounds.width - 16, height: backView.bounds.height - 16)
        textView.frame = cgRect
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        let cgRect = CGRect(x: 8, y: 8, width: backView.bounds.width - 16, height: backView.bounds.height - 16)
        textView.frame = cgRect

    }
    
    @IBAction func didClickWrite(_ sender: Any) {
        let path = "Documents/Files/"
        do {
            try manager.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {timer in
                
            }.fire()
           
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        manager.createFile(atPath: path + FileNameType.bin.rawValue, contents: textView.string.data(using: .utf8), attributes: nil)
        manager.createFile(atPath: path + FileNameType.txt.rawValue, contents: textView.string.data(using: .utf8), attributes: nil)
        let vc = ResultVC()
        self.presentAsModalWindow(vc)
        textView.string = ""
      
        
    }

}


extension NSView {
    func setDefaultCenterConstraint() {
        guard let superView = self.superview,
              self.translatesAutoresizingMaskIntoConstraints == false else { return }
        
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: superView.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            self.widthAnchor.constraint(equalToConstant: 100),
            self.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func getBigIntFromData(data: NSData, offset: Int) -> Int {
        let rng = NSRange(location: offset, length: 4)
        var i = [UInt32](repeating: 0, count: 1)

        data.getBytes(&i, range: rng)
        return Int(i[0].bigEndian)
    }
}

