//
//  BusStopAPI.swift
//  VistarPassenger
//
//  Created by Всеволод on 05.07.2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import Foundation
import Siesta
private let baseURL = "https://passenger.vistar.su/VPArrivalServer"


class BusStopAPI {
    
    static let sharedInstance = BusStopAPI()
    private let service = Service(baseURL: baseURL, standardTransformers: [.text, .json] )
    
    private init() {
        SiestaLog.Category.enabled = [.network, .observers, .pipeline]
    }
    
    func getBusStops() -> Resource {
        return service.resource("/stoplist")
    }
    
    func busPing() -> Resource {
        return service.resource("/arrivaltimeslist")

    }
}
