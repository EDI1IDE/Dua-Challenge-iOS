//
//  ShadowClasses.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

//MARK: - Shadow View
open class ShadowView: UIView {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dispatch { self.dropShadow() }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        dispatch { self.dropShadow() }
    }
    
    //When transitioning between light and dark mode, the described changes are implemented(refreshed).
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        guard traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else { return }
        self.layer.shadowColor = UIColor.systemBlue.cgColor
    }
}

//MARK: - Shadow Light View
open class ShadowLightView: UIView {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dispatch { self.dropShadow(blur: 2, alpha: 0.1) }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        dispatch { self.dropShadow(blur: 2, alpha: 0.1) }
    }
    
    //When transitioning between light and dark mode, the described changes are implemented(refreshed).
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        guard traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else { return }
        self.layer.shadowColor = UIColor.systemBlue.cgColor
    }
}

//MARK: - Shadow Stack View
open class ShadowStackView: UIStackView {
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dispatch { self.dropShadow() }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        dispatch { self.dropShadow() }
    }
    
    //When transitioning between light and dark mode, the described changes are implemented(refreshed).
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        guard traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else { return }
        self.layer.shadowColor = UIColor.systemBlue.cgColor
    }
}
