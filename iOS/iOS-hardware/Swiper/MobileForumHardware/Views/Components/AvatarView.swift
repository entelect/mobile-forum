//
//  AvatarView.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI

struct AvatarView: View {
    let url: String
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: self.url, placeholder: Image(systemName: "person.crop.rectangle"))
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: geometry.size.width,
                       maxHeight: geometry.size.height)
        }
        .overlay(
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.clear, .black]),
                                     startPoint: .init(x: 0.5, y: 0.75), endPoint: .bottom))
                .clipped()
        )
        .overlay(
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.clear, .black]),
                                     startPoint: .init(x: 0.5, y: 0.06), endPoint: .top))
                
                .clipped()
        ).edgesIgnoringSafeArea(.top)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(url: "https://picsum.photos/400")
    }
}
