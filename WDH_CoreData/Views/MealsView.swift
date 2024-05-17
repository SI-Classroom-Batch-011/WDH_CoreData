//
//  MealsView.swift
//  WDH_CoreData
//
//  Created by Brian Moyou on 17.05.24.
//

import SwiftUI

struct MealsView: View {
    @StateObject private var viewModel: MealsViewModel = .init()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.meals) { meal in
                    HStack {
                        Text(meal.name ?? "")
                        
                        Spacer()
                        
                        Text("\(meal.calories)")
                    }
                    .onTapGesture {
                        viewModel.presentSheet = true
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus")
                        .onTapGesture {
                            viewModel.presentSheet = true
                        }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("\(viewModel.calculate()) kCal")
                        .bold()
                        .font(.title)
                }
            }
            .sheet(isPresented: $viewModel.presentSheet) {
               FormView(viewModel: viewModel)
            }
            .onAppear {
                viewModel.fetchMeals()
            }
        }
    }
}

#Preview {
    MealsView()
}
