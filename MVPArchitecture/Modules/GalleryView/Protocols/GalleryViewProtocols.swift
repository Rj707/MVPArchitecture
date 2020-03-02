//
//  GalleryViewProtocols.swift
//  MVPArchitecture
//
//  Created by Hafiz Saad on 27/02/2020.
//  Copyright © 2020 AtTech. All rights reserved.
//

import Foundation

// MARK:- GalleryView - To - Presenter Protocol

protocol GalleryViewToPresenterProtocol {
    var view : PresenterToGalleryViewProtocol? { get set }

    func fetchImages()
    func numberOfImages() -> Int
    func galleryImageDataAt(row:Int) -> GalleryResource
    func didSelectImageAt(row:Int)
    
}

// MARK:- Presenter - To - GalleryView Protocol

protocol PresenterToGalleryViewProtocol {
    
    func imagesDidFetch()
    func showLoader()
    func hideLoader()
    func reloadGalleryTableData()
    func showSelectedImageDetail(detail:GalleryResource)
    
}

extension PresenterToGalleryViewProtocol {
    
    func showLoader(){

    }

    func hideLoader(){

    }
}
