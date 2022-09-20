//
//  CreateNewsViewModel.swift
//  NYTimesNewsApp
//
//  Created by Shamkhal Guliyev on 17.09.22.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import FirebaseCoreInternal

class CreateNewsViewModel {
    
    func createNews(title: String, desc: String, complete: @escaping(()->())) {
        let data: [String: Any] = ["title": title, "desc": desc, "url": "\(title).jpg"]
        let collection = Firestore.firestore().collection("MyNews").document("list")
        collection.updateData(["items": FieldValue.arrayUnion([data])]) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                complete()
            }
        }
    }
    
    func uploadImage(image: UIImage, name: String, complete: @escaping(()->())) {
        let ref = Storage.storage().reference()
        let imageRef = ref.child("\(name).jpg")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let data = image.jpegData(compressionQuality: 0.3) ?? Data()
        let _ = imageRef.putData(data, metadata: metadata) { _, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                complete()
            }
        }
    }
}
