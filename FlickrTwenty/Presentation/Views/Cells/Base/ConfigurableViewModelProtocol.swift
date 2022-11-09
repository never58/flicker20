//
//  ConfigurableViewModelProtocol.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import UIKit

public protocol ConfigurableViewModelProtocol {
    var reuseIdentifier: String { get }
    var cellClass: UICollectionViewCell.Type { get }

}

public extension ConfigurableViewModelProtocol {
    var reuseIdentifier: String {
        String(describing: cellClass)
    }
}
