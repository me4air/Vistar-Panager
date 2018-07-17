//
//  SearchTableViewModel.swift
//  VistarPassenger
//
//  Created by Всеволод on 16.07.2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import Foundation
import RealmSwift


class SearchTableViewViewModel {
    
    init() {
    }
    
    func getNumberOfRows() -> Int {
        let busStops = RealmBusStopManager.sharedInstance.getBusStops()
        return busStops.count
    }
    
    func getCellForIndexPath(indexPath: IndexPath) -> BusStopTableViewCell{
        let busStops = RealmBusStopManager.sharedInstance.getBusStops()
        let cell = BusStopTableViewCell()
        cell.busStopName.text = busStops[indexPath.row].name
        cell.busStopDescription.text = busStops[indexPath.row].comment
        return cell
    }
}
