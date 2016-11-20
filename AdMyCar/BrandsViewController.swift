//
//  BrandsViewController.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-19.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

final class BrandsViewController: UITableViewController {
  fileprivate let brands = Brand.testData
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.setNavigationBarHidden(false, animated: true)
    navigationItem.hidesBackButton = true
  }
}

// MARK: - SegueHandlerType
extension BrandsViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case designs
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .designs:
      let designsVC = segue.destination as! DesignsCollectionViewController
      let indexPath = sender as! IndexPath
      designsVC.brand = brands[indexPath.row]
    }
  }
}

// MARK: - UITableViewDataSource
extension BrandsViewController {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: BrandTableCell.reuseIdentifier) as? BrandTableCell else { fatalError() }
    cell.brand = brands[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return brands.count
  }
}

// MARK: - UITableViewDelegate
extension BrandsViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    performSegue(withIdentifier: .designs, sender: indexPath)
  }
}
