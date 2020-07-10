//
//  AsyncImage.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedImage: UIImage?
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedImage = UIImage(data: data)
            }
        }.resume()
    }
}

struct AsyncImage: View {
    @ObservedObject private var imageLoader = ImageLoader()
    private let placeholder: Image
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        self.imageLoader.load(url: url)
        self.imageLoader.objectWillChange.send()
    }
    
    var body: some View {
        if let image = self.imageLoader.downloadedImage {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .clipped()
                    .scaledToFill()
            )
        } else {
            return AnyView(
                placeholder
                    .resizable()
                    .scaledToFit()
                    .padding(40)
            )
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(url: "https://picsum.photos/400/800")
    }
}
