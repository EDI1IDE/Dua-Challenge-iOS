//
//  CostumFunctions.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import Foundation

func delay(delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}

func dispatch(_ closure: @escaping ()->()) {
    delay(delay: 0.0, closure: closure)
}
