//
//  UIStoryboard+Extensions.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

extension UIStoryboard {
    
    func instantiate<T: UIViewController>(_ : T.Type, identifier: String? = nil) -> T {
        return self.instantiateViewController(withIdentifier: identifier ?? String(describing: T.self)) as! T
    }
    
    //MARK: App Storyboards
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
}
