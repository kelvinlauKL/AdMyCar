//
//  DashboardViewController.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-19.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

final class DashboardViewController: UITableViewController {
  @IBOutlet fileprivate var collectionView: UICollectionView!
  @IBOutlet fileprivate var lifetimeEarningsLabel: UILabel!
  @IBOutlet fileprivate var distanceTravelledLabel: UILabel!
  
  fileprivate var decals: [Decal] = Decal.appleDecals
  
}

// MARK: - Life Cycle
extension DashboardViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}

// MARK: - UICollectionViewDataSource
extension DashboardViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return decals.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionCell.reuseIdentifier, for: indexPath) as? ImageCollectionCell else { fatalError() }
    cell.decal = decals[indexPath.row]
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DashboardViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    let sideInsets = layout.sectionInset.top + layout.sectionInset.bottom
    let width = collectionView.frame.height - sideInsets
    
    return CGSize(width: width, height: width)
  }
}
