//
//  ScheduleRow.swift
//  SwingEvent
//
//  Created by jedi on 2023/3/4.
//

import SwiftUI

struct ScheduleRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 60,height: 60)
            VStack(alignment: .leading, spacing: 0){
                Text(landmark.name)
                Text("Event discriptoin")
                Text("test location")
            }
            //.padding(5)
            // .frame(width: 260,height:60)
            
            Spacer()
            
            VStack(alignment:.center){
                // Image(systemName: "alarm")
                Text("20:20")
                Text("|")
                Text("22:00")
            }.padding(5)
            .frame(width: 60,height:60)
            
            
//            if landmark.isFavorite {
//                Image(systemName: "star.fill")
//                    .foregroundColor(.yellow)
//            }
        }
    }
}

struct ScheduleRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        ScheduleRow(landmark:landmarks[1])
    }
}
