//
//  StorageManager.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 28.12.2021.
//

import Foundation
import FirebaseStorage

final class StorageManager{
    static let shared = StorageManager()
    private let storage = Storage.storage().reference()
    
    public typealias UploadPictureCompletion = (Result<String, Error>) -> Void
     /// Uploads picture to firebase storage and returns completion string with url to download
    public func profileUploadPicture(with data: Data, fileName: String, completion: @escaping UploadPictureCompletion ){
        storage.child("images/\(fileName)").putData(data, metadata: nil, completion: {metadata, error in
            guard error == nil else {
                // failed
                print("failed to upload data to firebase for picture ")
                completion(.failure(StorageErrors.failedToUpload))
                return
            }
            
            self.storage.child("images/\(fileName)").downloadURL(completion: {url, error in
                guard let url = url else {
                    print("failed To Get Download Url")
                    completion(.failure(StorageErrors.failedToGetDownloadUrl))
                    return
                }
                // if success
                let urlString = url.absoluteString
                print("Download url returned: \(urlString)")
                completion(.success(urlString))
            }
            )
        })
        
      
    }
    public enum StorageErrors: Error{
        case failedToUpload
        case failedToGetDownloadUrl
    }
    public func downloadUrl(for path: String, completion: @escaping (Result<URL, Error>) -> Void){
        let reference = storage.child(path)
        reference.downloadURL(completion: {url, error in
            
            guard let url = url, error == nil else {
                completion(.failure(StorageErrors.failedToGetDownloadUrl))
                return
            }
            completion(.success(url))
        })
    }
}
