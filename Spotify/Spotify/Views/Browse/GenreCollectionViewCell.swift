//
//  GenreCollectionViewCell.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/19/21.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    static let identifer = "GenreCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        imageView.image = UIImage(
            systemName: "music.quarternote.3",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 50,
                weight: .regular))
        return imageView
    }()
    
    private let genrelabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let colors: [UIColor] = [
        .brown,
        .systemGreen,
        .systemPink,
        .systemTeal,
        .systemPurple,
        .systemBlue,
        .systemRed,
        .systemIndigo,
        .systemOrange,
        .systemYellow
    ]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(genrelabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        genrelabel.text = nil
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        genrelabel.frame = CGRect(
            x: 10,
            y: 0,
            width: (contentView.width/2)-10,
            height: contentView.height/2)
//        genrelabel.backgroundColor = .black
        
        let imageSize = contentView.width/2
        
        imageView.frame = CGRect(
            x: (contentView.width/2),
            y: 20,
            width: imageSize,
            height: imageSize-20)
//        imageView.backgroundColor = .red
        
    }
    
    func configure(withTitle title: String) {
        genrelabel.text = title
        contentView.backgroundColor = colors.randomElement()
        
    }
    
}
