//
//  HomeViewModel.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 27.12.2021.
//

import SwiftUI
import Combine
class HomeViewModel:ObservableObject{
    // combine mode to onitor search field and if user leaver for 5 secs then starts searching to avoid memory issue
    
    @Published var eventType: EventType = .IT
    @Published var searchedEvents: [Event]?
    // Sample Events...
    @Published var events: [Event] = [
        
        Event(type: .IT, title: "The Apple Ecosystem", subtitle: "discussion", date: "15.12.2021",eventImage: "appleEcosystem", place: 10),
        Event(type: .IT, title: "C++ Basics with Dana", subtitle: "Q & A", date: "18.12.2021", eventImage: "cpp", place: 15),
        Event(type: .DigitalArt, title: "Adobe Premiere Pro", subtitle: "master class", date: "19.12.2021", eventImage: "app", place: 18),
        Event(type: .Nature, title: "Plant an apple tree ", subtitle: "discussion", date: "13.12.2021", eventImage: "apple_tree", place: 32),
        Event(type: .DigitalArt, title: "Interrior", subtitle: "", date: "23.11.2021", eventImage: "inter", place: 20),
        Event(type: .Nature, title: "Beekpeeking", subtitle: "discussion", date: "12.12.2021", eventImage: "bee", place: 60),
        Event(type: .Anteiku, title: "Tokyo Ghoul", subtitle: "Q & A", date: "13.12.2021", eventImage: "ai", place: 15),
        Event(type: .Anteiku, title: "Attack on Titan", subtitle: "discussion", date: "15.12.2021", eventImage: "att", place: 19),
        Event(type: .IT, title: "Flutter Way", subtitle: "discussion", date: "16.12.2021", eventImage: "f", place: 20),
        Event(type: .IT, title: "Internship, Chocofamily", subtitle: "consultation", date: "17.12.2021", eventImage: "cf", place: 16),
        Event(type: .IT, title: "DataArt", subtitle: "Q & A", date: "18.12.2021", eventImage: "dataArt", place: 30),
        Event(type: .DigitalArt, title: "Illustration art", subtitle: "discussion", date: "19.12.2021", eventImage: "illustration", place: 23),
        Event(type: .DigitalArt, title: "Dribble", subtitle: "Q & A", date: "20.12.2021", eventImage: "dribble", place: 24),
        
    ]
    
    @Published var filteredEvents : [Event] = []
    @Published var showMoreEventsOnType : Bool = false
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    
    var searchCancellable: AnyCancellable?
    init(){
        filterEventsByType()
        searchCancellable = $searchText.removeDuplicates().debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: {str in
                if str != ""{
                    self.filterEventsBySearch()
                }
                else{
                    self.searchedEvents = nil
                }
                
            })
    }
    func filterEventsByType(){
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.events
                .lazy
                .filter{ event in
                    return event.type == self.eventType
                    
                }
                .prefix(10)
            DispatchQueue.main.async{
                self.filteredEvents = results.compactMap({event in
                    return event})
            }
        }
    }
    func filterEventsBySearch(){
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.events
                .lazy
                .filter{ event in
                    return event.title.lowercased().contains(self.searchText.lowercased())
                    
                }
                .prefix(10)
            DispatchQueue.main.async{
                self.searchedEvents = results.compactMap({event in
                    return event})
            }
        }
    }
    
    
}
