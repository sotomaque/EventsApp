//
//  AppCoordinator.swift
//  Events
//
//  Created by Enrique Sotomayor on 9/27/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    
    func start()
}

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        
        childCoordinators.append(eventListCoordinator) 
        eventListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
