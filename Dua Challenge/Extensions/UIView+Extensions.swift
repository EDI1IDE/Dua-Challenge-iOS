//
//  UIView+Extensions.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

enum Corner {
    case all
    case top
    case bottom
    case left
    case right
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

//MARK: - @IBDesignables
@IBDesignable extension UIView {
    
    @IBInspectable var borderColor:UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor:color)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var borderWidth:CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get { return layer.masksToBounds }
        set { layer.masksToBounds = newValue }
    }
    
    //Shadows
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
}

//MARK: - Extensions
extension UIView {
    
    func dropShadow(blur: CGFloat = 4, color: CGColor = UIColor.systemBlue.cgColor, alpha: Float = 0.2, offset: CGSize = CGSize(width: 0, height: 2), shadowPath: CGPath? = nil) {
        self.layer.shadowOpacity = alpha
        self.layer.shadowRadius = blur
        self.layer.shadowOffset = offset
        self.layer.shadowColor = color
        self.layer.masksToBounds = false
        if let shadowPath { self.layer.shadowPath = shadowPath }
    }
    
    func roundCorner(corner: Corner = .bottom, radius: CGFloat = 20) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = getCorner(corner: corner)
    }
    
    func getCorner(corner: Corner) -> CACornerMask {
        switch corner {
        case .all:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .top:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .left:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .right:
            return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .topLeft:
            return [.layerMinXMinYCorner]
        case .topRight:
            return [.layerMaxXMinYCorner]
        case .bottomLeft:
            return [.layerMinXMaxYCorner]
        case .bottomRight:
            return [.layerMaxXMaxYCorner]
        }
    }
    
}
