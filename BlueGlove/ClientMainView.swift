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
    @IBOutlet weak var mainMessageLabel: UILabel!
    
    
    var QRImage: UIImage? {
            get { return QRImageView.image }
            set { QRImageView.image = newValue }
    }
    var mainMessage: String? {
        get { return mainMessageLabel.text }
        set { mainMessageLabel.text = newValue }
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
