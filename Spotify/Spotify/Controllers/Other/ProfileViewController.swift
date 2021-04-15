//
//  ProfileViewController.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var models = [String]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Profile"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        fetchProfile()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func fetchProfile() {
        APICaller.shared.getCurrentUserProfile { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.updateUI(withModel: model)
                case .failure(let error):
                    print("Profile error: \(error.localizedDescription)")
                    self?.failedToGetProfile()
                }
            }
        }
    }
    
    private func updateUI(withModel model: UserProfile) {
        tableView.isHidden = false
        // confifure table models
        models.append("Fullname: \(model.display_name)")
        title = model.display_name
        models.append("Email: \(model.email)")
        models.append("User ID: \(model.id)")
        models.append("Plan: \(model.product)")
//        models.append("Plan: \(model.followers)")
        
        createHeader(with: model.images.first?.url)
        
        tableView.reloadData()
    }
    
    private func createHeader(with string: String? ) {
        guard let urlString = string, let url = URL(string: urlString) else {
            return
        }
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.width/1.5))
        
        let imageSize: CGFloat = headerView.height/2
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        headerView.addSubview(imageView)
        imageView.center = headerView.center
        imageView.contentMode = .scaleAspectFill
        imageView.sd_setImage(with: url, completed: nil)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageSize/2
        
        tableView.tableHeaderView = headerView
    }
    
    private func failedToGetProfile() {
        let label = UILabel(frame: .zero)
        label.text = "Failed to load profile."
        label.sizeToFit()
        label.textColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
    }
    
    // MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
}
