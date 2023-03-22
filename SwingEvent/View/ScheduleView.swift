//
//  DailyView.swift
//  SwingEvent
//
//  Created by jedi on 2023/3/4.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        
        NavigationStack(){
            List {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink() {
                        ScheduleDetail()
                    } label: {
                        ScheduleRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            .navigationBarTitleDisplayMode(.inline)
           
        }
        .overlay(
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<100) { index in
                        ScheduleDate(isSelect: false, weekDay: "1", date: String(index))
                    }
                }
                .padding(.top)
                .offset(x:0,y:-10)
            } , alignment: .top)

    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
            .environmentObject(ModelData())
    }
}
