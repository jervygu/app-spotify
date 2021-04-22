//
//  PlayerControlsView.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/22/21.
//

import UIKit

protocol PlayerControlsViewDelegate: AnyObject {
    func playerControlsViewDidTapPlayPauseButton(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapBackButton(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapNextButton(_ playerControlsView: PlayerControlsView)
}

final class PlayerControlsView: UIView {
    
    weak var delegate: PlayerControlsViewDelegate?
    
    private let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
         
        return slider
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(
            systemName: "backward.end.fill",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 30,
                weight: .ultraLight))
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(
            systemName: "forward.end.fill",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 30,
                weight: .ultraLight))
        button.setImage(image, for: .normal)
        return button
    }()
     
    private let playPauseButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(
            systemName: "pause.circle.fill",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 60,
                weight: .ultraLight))
        button.setImage(image, for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .systemGray
        clipsToBounds = true
        
        addSubview(volumeSlider)
        
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        titleLabel.text = "Title"
        subTitleLabel.text = "Artist"
        
        addSubview(backButton)
        addSubview(playPauseButton)
        addSubview(nextButton)
        
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapBackButton() {
        delegate?.playerControlsViewDidTapBackButton(self)
    }
    @objc private func didTapNextButton() {
        delegate?.playerControlsViewDidTapNextButton(self)
    }
    @objc private func didTapPlayPauseButton() {
        delegate?.playerControlsViewDidTapPlayPauseButton(self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(
            x: 10,
            y: 30,
            width: width-20,
            height: width/10)
//        titleLabel.backgroundColor = .systemTeal
        
        subTitleLabel.frame = CGRect(
            x: 10,
            y: titleLabel.height+30,
            width: width-20,
            height: width/13)
//        subTitleLabel.backgroundColor = .systemPink
        
        volumeSlider.frame = CGRect(
            x: 5,
            y: 10+titleLabel.height+10+subTitleLabel.height+30,
            width: width-10,
            height: 44)
        
        let buttonSize: CGFloat = 60
        playPauseButton.frame = CGRect(
            x: (width-buttonSize)/2,
            y: (width-buttonSize)/2+30,
            width: buttonSize,
            height: buttonSize)
//        playPauseButton.backgroundColor = .systemPink
        
        backButton.frame = CGRect(
            x: playPauseButton.left-40-buttonSize,
            y: (width-buttonSize)/2+30,
            width: buttonSize,
            height: buttonSize)
//        backButton.backgroundColor = .systemPink
        
        nextButton.frame = CGRect(
            x: playPauseButton.right+40,
            y: (width-buttonSize)/2+30,
            width: buttonSize,
            height: buttonSize)
//        nextButton.backgroundColor = .systemPink
        
        
        
        
    }
}
