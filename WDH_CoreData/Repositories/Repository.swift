//
//  Repository.swift
//  WDH_CoreData
//
//  Created by Brian Moyou on 17.05.24.
//

import CoreData

struct Repository {
    // Shared Instance
    static let shared = Repository()
    
    private let store = PersistentStore()
    
    private init() {}
    
    // MARK: - Functions
    
    func fetchMeals() throws -> [Meal] {
        let request = Meal.fetchRequest()
        return try store.context.fetch(request)
    }
    
    func addMeal(name: String, description: String, calories: Int) throws {
        let meal = Meal(context: store.context)
        meal.id = UUID().uuidString
        meal.name = name
        meal.descriptionCD = description
        meal.calories = Int16(calories)
        
        try store.save()
    }
}
