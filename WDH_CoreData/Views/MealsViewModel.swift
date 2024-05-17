//
//  MealsViewModel.swift
//  WDH_CoreData
//
//  Created by Brian Moyou on 17.05.24.
//

import Foundation

@MainActor
class MealsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var meals: [Meal] = []
    @Published var presentSheet: Bool = false
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var calories: Int = 100
    
    // MARK: - Functions
    
    func fetchMeals() {
        do {
            meals = try Repository.shared.fetchMeals()
        } catch {
            print(error)
            // Show UI Error
        }
    }
    
    func addMeal() {
        do {
            try Repository.shared.addMeal(name: name,
                                          description: description,
                                          calories: calories)
            fetchMeals()
        } catch {
            print(error)
            // Show UI Error
        }
    }
    
    func calculate() -> Int {
//        var result = 0
//        meals.forEach { meal in
//            result += meal.calories
//        }
//        return result
        
        return Int(meals.reduce(0) { x, y in
            x + y.calories
        })
    }
}
