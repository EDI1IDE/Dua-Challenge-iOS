//
//  UITableView+Extensions.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

extension UITableView {
    
    //Normal Cells
    func register<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        let nib = UINib(nibName: reuseIdentifier ?? String(describing: T.self), bundle: nil)
        self.register(nib, forCellReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath, reuseIdentifier: String? = nil) -> T {
        let reuseIdentifier: String = reuseIdentifier ?? String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T
        else { fatalError("Could not deque cell with type \(T.self)") }
        return cell
    }
    
    //Header & Footer
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type, reuseIdentifier: String? = nil) {
        let nib = UINib(nibName: reuseIdentifier ?? String(describing: T.self), bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T
        else { fatalError("Could not deque cell with type \(T.self)") }
        return view
    }
    
}
