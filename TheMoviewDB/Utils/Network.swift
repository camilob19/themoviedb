//
//  Network.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 14/03/22.
//

import Foundation
import Network

class Network: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published var connected: Bool = false
    
    func checkConnection() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.connected = (path.status == .satisfied)
            }
        }
        monitor.start(queue: queue)
    }
    
    func cancelConnection() {
        monitor.cancel()
    }
}
