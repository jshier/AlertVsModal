//
//  InterfaceController.swift
//  ModalTest WatchKit Extension
//
//  Created by Jon Shier on 10/4/17.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBAction func presentModalWithAlert() {
        let okayAction = WKAlertAction(title: "Okay", style: .default) {
            WKExtension.shared().rootInterfaceController?.presentController(withName: "PresentedInterfaceController", context: nil)
        }
        let cancelAction = WKAlertAction(title: "Cancel", style: .cancel) { }
        
        presentAlert(withTitle: "Test", message: "Message", preferredStyle: .alert, actions: [cancelAction, okayAction])
    }
    
    @IBAction func presentModalWithAlertAsync() {
        let okayAction = WKAlertAction(title: "Okay", style: .default) {
            DispatchQueue.main.async {
                WKExtension.shared().rootInterfaceController?.presentController(withName: "PresentedInterfaceController", context: nil)
            }
        }
        let cancelAction = WKAlertAction(title: "Cancel", style: .cancel) { }
        
        presentAlert(withTitle: "Test", message: "Message", preferredStyle: .alert, actions: [cancelAction, okayAction])
    }
    
    @IBAction func presentModal() {
        WKExtension.shared().rootInterfaceController?.presentController(withName: "PresentedInterfaceController", context: nil)
    }
    
}
