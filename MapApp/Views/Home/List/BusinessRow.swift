//
//  BusinessRow.swift
//  MapApp
//
//  Created by k on 24/11/2022.
//

import SwiftUI

struct BusinessRow: View {
    
    var business: Business
    
    var body: some View {
        VStack{
            HStack{
                // Image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(5)
                    .scaledToFit()
                
                // Name and distance
                VStack(alignment: .leading){
                    Text(business.name ?? "")
                    Text(String(format:"%.1f km away", (business.distance ?? 0.0)/1000))
                        .font(.caption)
                }
                Spacer()
                //Star rating and number of reviews
                VStack{
                    Image("regular_\(business.rating ?? 0.0)")
                    Text("\(business.reviewCount ?? 0) Reviews")
                        .font(.caption)
                }
            }
            DashedDivider()
                .padding(.vertical)
        }.foregroundColor(.black)
    }
}
