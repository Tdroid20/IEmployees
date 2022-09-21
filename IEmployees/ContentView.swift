//
//  ContentView.swift
//  IEmployees
//
//  Created by user226765 on 9/20/22.
//

import SwiftUI;
import CoreData;

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext;
    @FetchRequest(sortDescriptors: [SortDescriptor(\.updatedAt, order: .reverse)]) var users: FetchedResults<Users>;
    
    @State var isAddView: Bool = false;
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(users) {
                        user in NavigationLink(destination: AddUserView()) {
                            VStack {
                                Text(user.name ?? "")
                            }
                        }
                        
                    }
                }
            }.navigationTitle("IEmployees")
             .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                isAddView = true
                            }, label: {
                                Label("Add Food", systemImage: "plus.circle")
                            })
                    }
                }.sheet(isPresented: $isAddView) {
                    AddUserView()
                }

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
