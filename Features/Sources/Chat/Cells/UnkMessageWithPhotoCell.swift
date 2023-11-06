//
//  UnkMessageWithPhotoCell.swift
//  
//
//  Created by Артём Клыч on 02.11.2023.
//

import DesignSystem
import IRepositories
import UIKit

final class UnkMessageWithPhotoCell: UICollectionViewCell {
    static let reuseID = "UnkMessageWithPhotoCell"
    
    // MARK: - UI
    
    private let image: AlamofireAppImage = {
        let i = AlamofireAppImage()
        i.contentMode = .scaleAspectFill
        i.layer.cornerRadius = 12
        i.layer.borderColor = UIColor(named: "border")?.cgColor
        i.layer.borderWidth = 0.5
        i.clipsToBounds = true
        i.heightAnchor.constraint(equalToConstant: 165).isActive = true
        i.widthAnchor.constraint(equalToConstant: 165).isActive = true
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private let timeStackView = TimeBadge()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFitting(
        _ targetSize: CGSize,
        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
        verticalFittingPriority: UILayoutPriority
    ) -> CGSize {
        
        var targetSize = targetSize
        targetSize.height = 165
        
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        
        return size
    }
    
    func configure(with message: Message) {
        timeStackView.configure(showIndicator: true, showBackground: true)
        
        if let firstURL = message.media?.first {
            image.loadImage(from: firstURL)
        }
    }
    
    private func configureLayout() {
        addSubview(image)
        addSubview(timeStackView)
        
        NSLayoutConstraint.activate(
            [
                image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                image.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                image.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                
                timeStackView.trailingAnchor.constraint(
                    equalTo: image.trailingAnchor,
                    constant: -4
                ),
                timeStackView.bottomAnchor.constraint(
                    equalTo: image.bottomAnchor,
                    constant: -4
                ),
            ]
        )
    }
}
