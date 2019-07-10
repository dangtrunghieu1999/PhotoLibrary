//
//  PhotoCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - Variables
    public static let photoId = "photoId"
    
    // MARK: UI - Elements
    let photoImageView: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFill
        return photo
    }()
    
    // MARK: - View LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutPhotoImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder): has not been ilemented")
    }
    
    // MARK: - Layout
    
    func layoutPhotoImage() {
        contentView.addSubview(photoImageView)
        photoImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
