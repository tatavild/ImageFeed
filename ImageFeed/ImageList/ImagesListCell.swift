//
//  File.swift
//  ImageFeed
//
//  Created by TATIANA VILDANOVA on 05.09.2023.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    private var gradientInited = false
    
    @IBOutlet weak var gradientView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    
    func configureGradient() {
        if !gradientInited {
            let gradient = CAGradientLayer()
            gradient.frame = gradientView.bounds
            gradient.colors = [UIColor.clear.cgColor, UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 0.2).cgColor]
            gradientView.layer.insertSublayer(gradient, at: 0)
            gradientInited.toggle()
        }
    }
    
    func configCell(image: UIImage, dateText: String, isLiked: Bool) {
        cellImage.image = image
        dateLabel.text = dateText
        
        let likeImage = isLiked ? UIImage(named: "like_active") : UIImage(named: "like_not_active")
        likeButton.setImage(likeImage, for: .normal)
    }
}

