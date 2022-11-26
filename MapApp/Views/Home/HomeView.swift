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
    
    var body: some View {
        
        if model.restaurants.count != 0 ||
            model.sights.count != 0 {
            NavigationView{
                // Determine if we should show list or map
                if !isMapShowing {
                    // Show list
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button {
                                self.isMapShowing = true
                            } label: {
                                Text("Switch to map view")
                            }

                        }
                        Divider()
                        BusinessList()
                        Text("HomeView")
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    // Show map
                    BusinessMap()
                        .ignoresSafeArea()
                    // .navigationBarHidden(true)
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
