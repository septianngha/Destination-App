//
//  DetailViewController.swift
//  Destination App
//
//  Created by Muhamad Septian Nugraha on 06/11/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var deskripsiDetail: UILabel!
    @IBOutlet weak var alamatDetail: UILabel!
    @IBOutlet weak var longitudeDetail: UILabel!
    @IBOutlet weak var latitudeDetail: UILabel!
    @IBOutlet weak var likesDetail: UILabel!
    
    // Membuat object untuk menampung data api
    var detailPlaces: Places? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        setValueData()
    }

    
    // MARK: - Membuat function untuk set value pada object
    func setValueData() {
        
        if let result = detailPlaces {
            
            // Menambahkan value pada tampilan detail
            titleDetail.text = result.name
            deskripsiDetail.text = result.description
            alamatDetail.text = result.address
            longitudeDetail.text = "Longitude : \(result.longitude ?? 0.0)"
            latitudeDetail.text = "Latitude : \(result.latitude ?? 0.0)"
            likesDetail.text = "\(result.like ?? 0) Likes"
            
            // Menambahkan image pada data detail
            if let imageString = result.image {
                let urlImage = URL(string: imageString)!
                imageDetail.downloaded(from: urlImage, contentMode: .scaleToFill)
            } else {
                imageDetail.image = UIImage(named: "ImageDefault")
            }
        }
    }

}
