//
//  BusinessSection.swift
//  MapApp
//
//  Created by k on 24/11/2022.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: title)){
            ForEach(businesses) { business in
                BusinessRow(business: business)
                Divider()
            }
        }
    }
}

//struct BusinessSection_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessSection()
//    }
//}
