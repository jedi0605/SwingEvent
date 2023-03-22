import SwiftUI

struct EventListView: View {
    let events: [Event]
    @State private var selectedCategoryIndex = 0
    @State private var selectedDate = Date()
    
    var filteredEvents: [Event] {
        // Filter
        print(selectedDate)
        return events.filter {
            // Calendar.current.isDate($0.date, equalTo: selectedDate, toGranularity: .day)
            $0.date >= selectedDate
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Coming Events", selection: $selectedDate, displayedComponents: .date)
                // .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .accentColor(.blue)
                
                List(filteredEvents.prefix(10)) { event in
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: event.imageURL)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(height: 200)
                        Text(event.name)
                            .font(.headline)
                        Text(event.date, style: .date)
                            .font(.subheadline)
                        Text(event.time, style: .time)
                            .font(.subheadline)
                        Text("\(event.venue.name), \(event.venue.address)")
                            .font(.subheadline)
                    }
                }
            }
            //.navigationTitle("Events")
        }
    }
}


struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView(events: eventData)
    }
}
