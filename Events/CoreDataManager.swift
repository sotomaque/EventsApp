//
//  CoreDataManager.swift
//  Events
//
//  Created by Enrique Sotomayor on 9/27/21.
//
import CoreData
import UIKit

final class CoreDataManager {
    
    private let container: NSPersistentContainer
    private let containerName: String = "Events"
    private let entityName: String = "Event"
    
    var moc: NSManagedObjectContext {
        container.viewContext
    }
    
    @Published var savedEntities: [Event] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
        }
    }
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        save()
    }
    
    private func save() {
        do {
            try moc.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let request = NSFetchRequest<Event>(entityName: entityName)
            let events = try moc.fetch(request)
            return events
        } catch let error {
            print("Error fetching events \(error.localizedDescription)")
            return []
        }
    }
}
