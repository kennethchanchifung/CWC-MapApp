//
//  BusinessList.swift
//  MapApp
//
//  Created by k on 24/11/2022.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                LazyVStack{
                    BusinessSection(title: "Restaurants", businesses: model.restaurants)
                    BusinessSection(title: "Sights", businesses: model.sights)
                }
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
