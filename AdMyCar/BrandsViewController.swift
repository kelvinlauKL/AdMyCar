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
  fileprivate let featuredBrands = Brand.featuredTestData
  fileprivate let socialGoodBrands = Brand.socialGoodData
  
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
      let section = Section(rawValue: indexPath.section)!
      
      designsVC.brand = {
        switch section {
        case .featured:
          return featuredBrands[indexPath.row]
        case .socialGood:
          return socialGoodBrands[indexPath.row]
        case .ongoing:
          return brands[indexPath.row]
        }
      }()
    }
  }
}

// MARK: - UITableViewDataSource
extension BrandsViewController {
  enum Section: Int, CustomStringConvertible {
    case featured, socialGood, ongoing
    
    static var allValues: [Section] {
      return [.featured, .socialGood, .ongoing]
    }
    
    var description: String {
      switch self {
      case .featured:
        return "Featured"
      case .socialGood:
        return "Social Good"
      case .ongoing:
        return "Ongoing"
      }
    }
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return Section.allValues.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let section = Section(rawValue: indexPath.section), let cell = tableView.dequeueReusableCell(withIdentifier: BrandTableCell.reuseIdentifier) as? BrandTableCell else { fatalError() }
    cell.brand = {
      switch section {
      case .featured:
        return featuredBrands[indexPath.row]
      case .socialGood:
        return socialGoodBrands[indexPath.row]
      case .ongoing:
        return brands[indexPath.row]
      }
    }()
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let section = Section(rawValue: section) else { fatalError() }
    switch section {
    case .featured:
      return featuredBrands.count
    case .socialGood:
      return socialGoodBrands.count
    case .ongoing:
      return brands.count
    }
  }
}

// MARK: - UITableViewDelegate
extension BrandsViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    performSegue(withIdentifier: .designs, sender: indexPath)
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard let section = Section(rawValue: section) else { fatalError() }
    return section.description
  }
}
