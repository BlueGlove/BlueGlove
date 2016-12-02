//
//  ClientMainView.swift
//  BlueGlove
//
//  Created by Phillip Pang on 11/15/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import UIKit

class ClientMainView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var QRImageView: UIImageView!

    @IBOutlet weak var beaconUUIDLabel: UILabel!
    @IBOutlet weak var beaconMajorLabel: UILabel!
    @IBOutlet weak var beaconMinorLabel: UILabel!
    
    @IBOutlet weak var beaconActivityLog: UITextView!
    
    
    var QRImage: UIImage? {
            get { return QRImageView.image }
            set { QRImageView.image = newValue }
    }
    var beaconManager: BluBeaconManager? {
        get { return self.beaconManager }
        set {
            var region = newValue?.defaultRegion()
            beaconUUIDLabel.text = region?.proximityUUID.description
            beaconMajorLabel.text = region?.major?.description(withLocale: nil)
            beaconMinorLabel.text = region?.minor?.description(withLocale: nil)
            beaconActivityLog.text = newValue?.activityLog
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "ClientMainView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
            
            // custom initialization logic

    }

}
