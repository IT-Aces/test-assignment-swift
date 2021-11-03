//
//  CustomTableViewCell.swift
//  TA1Swift
//
//  Created by Slava Starovoitov on 04.11.2021.
//

import UIKit

extension UITableViewCell {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarLabel: UILabel!
    @IBOutlet weak var bufferView1: UIView!
    @IBOutlet weak var bufferView2: UIView!
    
    @IBOutlet weak var mainBgView: UIView!
    @IBOutlet weak var senderInfoView: UIView!
    @IBOutlet weak var senderFullName: UILabel!
    @IBOutlet weak var senderMeta: UILabel!
    
    @IBOutlet weak var firstPhoto: UIImageView!
    @IBOutlet weak var secondPhoto: UIImageView!
    @IBOutlet weak var photosParentView: UIView!
    @IBOutlet weak var secondPhotoParentView: UIView!
    @IBOutlet weak var countOfPhotoLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!

    
    @IBOutlet weak var firstBuffer25cnstr: NSLayoutConstraint!
    @IBOutlet weak var firstBuffer50cnstr: NSLayoutConstraint!
    

    @IBOutlet weak var secondBuffer25cnstr: NSLayoutConstraint!
    @IBOutlet weak var secondBuffer50cnstr: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)

        // Configure the view for the selected state
    }
    
}

extension CustomTableViewCell {
    
    func setup(_ data: SampleMessage) {
        
        self.mainBgView.layer.cornerRadius = 12
        self.photosParentView.layer.cornerRadius = 12
        if let senderName = data.sender?.senderFullName {
            self.avatarLabel.text = String(senderName.abbr().dropLast())
        }
//        self.avatarLabel.text = String(data.sender?.senderFullName.abbr())
        
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        self.timeLabel.text = formatter.string(from: today)
        self.timeLabel.clipsToBounds = true
        self.timeLabel.layer.cornerRadius = 10

        
        switch data.messageType {
        case .incoming:
            self.bufferView1.isHidden = true
            self.senderFullName.text = data.sender?.senderFullName
            self.senderMeta.text = data.sender?.senderMeta
            self.avatarLabel.layer.masksToBounds = true
            self.avatarLabel.layer.cornerRadius = self.avatarLabel.frame.width / 2.0
//            self.avatarLabel.text =
        case .outdoring:
            self.avatarLabel.isHidden = true
            self.senderInfoView.isHidden = true
            self.bufferView1.isHidden = false
            self.bufferView2.isHidden = true
        }
        
        if data.media?.count == 1 {
            self.secondPhotoParentView.isHidden = true
            if let urlArray = data.media {
                guard let imageData = try? Data(contentsOf: urlArray[0] as URL) else {
                    return
                }
                guard let image = UIImage(data: imageData) else {
                    return
                }
                self.firstPhoto.layer.masksToBounds = true
                self.firstPhoto.layer.cornerRadius = 12
                self.firstPhoto.image = image
                
                self.firstBuffer50cnstr.isActive = true
                self.secondBuffer50cnstr.isActive = true
                
            }
        } else {
            if let urlArray = data.media {
                var images = [UIImage]()
                urlArray.forEach { url in
                    guard let imageData = try? Data(contentsOf: url as URL) else {
                        return
                    }
                    guard let image = UIImage(data: imageData) else {
                        return
                    }
                    images.append(image)
                }
                self.firstPhoto.clipsToBounds = true
                self.secondPhoto.clipsToBounds = true
                self.firstPhoto.image = images[0]
                self.secondPhoto.image = images[1]
                self.countOfPhotoLabel.text = "+" + String((data.media?.count ?? 2) - 1)
            }
            self.firstBuffer25cnstr.isActive = true
            self.secondBuffer25cnstr.isActive = true
            
        }
        
    }
    
}
