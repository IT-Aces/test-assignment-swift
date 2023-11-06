//
//  ChatViewController.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import UIKit

public final class ChatViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel = ViewModel()
    private var collectionView: UICollectionView
    
    // MARK: - Life cycle
    
    public override init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?
    ) {
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required init?(coder: NSCoder) {
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        super.init(coder: coder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchMessages()
    }
    
    // MARK: - Private methods
    
    private func configureCollectionView() {
        collectionView.register(
            MessageWithPhotosCell.self,
            forCellWithReuseIdentifier: MessageWithPhotosCell.reuseID
        )
        
        collectionView.register(
            MessageWithPhotoCell.self,
            forCellWithReuseIdentifier: MessageWithPhotoCell.reuseID
        )
        
        collectionView.register(
            UnkMessageWithPhotosCell.self,
            forCellWithReuseIdentifier: UnkMessageWithPhotosCell.reuseID
        )
        
        collectionView.register(
            UnkMessageWithPhotoCell.self,
            forCellWithReuseIdentifier: UnkMessageWithPhotoCell.reuseID
        )
        
        view.addSubview(collectionView)
        
        collectionView.contentInsetAdjustmentBehavior = .always
        let contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        collectionView.contentInset = contentInset
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout
        if let flowLayout = layout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(
                width: collectionView.widestCellWidth,
                height: 200
            )
        }
    }
    
    private func fetchMessages() {
        viewModel.fetchMessages { [weak collectionView] in
            guard let collectionView else { return }
            collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension ChatViewController: UICollectionViewDelegate {
    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        viewModel.messages.count
    }
}

// MARK: - UICollectionViewDataSource

extension ChatViewController: UICollectionViewDataSource {
    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let message = viewModel.messages[indexPath.row]
        switch message.type {
        case .me:
            guard let media = message.media else { break }
            if media.count > 1 {
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: UnkMessageWithPhotosCell.reuseID,
                    for: indexPath
                ) as? UnkMessageWithPhotosCell {
                    cell.configure(with: message)
                    return cell
                }
            } else {
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: UnkMessageWithPhotoCell.reuseID,
                    for: indexPath
                ) as? UnkMessageWithPhotoCell {
                    cell.configure(with: message)
                    return cell
                }
            }
            
        case .other:
            guard let media = message.media else { break }
            if media.count > 1 {
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MessageWithPhotosCell.reuseID,
                    for: indexPath
                ) as? MessageWithPhotosCell {
                    cell.configure(with: message)
                    return cell
                }
            } else {
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MessageWithPhotoCell.reuseID,
                    for: indexPath
                ) as? MessageWithPhotoCell {
                    cell.configure(with: message)
                    return cell
                }
            }
        }
        
        return UICollectionViewCell()
    }
}
