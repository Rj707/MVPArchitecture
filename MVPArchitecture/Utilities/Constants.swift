//
//  Constants.swift
//  GalleryImagesUploadSwift
//
//  Created by Jalal Khan on 26/11/2019.
//  Copyright © 2019 Jalal Khan. All rights reserved.
//

import Foundation
import UIKit

struct Constants
{
    static let galleryCellName = "kGalleryTableViewCell"
    static let galleryViewController = "kGalleryViewController"
    
    static let mainStoryBoard = "Main"
    static let cloudinaryAPIKey = "884524953291618"
}

struct URLs
{
    static let k_BASE_URL = "https://api.cloudinary.com/v1_1/\(Constants.cloudinaryAPIKey)/"
}

public enum Endpoints: String
{
    case getImages = "resources/image?next_cursor="
}

