//
//  BusinessSearch.swift
//  MapApp
//
//  Created by k on 23/11/2022.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    
    var center = Coordinate()
}
