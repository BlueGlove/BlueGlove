//
//  ViewController.swift
//  BlueGlove
//
//  Created by Phillip Pang on 11/9/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var clientView: ClientMainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        clientView.QRImage = UIImage(named: "QR_Image_20161110_black")
        clientView.mainBeacon = BluBeaconManager.sharedRegions[0]
        
        let bluClient = BluClient()
        bluClient.addVisit()

        clientView.beaconActivityLog.text.append("\nnew activity")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

