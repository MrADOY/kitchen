//
//  URLImage.swift
//  kitchen
//
//  Created by Marceau Hollertt on 13/01/2020.
//

import SwiftUI
import KingfisherSwiftUI


struct URLImage: View {
    var url: String
    var body: some View {
        KFImage(URL(string: url)!)
        .resizable()
        .opacity(0.6)
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://www.tripsavvy.com/thmb/71Li6SYzHcJS6_LoonDPjvhovO4=/3837x2158/smart/filters:no_upscale()/steak-frites-838971058-95a4df7771ca4538aaaa46a830d06081.jpg")
    }
}

