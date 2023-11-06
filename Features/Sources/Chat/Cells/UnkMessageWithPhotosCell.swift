//
//  UnkMessageWithPhotosCell.swift
//  
//
//  Created by Артём Клыч on 02.11.2023.
//

import DesignSystem
import IRepositories
import UIKit

final class UnkMessageWithPhotosCell: UICollectionViewCell {
    static let reuseID = "UnkMessageWithPhotosCell"
    
    // MARK: - UI
    
    private let imagesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 0
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let firstImage: AlamofireAppImage = {
        let i = AlamofireAppImage()
        i.layer.cornerRadius = 12
        i.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        i.clipsToBounds = true
        i.contentMode = .scaleAspectFill
        i.layer.borderColor = UIColor(named: "border")?.cgColor
        i.layer.borderWidth = 0.5
        i.heightAnchor.constraint(equalToConstant: 120).isActive = true
        i.widthAnchor.constraint(equalToConstant: 120).isActive = true
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private let secondImage: AlamofireAppImage = {
        let i = AlamofireAppImage()
        i.layer.cornerRadius = 12
        i.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        i.clipsToBounds = true
        i.contentMode = .scaleAspectFill
        i.layer.borderColor = UIColor(named: "border")?.cgColor
        i.layer.borderWidth = 0.5
        i.heightAnchor.constraint(equalToConstant: 120).isActive = true
        i.widthAnchor.constraint(equalToConstant: 120).isActive = true
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private let moreImagesLabel = MoreImagesBackground()
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
        targetSize.height = 120
        
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        
        return size
    }
    
    func configure(with message: Message) {
        timeStackView.configure(showIndicator: true, showBackground: false)
        
        if let media = message.media, media.count > 1 {
            firstImage.loadImage(from: media[0])
            secondImage.loadImage(from: media[1])
            
            // т.к 2 изображения мы уже вывели, вычитаем их из общего числа
            moreImagesLabel.configure(with: media.count - 2)
        }
    }
    
    private func configureLayout() {
        imagesStackView.addArrangedSubview(firstImage)
        imagesStackView.addArrangedSubview(secondImage)
        
        addSubview(imagesStackView)
        addSubview(moreImagesLabel)
        addSubview(timeStackView)
        
        NSLayoutConstraint.activate(
            [
                imagesStackView.topAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.topAnchor
                ),
                imagesStackView.trailingAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.trailingAnchor
                ),
                imagesStackView.bottomAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.bottomAnchor
                ),
                
                moreImagesLabel.topAnchor.constraint(
                    equalTo: secondImage.topAnchor
                ),
                moreImagesLabel.leadingAnchor.constraint(
                    equalTo: secondImage.leadingAnchor
                ),
                moreImagesLabel.trailingAnchor.constraint(
                    equalTo: secondImage.trailingAnchor
                ),
                moreImagesLabel.bottomAnchor.constraint(
                    equalTo: secondImage.bottomAnchor
                ),
                
                timeStackView.trailingAnchor.constraint(
                    equalTo: secondImage.trailingAnchor
                ),
                timeStackView.bottomAnchor.constraint(
                    equalTo: secondImage.bottomAnchor,
                    constant: -3
                ),
            ]
        )
    }
}

