//
//  UIViewController+Extensions.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

extension UIViewController {
    
    func push(_ controller: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(controller, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        guard let navController = self.navigationController else { return }
        navController.popViewController(animated: animated)
    }
    
}
