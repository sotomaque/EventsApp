//
//  EventListViewController.swift
//  Events
//
//  Created by Enrique Sotomayor on 9/27/21.
//

import UIKit

class EventListViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "EventListViewController") as! EventListViewController
        return controller 
    }
    
    /// Sets Navigation Bar Button and Title
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(
            image: plusImage,
            style: .plain,
            target: self,
            action: #selector(tappedRightBarButton)
        )
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedRightBarButton() {
        print("Tapped")
    }
}

