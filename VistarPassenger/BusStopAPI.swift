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
    private let service = Service(baseURL: baseURL, standardTransformers: [.text] )
    
    private init() {
        SiestaLog.Category.enabled = [.network, .observers, .pipeline, .staleness]
        service.configure("**") {
            $0.expirationTime = 20 // 60s * 60m = 1 hour
        }
        
        let jsonDecoder = JSONDecoder()
        service.configureTransformer("/stop/list") {
        try jsonDecoder.decode(BusStopsResponce.self, from: $0.content)
        }
    }
    
    func getBusStops(for RegionID: String) -> Resource {
        return service.resource("/stop/list")
        .withParam("regionId", RegionID)
    }
    
    func busArivalsData(for regionId: String, startBusStopId: String, endBusStopID: String) -> Resource {
        return service.resource("/timearrival/list")
        .withParam("regionId", regionId)
        .withParam("fromStopId", startBusStopId)
        .withParam("toStopId", endBusStopID)
    }
}
