//
//  TitleHeaderCollectionReusableView.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/19/21.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "TitleHeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(
            x: 4,
            y: 0,
            width: width-8,
            height: height)
//        label.backgroundColor = .red
    }
    
    func configure(withTitle title: String) {
        label.text = title
    }
    
}
