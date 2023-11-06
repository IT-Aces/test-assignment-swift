//
//  MoreImagesBackground.swift
//
//
//  Created by Артём Клыч on 06.11.2023.
//

import UIKit

public final class MoreImagesBackground: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        font = UIFont.systemFont(ofSize: 24, weight: .regular)
        textColor = .white
        textAlignment = .center
        backgroundColor = .black.withAlphaComponent(0.4)
        layer.cornerRadius = 12
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func configure(with countImages: Int) {
        text = "+\(countImages)"
    }
}
