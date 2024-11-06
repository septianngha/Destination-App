//
//  Places.swift
//  Destination App
//
//  Created by Muhamad Septian Nugraha on 06/11/24.
//

import UIKit

struct destinationApi: Decodable {
    var message: String
    var count: Int
    var places: [Places]
}

struct Places: Decodable {
    var id: Int?
    var name: String?
    var image: String?
    var description: String?
    var address: String?
    var longitude: Double?
    var latitude: Double?
    var like: Int?
}
