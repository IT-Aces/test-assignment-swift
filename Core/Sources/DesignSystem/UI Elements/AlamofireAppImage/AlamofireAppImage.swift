//
//  AlamofireAppImage.swift
//
//
//  Created by Артём Клыч on 02.11.2023.
//

import Alamofire
import AlamofireImage
import UIKit

public final class AlamofireAppImage: UIImageView {
    private var imageLoadingRequest: DataRequest?
    
    private static let placeholder = UIImage(named: "placeholder")!
    
    public func loadImage(from url: URL) {
        imageLoadingRequest?.cancel()
        image = Self.placeholder
        imageLoadingRequest = AF.request(url).responseImage { [weak self] response in
            guard let self else { return }
            switch response.result {
            case .success(let image):
                self.image = image
            case .failure(let error):
                debugPrint("Error loading image: \(error.localizedDescription)")
            }
        }
    }
}
