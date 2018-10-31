//
//  Routes.swift
//  TableViewTest
//
//  Created by Emily Thomas on 9/19/18.
//  Copyright © 2018 TS Myers. All rights reserved.
//

import Foundation
import UIKit

struct Route {
    let sortRating : Int?
    let name : String?
    let routeRating : String?
    let routeColor : String?
}


protocol DocumentRouteSerializable {
    init?(dictionary: [String: Any])
}

struct firestoreRoute {
    var routeName: String
    var routeColor: String
    var routeRating: String
    
    var dictionary: [String: Any] {
        return [
            "routeName": routeName,
            "routeColor": routeColor,
            "routeRating": routeRating
        ]
    }
}

extension firestoreRoute: DocumentRouteSerializable{
    init?(dictionary: [String : Any]) {
        guard let routeName = dictionary["routeName"] as? String,
            let routeColor = dictionary["routeColor"] as? String,
            let routeRating = dictionary["routeRating"] as? String else {return nil}
        self.init(routeName: routeName, routeColor: routeColor, routeRating: routeRating)
    }
}
