//
//  APIModel.swift
//  Destination App
//
//  Created by Muhamad Septian Nugraha on 06/11/24.
//
import UIKit


func ParsingJson(completion: @escaping ([Places]) -> () ) {
    
    // Menambahkan URL dari API
    let urlstring = "https://tourism-api.dicoding.dev/list"
    let url = URL(string: urlstring)
    
    guard url != nil else {
        print("error")
        return
    }
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!) { data, response, error in
        // Checking Errors
        if error == nil, data != nil {
            // Parsing JSON File
            let decoder = JSONDecoder()
            do {
                let ParsingData = try decoder.decode(destinationApi.self, from: data!)
                // Closure Calling
                completion(ParsingData.places)
            } catch {
                print("Parsing error")
            }
        }
    }
    
    dataTask.resume()
}
