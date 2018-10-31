//
//  RouteAPI.swift
//  TableViewTest
//
//  Created by Emily Thomas on 9/19/18.
//  Copyright © 2018 TS Myers. All rights reserved.
//

import Foundation
import Firebase

class RouteAPI {
    
    static var routes : [Route] = []
//        Route(sortRating: 1, name: "Great 1st Route", routeRating: "5.8", routeColor: "red"),
//        Route(sortRating: 11, name: "Awesome 2nd Route", routeRating: "5.12a", routeColor: "green"),
//        Route(sortRating: 3, name: "Pretty Good 3rd Route", routeRating: "5.10a", routeColor: "blue"),
//        Route(sortRating: 4, name: "Easy 4th Route", routeRating: "5.10b", routeColor: "blue"),
//        Route(sortRating: 17, name: "Crazy 5th Route", routeRating: "5.13c", routeColor: "purple"),
//        Route(sortRating: 6, name: "Simple 6th Route", routeRating: "5.10d", routeColor: "purple"),
//        Route(sortRating: 7, name: "Normal 7th Route", routeRating: "5.11a", routeColor: "red"),
//        Route(sortRating: 8, name: "Exhausting 8th Route", routeRating: "5.11b", routeColor: "green"),
//        Route(sortRating: 6, name: "Ultimate 9th Route", routeRating: "5.10d", routeColor: "blue"),
    
    
      static func getRoutes() -> [Route]{
        let db = Firestore.firestore()
        routes.removeAll()
        
        db.collection("routes").getDocuments() { (query, err) in
            if let err = err {
                print("ERROR \(err)")
            } else {
                for document in query!.documents {
                    routes.insert(
                        Route(
                            sortRating: 1,
                            name: document.data()["name"] as? String,
                            routeRating: "5.10a",
                            routeColor: "green"
                        ), at: 0
                    )
                }
            }
        }
        

        return routes
    }
    
    static func addNewRouteData(newSort: Int?, newName: String?, newRouteRating: String?, newRouteColor: String?) {
        routes.append(Route(sortRating: newSort, name: newName, routeRating: newRouteRating, routeColor: newRouteColor))
        print(RouteAPI.routes.count)

    }


}
