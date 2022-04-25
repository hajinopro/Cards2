//
//  PhotoPicker.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/25.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var images: [UIImage]
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> UIViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 0
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> PhotosCoordinator {
        PhotosCoordinator(parent: self)
    }
    
    class PhotosCoordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker
        
        init(parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            let itemProviders = results.map(\.itemProvider)
            for item in itemProviders {
                if item.canLoadObject(ofClass: UIImage.self) {
                    item.loadObject(ofClass: UIImage.self) { image, error in
                        if let error = error {
                            print("Error!", error.localizedDescription)
                        } else {
                            DispatchQueue.main.async {
                                if let image = image as? UIImage {
                                    self.parent.images.append(image)
                                }
                            }
                        }
                    }
                }
            }
            parent.dismiss()
        }
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker(images: .constant([UIImage]()))
    }
}
