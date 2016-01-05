//
//  InterfaceController.swift
//  cars.com WatchKit Extension
//
//  Created by DroidFx on 1/5/16.
//  Copyright © 2016 DroidFx. All rights reserved.
//

import WatchKit
import Foundation

struct rowData {
    let name: String
    let imageName: String
}


class InterfaceController: WKInterfaceController {

    @IBOutlet var optionsMenu: WKInterfaceTable!
    
    let objects: [rowData] = [
        rowData(name: "Buy", imageName: "icon_buy"),
        rowData(name: "Sell & Trade", imageName: "icon_sell"),
        rowData(name: "Service", imageName: "icon_service"),
        rowData(name: "News", imageName: "icon_news")
    ]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        setupTable()
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    func setupTable() {
        
        optionsMenu.setNumberOfRows(objects.count, withRowType: "OptionMenuRow")
        
        for  i in 0 ..< objects.count {
            let object = objects[i]
            if let row = optionsMenu.rowControllerAtIndex(i) as? OptionMenuRow {
                row.name.setText(object.name)
                row.imageName.setImageNamed(object.imageName)
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
//        self.pushControllerWithName("showDetails", context: countries[rowIndex])
    }

}
