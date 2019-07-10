//
//  PhtoLibraryViewController.swift
//  PhotoLibrary
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class PhotoLibraryViewController: UIViewController {
    
    //MARK: - Varibles
    
    private  let collectionViewHorizontalMargin: CGFloat = 8
    lazy var collectionViewCellWidth = (UIScreen.main.bounds.width - 2 * collectionViewHorizontalMargin - 16) / 3
    
    var image: [PhotoModel] = [PhotoModel(image: "1"),PhotoModel(image: "2"),PhotoModel(image: "3"),
                               PhotoModel(image: "4"),PhotoModel(image: "6"),PhotoModel(image: "7"),
                               PhotoModel(image: "8"),PhotoModel(image: "9"),PhotoModel(image: "10"),
                               PhotoModel(image: "11"),PhotoModel(image: "12"),PhotoModel(image: "13"),
                               PhotoModel(image: "14"),PhotoModel(image: "15"),PhotoModel(image: "1"),
                               PhotoModel(image: "8"),PhotoModel(image: "9"),PhotoModel(image: "10"),
                               PhotoModel(image: "11"),PhotoModel(image: "12"),PhotoModel(image: "13"),
                               PhotoModel(image: "14"),PhotoModel(image: "15"),PhotoModel(image: "1"),
                               ]
    
    
    // MARK: - UI ELements
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.photoId)
        return collectionView
    }()
    
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigaitonBar()
        layoutCollectionView()
    }
    
    
    // MARK: - SetupView
    
    func setupNavigaitonBar() {
        navigationItem.title = "PhotoLibrary"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Back")
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Back")
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
   
    }
    
    func layoutCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(collectionViewHorizontalMargin)
            make.right.equalToSuperview().offset(-collectionViewHorizontalMargin)
        }
    }
    
}

// MARK: - UICollectionViewDelegate

extension PhotoLibraryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageView = ImageViewController()
        imageView.imageView.image = UIImage(named: image[indexPath.row].image)
        navigationController?.pushViewController(imageView, animated: true)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotoLibraryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
   
}

// MARK: - UICollectionViewDataSource

extension PhotoLibraryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.photoId, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.photoImageView.image = UIImage(named: image[indexPath.row].image)
        return cell
    }
}









