//
//  HomeView.swift
//  MapApp
//
//  Created by k on 23/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness: Business?
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            NavigationView{
                // Determine if we should show list or map
                if !isMapShowing {
                    // Show list
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "location")
                            Text(model.placemark?.locality ?? "")
                            Spacer()
                            Button {
                                self.isMapShowing = true
                            } label: {
                                Text("Switch to map view")
                            }
                        }
                        Divider()
                        ZStack(alignment: .top) {
                            BusinessList()
                            HStack{
                                Spacer()
                                YelpAttribution(link: "https://yelp.com")
                            }
                            .padding(.trailing, -20)
                        }
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    ZStack(alignment: .top){
                        // Show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                // Create a business detail view instance
                                // Pass in the selected business
                                BusinessDetail(business: business)
                            }
                        // Rectangle Overlay
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            HStack{
                                Image(systemName: "location")
                                Text(model.placemark?.locality ?? "")
                                Spacer()
                                Button {
                                    self.isMapShowing = false
                                } label: {
                                    Text("Switch to list view")
                                }
                            }
                            .padding()
                        }
                        .padding()
                    }
                    .navigationBarHidden(true)
                }
            }
        }
        else {
            // Still waiting for data to show spinner
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
