//
//  BusStopModel.swift
//  VistarPassenger
//
//  Created by Всеволод on 05.07.2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import Foundation
import RealmSwift


//Реализуем 2 Decodable структуры, чтобы swift сам распарсил из JSON

struct BusStopsResponce: Decodable {
    var status: String?
    var hash: Int?
    var stops: Dictionary<String, BusStop>?
}

struct BusStop: Decodable {
    var comment: String?
    var id: Int?
    var lat: Double?
    var lon: Double?
    var name: String?
}

class BusStopR: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var comment = ""
    @objc dynamic var lat = 0.0
    @objc dynamic var lon = 0.0
}
