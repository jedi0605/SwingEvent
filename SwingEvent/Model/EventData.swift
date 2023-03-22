//
//  EventData.swift
//  SwingEvent
//
//  Created by jedi on 2023/3/21.
//

import Foundation

let eventData = [
    Event(name: "Music Festival", date: Locale.current.calendar.startOfDay(for: Date()) , description: "A weekend of music and fun!", time: Date(), venue: Venue(name: "Central Park", address: "New York"),
          imageURL: "https://example.com/image1.jpg"),
    
    Event(name: "Food Festival", date: Date().addingTimeInterval(86400), description: "Sample the best food from around the world.", time: Date(), venue: Venue(name: "Bryant Park", address: "New York"), imageURL: "https://example.com/image2.jpg"),
    
    Event(name: "Art Exhibition", date: Date().addingTimeInterval(172800), description: "See some of the finest art from local artists.", time: Date(), venue: Venue(name: "Metropolitan Museum of Art", address: "New York"), imageURL: "https://example.com/image3.jpg"),
    
    Event(name: "Sports Tournament", date: Date().addingTimeInterval(259200), description: "Watch some of the best athletes compete.", time: Date(), venue: Venue(name: "Madison Square Garden", address: "New York"), imageURL: "https://example.com/image4.jpg"),
    
    Event(name: "Film Festival", date: Date().addingTimeInterval(345600), description: "Watch the latest and greatest films.", time: Date(), venue: Venue(name: "Lincoln Center", address: "New York"), imageURL: "https://example.com/image5.jpg")
]

struct Event: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
    let description: String
    let time: Date
    let venue: Venue
    let imageURL: String
}

struct Venue {
    let name: String
    let address: String
}
