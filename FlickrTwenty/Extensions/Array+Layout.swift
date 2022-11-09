//
//  Array+Layout.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 9.11.2022.
//

import UIKit

public extension Array where Element: NSLayoutConstraint {

    func activate() {
        self.forEach {
            $0.isActive = true
        }
    }

    func deactivate() {
        self.forEach {
            $0.isActive = false
        }
    }
}

public extension Array where Element: UIView {

    func disableAutoresizingTranslation() {
        self.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
