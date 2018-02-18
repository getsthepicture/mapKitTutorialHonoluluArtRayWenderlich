//
//  Artwork.swift
//  HonoluluArt
//
//  Created by Laurence Wingo on 2/15/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    //Here you create an MKMapItem from an MKPlacemark.  The Maps app is able to read this MKMapItem, and displays the right thing.
    func mapItem() -> MKMapItem{
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark.init(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem.init(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
