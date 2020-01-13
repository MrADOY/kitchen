//
//  CircleImage.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 05/11/2019.
//

import SwiftUI
import KingfisherSwiftUI

struct CircleImage: View {
    var url: String
    var body: some View {
         KFImage(URL(string: url)!)
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}
