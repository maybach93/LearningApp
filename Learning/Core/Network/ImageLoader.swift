//
//  ImageLoader.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/28/20.
//

import Foundation
import SwiftUI
import Combine


struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    private let imageName: String

    init(name: String, placeholder: Placeholder? = nil, loader: ImageLoader = ImageLoader()) {
        self.placeholder = placeholder
        self.imageName = name
        self.loader = loader
    }
    
    var body: some View {
        image.onAppear {
            loader.load(name: self.imageName)
        }
    }
    
    private var image: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image).resizable().renderingMode(.original)
            } else {
                placeholder
            }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var disposeBag: Set<AnyCancellable> = Set()

    private var networkProvider: NetworkProvider = NetworkProvider()
    
    func load(name: String) {
        self.networkProvider.requestImageData(name: name).map({ UIImage(data: $0) })
            .sink { (completion) in
            } receiveValue: { [weak self] (image) in
                self?.image = image
            }.store(in: &disposeBag)
    }
}
