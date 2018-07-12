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
        SiestaLog.Category.enabled = [.network, .observers, .pipeline, .staleness]
        service.configure("**") {
            $0.expirationTime = 20 // 60s * 60m = 1 hour
        }
    }
    
    func getBusStops() -> Resource {
        return service.resource("/stop/list")
        .withParam("regionId", "36")
    }
    
    func busArivalsData(for regionId: String, startBusStopId: String, endBusStopID: String) -> Resource {
        return service.resource("/timearrival/list")
        .withParam("regionId", regionId)
        .withParam("fromStopId", startBusStopId)
        .withParam("toStopId", endBusStopID)
    }
}
