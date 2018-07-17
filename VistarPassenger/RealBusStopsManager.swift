//
//  RealBusStopsManager.swift
//  VistarPassenger
//
//  Created by Всеволод on 16.07.2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import Foundation
import RealmSwift

class RealmBusStopManager  {
    
    
    static public let sharedInstance = RealmBusStopManager()
    
    private func makeBusStop(busStop: BusStop) -> BusStopR {
        let realmBusStop = BusStopR()
        realmBusStop.id = busStop.id!
        realmBusStop.name = busStop.name!
        if let comment = busStop.comment {
            realmBusStop.comment = comment
        } else {realmBusStop.comment = ""}
        realmBusStop.lat = busStop.lat!
        realmBusStop.lon = busStop.lon!
        return realmBusStop
    }
    
    private init () {
        
    }
    
    func writeBusStop(commonBusStops: [BusStop]) {
        DispatchQueue.global(qos: .background).async {
            let realm = try! Realm()
            for i in 0...commonBusStops.count-1{
                if commonBusStops.count > 0 {
                    let busStop = self.makeBusStop(busStop: commonBusStops[i])
                    try! realm.write {
                        realm.add(busStop)
                    }
                }
            }
            let busStopResult = realm.objects(BusStopR.self)
            print(busStopResult)
        }
    }
    
    func getBusStops() ->  Results<BusStopR> {
        let realm = try! Realm()
        let busStpos = realm.objects(BusStopR.self).sorted(byKeyPath: "name")
        return busStpos
    }
    
    
    
}
