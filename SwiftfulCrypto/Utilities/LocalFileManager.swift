//
//  LocalFileManager.swift
//  SwiftfulCrypto
//
//  Created by Aaron Wilson on 2/28/23.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // create folder
        createFolderIfNeeded(folderName: folderName)
        
        // get path for image
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, folderName: folderName)
            else { return }
        
        // save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("error saving image. ImageName \(imageName) \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path()) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path())
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appending(path: folderName)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        return folderURL.appending(path: imageName + ".png")
    }
    
}
