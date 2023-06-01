//
//  UIImage+Extensions.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

//MARK: - Icons & Images
extension UIImage {
    public class var backArrow: UIImage? {
        return UIImage(named: "BackArrow")
    }
    
    public class var oldBall: UIImage? {
        return UIImage(systemName: "circle.fill")
    }
    
    public class func teamLogo(number: Int) -> UIImage? {
        guard number >= 0 && number <= 20 else { return UIImage(named: "Logo-1")}
        return UIImage(named: "Logo-\(number)")
    }
}

//MARK: - Extensions
extension UIImage {
    func resizeImage(size: Double, quality: CGFloat) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size))
        let resizedImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        }
        guard let imageData = resizedImage.jpegData(compressionQuality: quality)
        else { return nil }
        return UIImage(data: imageData)
    }
}
