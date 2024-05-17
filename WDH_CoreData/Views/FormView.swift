//
//  FormView.swift
//  WDH_CoreData
//
//  Created by Brian Moyou on 17.05.24.
//

import SwiftUI

struct FormView: View {
    @ObservedObject var viewModel: MealsViewModel
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $viewModel.name)
                    .textInputAutocapitalization(.words)
            }
            
            Section("Beschreibung") {
                TextField("Beschreibung", text: $viewModel.description)
            }
            
            Section("Kalorien") {
                VStack {
                    Stepper("Kalorien",
                            value: $viewModel.calories,
                            step: 25)
                    
                    Text("\(viewModel.calories) kCal")
                }
            }
            
            Button("Speichern") {
                viewModel.addMeal()
                
                viewModel.presentSheet = false
            }
        }
    }
}

#Preview {
    FormView(viewModel: MealsViewModel())
}
