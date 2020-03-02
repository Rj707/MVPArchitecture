//
//  GalleryViewController.swift
//  MVPArchitecture
//
//  Created by Hafiz Saad on 27/02/2020.
//  Copyright © 2020 AtTech. All rights reserved.
//

import UIKit
import SDWebImage

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var galleryTableView : UITableView!
    var presenter : GalleryViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryTableView.delegate = self
        galleryTableView.dataSource = self
        galleryTableView.tableFooterView = UIView.init(frame: .zero)
        
        self.presenter?.fetchImages()
        
    }
    
}

extension GalleryViewController:UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfImages() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : GalleryTableViewCell
        let galleryImageData = presenter?.galleryImageDataAt(row: indexPath.row)
        cell = tableView.dequeueReusableCell(withIdentifier: Constants.galleryCellName, for: indexPath) as! GalleryTableViewCell
        cell.galleryImageView.sd_setImage(with: URL.init(string: (galleryImageData?.url)!), placeholderImage: UIImage(named: "Image-Placeholder"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectImageAt(row: indexPath.row)
    }
    
}

extension GalleryViewController: PresenterToGalleryViewProtocol
{
    func hideLoader() {
        self.hideHud()
    }
    
    func showLoader() {
        self.showHud()
    }
    
    
    func imagesDidFetch() {
        
    }
    
    func reloadGalleryTableData()
    {
        galleryTableView.reloadData()
    }
    
    func showSelectedImageDetail(detail: GalleryResource) {
        DispatchQueue.main.async {
            self.showAlert(title: "Below is the creation date for the selected image", message: "Created At: \(detail.createdAt ?? "")")
        }
    }
}

class GalleryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var galleryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
