//
//  MessageWithPhotosCell.swift
//  
//
//  Created by Артём Клыч on 02.11.2023.
//

import DesignSystem
import IRepositories
import UIKit

final class MessageWithPhotosCell: UICollectionViewCell {
    static let reuseID = "MessageWithPhotosCell"
    
    // MARK: - UI
    
    private let rootStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.alignment = .bottom
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let avatarLabel = AvatarLabel()
    
    private let messageStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 0
        sv.backgroundColor = UIColor(named: "MessageBackground")
        sv.layer.cornerRadius = 12
        sv.heightAnchor.constraint(equalToConstant: 145).isActive = true
        sv.widthAnchor.constraint(equalToConstant: 240).isActive = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let imagesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 0
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let messageHeaderStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 6
        sv.distribution = .fill
        sv.alignment = .center
        sv.layoutMargins = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
        sv.isLayoutMarginsRelativeArrangement = true
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
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private let fioLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        l.textColor = UIColor(named: "UserName")
        l.lineBreakMode = .byTruncatingTail
        l.textAlignment = .center
        l.numberOfLines = 1
        l.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let roleLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        l.textColor = UIColor(named: "UserRoleColor")
        l.lineBreakMode = .byTruncatingTail
        l.textAlignment = .center
        l.numberOfLines = 1
        l.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
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
        targetSize.height = 145
        
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        
        return size
    }
    
    func configure(with message: Message) {
        avatarLabel.text = "LS"
        fioLabel.text = message.sender.fullName
        roleLabel.text = message.sender.meta
        timeStackView.configure(showIndicator: false, showBackground: false)
        
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
        
        messageHeaderStackView.addArrangedSubview(fioLabel)
        messageHeaderStackView.addArrangedSubview(roleLabel)

        messageStackView.addArrangedSubview(messageHeaderStackView)
        messageStackView.addArrangedSubview(imagesStackView)
        
        rootStackView.addArrangedSubview(avatarLabel)
        rootStackView.addArrangedSubview(messageStackView)
        
        addSubview(rootStackView)
        addSubview(moreImagesLabel)
        addSubview(timeStackView)
        
        NSLayoutConstraint.activate(
            [
                rootStackView.topAnchor.constraint(equalTo: topAnchor),
                rootStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                rootStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
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
