//
//  OnBoardingCell.swift
//  MVP+TDD
//
//  Created by Андрей Коноплев on 08/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import UIKit

class OnBoardingCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: OnBoardingModel)-> Void {
        imageView.image = model.image
        descriptionLabel.text = model.text
    }

}
