//
//  DesignsCollectionViewController.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-19.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

final class DesignsCollectionViewController: UICollectionViewController {
  var brand: Brand!
}

// MARK: - UICollectionViewDataSource
extension DesignsCollectionViewController {
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionCell.reuseIdentifier, for: indexPath) as? ImageCollectionCell else { fatalError() }
    cell.decal = brand.designs[indexPath.row]
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return brand.designs.count
  }
}

// MARK: - UICollectionViewDelegate
extension DesignsCollectionViewController {
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)

    let alertController = UIAlertController(title: "Sticker Ordered!", message: "Our employee will schedule a meeting with you to apply the sticker.", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK!", style: .default, handler: { _ in
      _ = self.navigationController?.popToRootViewController(animated: true)
    })
    alertController.addAction(okAction)
    
    present(alertController, animated: true, completion: nil)
  }
}

// MARK: - UICollectionViewDelegateFlowLayou
extension DesignsCollectionViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    let sideInsets = layout.sectionInset.left + layout.sectionInset.right + layout.minimumInteritemSpacing
    let width = (collectionView.frame.width - sideInsets) / 2
    return CGSize(width: width, height: width)
  }
}
