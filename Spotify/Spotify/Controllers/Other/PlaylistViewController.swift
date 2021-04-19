//
//  PlaylistViewController.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import UIKit

class PlaylistViewController: UIViewController {
    
    private let playlist: Playlist
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (_, _) -> NSCollectionLayoutSection? in
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 4,
                                                         leading: 0,
                                                         bottom: 4,
                                                         trailing: 0)
            
            // Group
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(80)
                ),
                subitem: item,
                count: 1)
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 0,
                bottom: 0,
                trailing: 0)
            
            section.boundarySupplementaryItems = [
                NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .fractionalWidth(0.8)),
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
            ]
            
            return section
            
            
            
        }))
    
    init(playlist: Playlist) {
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var viewModels = [RecommendedTrackCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = playlist.name
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        collectionView.register(
            PlaylistCollectionViewCell.self,
            forCellWithReuseIdentifier: PlaylistCollectionViewCell.identifier)
        
        collectionView.register(
            PlaylistHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: PlaylistHeaderCollectionReusableView.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        
        
        APICaller.shared.getPlaylistDetails(withPlaylist: playlist) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    // RecommendedTrackCellViewModel
                    self?.viewModels = model.tracks.items.compactMap({
                        RecommendedTrackCellViewModel(
                            name: $0.track.name,
                            artworkURL: URL(string: $0.track.album?.images.first?.url  ?? ""),
                            artistName: $0.track.artists.first?.name ?? "",
                            track_number: $0.track.track_number)
                    })
                    self?.collectionView.reloadData()
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShareButton))
    }
    
    @objc private func didTapShareButton(){
        // share
        print(playlist.external_urls)
        guard let url = URL(string: playlist.external_urls["spotify"] ?? "") else {
            return
        }
        
        let vc = UIActivityViewController(
            activityItems: [url],
            applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }

    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        
    }
    
}


extension PlaylistViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PlaylistCollectionViewCell.identifier,
                for: indexPath) as? PlaylistCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(withModel: viewModels[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: PlaylistHeaderCollectionReusableView.identifier,
                for: indexPath) as? PlaylistHeaderCollectionReusableView,
              kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let headerViewModel = PlaylistHeaderViewViewModel(
            name: playlist.name,
            ownerName: playlist.owner.display_name,
            description: playlist.description,
            artworkURL: URL(string: playlist.images.first?.url ?? ""),
            total: playlist.tracks.total)
        
        
        header.configure(withModel: headerViewModel)
        header.delegate = self
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // play song
        
    }
    
    
}


extension PlaylistViewController: PlaylistHeaderCollectionReusableViewDelegate {
    func playlistHeaderCollectionReusableViewDidTapPlayAll(_ header: PlaylistHeaderCollectionReusableView) {
        // start play all in queue
        print("play all")
    }
}
