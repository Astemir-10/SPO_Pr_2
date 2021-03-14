//
//  SecondVC.swift
//  SPO_Pr_2
//
//  Created by Astemir Shibzuhov on 3/13/21.
//

import Cocoa

enum WriteType: Int {
    case text, binary, double, int
}

protocol SecondVCDelegate: class {
    func saveSelectedWith(selectedRadio: NSButton, selectedType: WriteType)
}

class SecondVC: NSViewController {
    
    weak var delegate: SecondVCDelegate?
    
    var selectedRadio: NSButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didSelectText(_ sender: NSButton) {
        selectedRadio?.state = .off
        selectedRadio = sender
        sender.state = .on
    }
    
    @IBAction func didSelectBinary(_ sender: NSButton) {
        selectedRadio?.state = .off
        selectedRadio = sender
        sender.state = .on
    }
    
    @IBAction func didSelectDouble(_ sender: NSButton) {
        selectedRadio?.state = .off
        selectedRadio = sender
        sender.state = .on
    }
    
    @IBAction func didSelectInt(_ sender: NSButton) {
        selectedRadio?.state = .off
        selectedRadio = sender
        sender.state = .on
    }

    @IBAction func saveAction(_ sender: Any) {
        guard let selectedRadio = selectedRadio,  let selectedType = WriteType(rawValue: selectedRadio.tag) else {return}
       
        delegate?.saveSelectedWith(selectedRadio: selectedRadio, selectedType: selectedType)
        dismiss(self)

    }
}
