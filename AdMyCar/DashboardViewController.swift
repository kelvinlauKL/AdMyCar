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
  
  fileprivate var decals: [Decal] = Decal.breastCancerDecals + Decal.saveTheChildrenDecals + Decal.appleDecals
  fileprivate var bluetoothDetector: BluetoothDetector!
}

// MARK: - Life Cycle
extension DashboardViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    bluetoothDetector = BluetoothDetector(delegate: self)
  }
}

// MARK: - UITableViewDelegate
extension DashboardViewController {
  enum Row: Int {
    case decals, earningPotential, lifetimeEarnings, distanceDriven
  }
  
  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    guard let row = Row(rawValue: indexPath.row) else { fatalError() }
    switch row {
    case .decals:
      return
    case .earningPotential:
      displayAlert(message: "Your earning potential is based on your decals.")
    case .lifetimeEarnings:
      displayAlert(message: "The money you made since you started with us.")
    case .distanceDriven:
      displayAlert(message: "The distance you've driven since you started with us.")
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
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

// MARK: - BluetoothDelegate
extension DashboardViewController: BluetoothDelegate {
  func stickerDetected() {
    print("sticker detected")
  }
}
