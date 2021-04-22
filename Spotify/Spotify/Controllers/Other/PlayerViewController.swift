//
//  PlayerViewController.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import UIKit



class PlayerViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private let controlsView = PlayerControlsView()
    
    private let gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.random().cgColor, UIColor.systemBackground]
        return gradient
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(gradient)
        
        
        
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(controlsView)
        controlsView.delegate = self
        configureBarButtons()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // gradient
        
        view.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
        
        
        
        
     
        let imageSize = view.width/1.2
        imageView.frame = CGRect(
            x: (view.width-imageSize)/2,
            y: view.safeAreaInsets.top+(view.width-imageSize)/2,
            width: imageSize,
            height: imageSize)
        
        let controlsViewWidth = view.width/1.1
        controlsView.frame = CGRect(
            x: (view.width-controlsViewWidth)/2,
            y: view.width+30,
            width: controlsViewWidth,
            height: controlsViewWidth-20)
        
    }
    
    private func  configureBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapAction))
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapAction() {
        // actions
    }
}

extension PlayerViewController: PlayerControlsViewDelegate {
    func playerControlsViewDidTapPlayPauseButton(_ playerControlsView: PlayerControlsView) {
        // play / pause song
    }
    
    func playerControlsViewDidTapBackButton(_ playerControlsView: PlayerControlsView) {
        // previous song
    }
    
    func playerControlsViewDidTapNextButton(_ playerControlsView: PlayerControlsView) {
        // next song
    }
    
    
}
