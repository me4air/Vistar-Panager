//
//  NetworkLayer.swift
//  VistarPassenger
//
//  Created by Всеволод on 12.07.2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import Foundation
import Siesta

class BusStopsNetworking: ResourceObserver {
    
    private var busStopsResourse: Resource? {
        didSet {
            oldValue?.removeObservers(ownedBy: self)
            busStopsResourse?
                .addObserver(self)
                .loadIfNeeded()
        }
    }
    
    private var cityId: String!{
        didSet{
            busStopsResourse = BusStopAPI.sharedInstance.getBusStops(for: cityId)
        }
    }
    
    init() {
    }
    
    func getBusStops(cityIdent: String) {
        cityId = cityIdent
    }
    
    func resourceChanged(_ resource: Resource, event: ResourceEvent) {
        if let data: BusStopsResponce = resource.typedContent() {
            if UserDefaults.standard.object(forKey: "busHash") != nil {
                if data.hash! != UserDefaults.standard.integer(forKey: "busHash") {
                    UserDefaults.standard.set(data.hash, forKey: "busHash")
                    //REALM IT!
                }
            }   else {
                UserDefaults.standard.set(data.hash, forKey: "busHash")
            }
        }
    }
    
}



