//
//  Business.swift
//  MapApp
//
//  Created by k on 23/11/2022.
//

import Foundation

class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var id: String?
    var alias: String?
    var name: String?
    var imagUrl: String?
    var isClosed: Bool?
    var url: String?
    var reviewCount: Int?
    var categories: [Cateogry]?
    var rating: Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var phone: String?
    var displayPhone: String?
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case alias
        case name
        case imagUrl = "image_url"
        case isClosed = "is_closed"
        case url
        case reviewCount = "review_count"
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case displayPhone = "display_phone"
        case distance
    }
    
    func getImageData() {
        
        // Check that image url isn't nil
        guard imagUrl != nil else {
            return
        }
        
        // Download the data for the image
        if let url = URL(string: imagUrl!) {
                        
            // Get a session
            let session = URLSession.shared
            
            // let request = URLRequest(url: url)
            
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    DispatchQueue.main.async{
                        // Set the image data
                        self.imageData = data!
                    }
                }
            }
            
            dataTask.resume()
        }
        
        
    }
    
}

struct Cateogry: Decodable {
    
    var alias: String?
    var title: String?
    
}

struct Coordinate: Decodable {
    
    var latitude: Double?
    var longitude: Double?
    
}

struct Location: Decodable {
    
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zipCode: String?
    var country: String?
    var state: String?
    var displayAddress: [String]?
    
    enum CodingKeys: String, CodingKey {
        case address1
        case address2
        case address3
        case city
        case zipCode = "zip_code"
        case country
        case state
        case displayAddress = "display_address"
    }
    
}
