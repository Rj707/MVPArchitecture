//
//  GalleryViewPresenter.swift
//  MVPArchitecture
//
//  Created by Hafiz Saad on 27/02/2020.
//  Copyright © 2020 AtTech. All rights reserved.
//

import Foundation

class GalleryViewPresenter: GalleryViewToPresenterProtocol
{
    var view : PresenterToGalleryViewProtocol?
    
    var galleryImagesArray = [GalleryResource]()
    
    func fetchImages()
    {
        view?.showLoader()
        
        APIManager.shared.getGalleryImages("")
        { (isSuccessful, errorMessage, galleryObject) in
            
            self.view?.hideLoader()
            
            self.galleryImagesArray = galleryObject?.resources ?? [GalleryResource]()
            
            self.view?.reloadGalleryTableData()
        }
    }
    
    func numberOfImages() -> Int
    {
        return galleryImagesArray.count
    }
    
    func galleryImageDataAt(row:Int) -> GalleryResource
    {
        return galleryImagesArray[row]
    }
    
    func didSelectImageAt(row: Int)
    {
        view?.showSelectedImageDetail(detail: galleryImagesArray[row])
    }    
}
