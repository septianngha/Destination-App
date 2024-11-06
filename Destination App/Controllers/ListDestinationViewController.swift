//
//  ListDestinationViewController.swift
//  Destination App
//
//  Created by Muhamad Septian Nugraha on 05/11/24.
//

import UIKit

class ListDestinationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var destinationTableView: UITableView!
    
    var places: [Places] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        
        destinationTableView.dataSource = self
        destinationTableView.delegate = self
        
        parsingData()
    }
    
    
    // MARK: - Register for Custom Table Cell
    func registerCell() {
        
        let nib = UINib(nibName: "ListDestinationTableViewCell", bundle: nil)
        destinationTableView.register(nib, forCellReuseIdentifier: "ListCell")
        
        destinationTableView.rowHeight = 126.0
    }
    
    
    // MARK: - Function untuk Parsing Data JSON
    func parsingData() {
        ParsingJson { data in
            self.places = data
            
            DispatchQueue.main.async {
                self.destinationTableView.reloadData()
            }
        }
    }
    

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell( withIdentifier: "ListCell", for: indexPath) as? ListDestinationTableViewCell {
            
            // Menetapkan nilai value untuk setiap cell/item.
            let destinasi = places[indexPath.row]
            cell.titleListValue?.text = destinasi.name
            cell.subtitleListValue?.text = destinasi.address
            
            // Menambahkan image pada data tabel
            if let imageString = destinasi.image {
                let urlImage = URL(string: imageString)!
                cell.imageListValue.downloaded(from: urlImage, contentMode: .scaleToFill)
            } else {
                cell.imageListValue.image = UIImage(named: "ImageDefault")
            }
            
            return cell
            
        } else {
            return UITableViewCell() // Mengembalikan UITableViewCell jika tidak ditemukan.
        }
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: places[indexPath.row])
        
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
