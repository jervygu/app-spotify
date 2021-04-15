//
//  HomeViewController.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .done,
            target: self,
            action: #selector(didTapSettingsBtn))
        
        
    }
    
    @objc func didTapSettingsBtn() {
        let vc = SettingsViewController()
        vc.title = "Settings "
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

