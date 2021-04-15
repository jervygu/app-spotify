//
//  Extensions.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import UIKit

extension UIView {
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return left + width
    }
    
    var top: CGFloat {
        return frame.size.width
    }
    
    var bottom: CGFloat {
        return top + height
    }
}
