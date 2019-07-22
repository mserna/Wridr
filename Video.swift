//
//  Video.swift
//  WridrBeta
//
//  Created by Michael Serna on 12/1/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: Date?
    
    var channel: Channel?
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
