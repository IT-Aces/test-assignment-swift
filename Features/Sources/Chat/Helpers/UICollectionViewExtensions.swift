//
//  UICollectionViewExtensions.swift
//
//
//  Created by Артём Клыч on 06.11.2023.
//

import UIKit

extension UICollectionView {
    var widestCellWidth: CGFloat {
        let insets = contentInset.left + contentInset.right
        return UIScreen.main.bounds.width - insets
    }
}
