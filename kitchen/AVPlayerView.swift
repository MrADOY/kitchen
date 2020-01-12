//
//  SwiftUIView.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 12/01/2020.
//

import SwiftUI
import AVKit

struct ContentView: View {
    let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
    @State private var vURL = URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")
    var body: some View {
        AVPlayerView(videoURL: self.vURL).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AVPlayerView: UIViewControllerRepresentable {

    var videoURL: URL?

    private var player: AVPlayer {
        
        return AVPlayer(url: videoURL!)
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.player = player
        playerController.player?.play()
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.player?.play()
        return playerController
    }
}

struct AVPlayerView_Previews: PreviewProvider {
    static var previews: some View {
       AVPlayerView(videoURL : URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")!)
    }
}

