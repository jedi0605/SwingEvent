//
//  ContentView.swift
//  SwingEvent
//
//  Created by jedi on 2023/3/3.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var selection: Tab = .Schedule

    enum Tab {
        case Event
        case Schedule
        case About
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            EventView()
                .tabItem {
                    Label("Event", systemImage: "party.popper")
                }
                .tag(Tab.Event)
            
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
                .tag(Tab.Schedule)
            
            EventListView(events: eventData)
                .tabItem {
                    Label("About", systemImage: "exclamationmark.bubble")
                }
                .tag(Tab.About)
        }
        
    }

}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
