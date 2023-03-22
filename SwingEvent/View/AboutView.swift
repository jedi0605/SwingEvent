//
//  AboutView.swift
//  SwingEvent
//
//  Created by jedi on 2023/3/4.
//

import SwiftUI


extension Date {
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? Date()
    }
    
}


struct Book: Identifiable {
    let id = UUID()
    let title: String
    let datePublished: Date
}

struct AboutView: View {
    
    @State private var selectedDate: Date = Date()
    @State private var reset: Bool = false
    
    @State private var books = [
        Book(title: "Introduction to JavaScript", datePublished: Date.from(year: 2022, month: 09, day: 10)),
        Book(title: "Mastering Swift", datePublished: Date.from(year: 2022, month: 09, day: 11)),
        Book(title: "Beginning SQL", datePublished: Date.from(year: 2022, month: 09, day: 12)),
        Book(title: "Professional Git", datePublished: Date.from(year: 2022, month: 09, day: 11)),
    ]
    
    @State private var filteredBooks: [Book] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            
            DatePicker("Search by date", selection: $selectedDate, displayedComponents: .date)
            Button("Reset") {
                reset = true
            }
            
            Spacer()
            
            if filteredBooks.isEmpty && !reset  {
                Text("No books found.")
            } else {
                List(reset ? books: filteredBooks) { book in
                    VStack(alignment: .leading) {
                        Text(book.title)
                        Text(book.datePublished, style: .date)
                    }
                }
            }
            
            Spacer()
            
        }.onChange(of: selectedDate) { value in
            reset = false
            // filter out the books
            filteredBooks = books.filter { Calendar.current.compare($0.datePublished, to: selectedDate, toGranularity: .day) == .orderedSame }
            
        }
        .onAppear {
            filteredBooks = books
        }
        .padding()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
