//
//  AvatarLabel.swift
//
//
//  Created by Артём Клыч on 06.11.2023.
//

import UIKit

public final class AvatarLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        textColor = .white
        textAlignment = .center
        backgroundColor = UIColor(named: "AvatarBackground")
        heightAnchor.constraint(equalToConstant: 36).isActive = true
        widthAnchor.constraint(equalToConstant: 36).isActive = true
        layer.cornerRadius = 18
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
