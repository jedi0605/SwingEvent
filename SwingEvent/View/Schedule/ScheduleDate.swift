//
//  ScheduleDate.swift
//  SwingEvent
//
//  Created by jedi on 2023/3/5.
//

import SwiftUI

struct ScheduleDate: View {
    var isSelect : Bool
    var weekDay : String
    var date : String
    
    var body: some View {
        let color = isSelect == true ? Color.blue : Color.green
       
        VStack{
            Text(weekDay)
            Text(date)
        }
        .frame(width: 40, height: 50)
        .background(color)    
    }
}

struct ScheduleDate_Previews: PreviewProvider {
    static var previews: some View {
        
        ScheduleDate(isSelect: false, weekDay: "Sun", date: "1")
    }
}
