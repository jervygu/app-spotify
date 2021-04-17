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
        
        title = "Browse"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .done,
            target: self,
            action: #selector(didTapSettingsBtn)
        )
        fetchData()
        
    }
    
    private func fetchData() {
        
//        APICaller.shared.getCurrentUserProfile { (result) in
//            switch result {
//            case .success(let model):
//                break
//            case .failure(let error):
//                break
//            }
//        }
        
        
        
//        APICaller.shared.getNewReleases { (result) in
//            switch result {
//            case .success(let model):
//                break
//            case .failure(let error):
//                break
//            }
//        }
        

//        APICaller.shared.getFeaturedPlaylists { (result) in
//            switch result {
//            case .success(let model):
//                break
//            case .failure(let error):
//                break
//            }
//
//        }
        
        APICaller.shared.getRecommendationGenres { (result) in
            switch result {
            case .success(let model):
                let genres = model.genres
                var seeds = Set<String>()
                while seeds.count < 3 {
                    if let random = genres.randomElement() {
                        seeds.insert(random)
                    }
                }

                APICaller.shared.getRecommendations(genres: seeds) { (_) in

                }

            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
        
    }
    
    @objc func didTapSettingsBtn() {
        let vc = SettingsViewController()
        vc.title = "Settings "
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

