//
//  BluetoothDetector.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-20.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import CoreBluetooth

protocol BluetoothDelegate: class {
  func stickerDetected()
}

final class BluetoothDetector: NSObject {
  fileprivate var centralManager: CBCentralManager!
  weak var delegate: BluetoothDelegate?
  
  init(delegate: BluetoothDelegate) {
    super.init()
    
    centralManager = CBCentralManager(delegate: self, queue: nil)
    
  }
}

// MARK: - CBCentralManagerDelegate
extension BluetoothDetector: CBCentralManagerDelegate {
  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    switch central.state {
    case .poweredOn:
      centralManager.scanForPeripherals(withServices: nil, options: nil)
    default:
      return
    }
  }
  
  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
    delegate?.stickerDetected()
  }
}
