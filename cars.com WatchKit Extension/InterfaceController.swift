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

enum optionRow:Int {
    case optionBuy = 0
    case optionSellAndTrade = 1
    case Service = 2
    case News = 3
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
        
        var viewName:String = ""
        let context:String = objects[rowIndex].name
        
        switch (rowIndex)
        {
        case 0:
            viewName = "showBuyOptions"
            break
        case 1:
            viewName = "showSellOptions"
            break
        case 2:
            viewName = "showServiceOptions"
            break
        case 3:
            viewName = "ShowNews"
            break
        default:
            assert(false, "Bad access...")
            break
        }
        
        self.pushControllerWithName(viewName, context: context)
    }

}
