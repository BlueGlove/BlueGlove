//
//  BluBeaconManager.swift
//  BlueGlove
//
//  Created by Phillip Pang on 11/23/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import Foundation


class BluBeaconManager: ESTBeaconManager {
    
    static let sharedManager:BluBeaconManager = BluBeaconManager()
    
    static let sharedRegions:[BluBeaconInfo] = [
        BluBeaconInfo(proximityUUID: UUID(uuidString: "8228DD1A-D9C4-4E98-96CC-559A4EF91AFD")!, major: 2016, minor: 1, identifier: "ice")
        ,BluBeaconInfo(proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, major: 54359, minor: 2688, identifier: "blueberry" )
        ,BluBeaconInfo(proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, major: 0, minor: 0, identifier: "mint" )
    ]
    
    var activityLog: String!
    
    func addActivityLog(string: String){
        activityLog.appending( string )
    }

}
