//
//  ViewController.swift
//  Destination App
//
//  Created by Muhamad Septian Nugraha on 05/11/24.
//

import UIKit

class RecommendationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var recommendTableView: UITableView!
    
    var places: [Places] = []
    var randomPlaces: [Places] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        parsingData()
        
        recommendTableView.dataSource = self
        recommendTableView.delegate = self
    }
    
    
    // MARK: - Register for Custom Table Cell
    func registerCell() {
        
        let nib = UINib(nibName: "RecommendationTableViewCell", bundle: nil)
        recommendTableView.register(nib, forCellReuseIdentifier: "RecommendCell")
        
        recommendTableView.rowHeight = 212.0
    }
    
    
    // MARK: - Function untuk melakukan random data yang ditampilkan
    func randomData() {
        let limitedPlaces = Array(places.prefix(12))
        randomPlaces = Array(limitedPlaces.shuffled().prefix(3))
    }
    
    
    // MARK: - Function untuk Parsing Data JSON
    func parsingData() {
        ParsingJson { data in
            self.places = data
            
            DispatchQueue.main.async {
                self.randomData()
                self.recommendTableView.reloadData()
            }
        }
    }
    

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell( withIdentifier: "RecommendCell", for: indexPath) as? RecommendationTableViewCell {
            
            // Menetapkan nilai value untuk setiap cell/item.
            let destinasi = randomPlaces[indexPath.row]
            cell.titleLabel.text = destinasi.name
            
            // Menambahkan image pada data tabel
            if let imageString = destinasi.image {
                let urlImage = URL(string: imageString)!
                cell.imageViewValue.downloaded(from: urlImage, contentMode: .scaleToFill)
            } else {
                cell.imageViewValue.image = UIImage(named: "ImageDefault")
            }
            
            return cell
            
        } else {
            return UITableViewCell() // Mengembalikan UITableViewCell jika tidak ditemukan.
        }
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: randomPlaces[indexPath.row])
        
        // Mengatur agar hover bisa dianimasikan
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
          if let detailViewController = segue.destination as? DetailViewController {
              detailViewController.detailPlaces = sender as? Places
          }
        }
      }

}

