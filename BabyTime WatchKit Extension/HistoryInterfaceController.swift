//
//  HistoryInterfaceController.swift
//  BabyTime
//
//  Created by sheng on 2/11/17.
//  Copyright © 2017 Kewe. All rights reserved.
//

import WatchKit
import Foundation


class HistoryInterfaceController: WKInterfaceController {
    
    @IBOutlet var table: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        log.debug(0) // not showing because log is not initialized yet
        print("awake")
    }

    override func willActivate() {
        log.debug(1)
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        // Configure interface objects here.
        let x = 1
        
        table.setNumberOfRows(baby.feedList.count * x, withRowType: "Row")
        
        for i in 0..<baby.feedList.count * x {
            if let controller = table.rowController(at: i) as? RowController {
                controller.feed = baby.feedList[i/x]
            }
        }
    }

    override func didDeactivate() {
        log.debug(-1)
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}

class RowController: NSObject {
    @IBOutlet var titleLabel: WKInterfaceLabel!
    @IBOutlet var detailLabel: WKInterfaceLabel!
    
    var feed: Feed? {
        didSet {
            log.verbose(feed)
            if let feed = feed {
                titleLabel.setText("\(feed.amount)")
                detailLabel.setText("\(feed.time)")
            }
        }
    }
}
