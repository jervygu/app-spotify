//
//  PlaybackPresenter.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/22/21.
//

import UIKit

final class PlaybackPresenter {
    
    static func startPlayback(fromVC viewController: UIViewController, track: AudioTrack) {
        let vc = PlayerViewController()
        vc.title = track.name
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        
    }
    
    static func startPlayback(fromVC viewController: UIViewController, tracks: [AudioTrack]) {
        let vc = PlayerViewController()
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}


