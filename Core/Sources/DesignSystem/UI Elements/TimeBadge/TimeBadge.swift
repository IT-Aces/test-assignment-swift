//
//  TimeBadge.swift
//
//
//  Created by Артём Клыч on 06.11.2023.
//

import UIKit

public final class TimeBadge: UIStackView {
    
    private let timeLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let indicator: UIImageView = {
        let image = UIImageView()
        if #available(iOS 13.0, *) {
            image.image = UIImage(named: "ic_check", in: .module, with: .none)
        } else {
            image.image = UIImage(named: "ic_check")
        }
        image.tintColor = .white
        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
        return image
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        axis = .horizontal
        spacing = 2
        distribution = .equalSpacing
       
        heightAnchor.constraint(equalToConstant: 20).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(indicator)
        addArrangedSubview(timeLabel)
    }
    
    public func configure(showIndicator: Bool, showBackground: Bool) {
        timeLabel.text = "11:29"
        indicator.isHidden = !showIndicator
        
        if showIndicator {
            layoutMargins = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 10)
        } else {
            layoutMargins = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
        }
        
        isLayoutMarginsRelativeArrangement = true

        if showBackground {
            backgroundColor = .black.withAlphaComponent(0.4)
            layer.cornerRadius = 11.27
        }
    }
}
