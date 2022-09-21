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
                VStack(alignment: .leading) {
                    Title()
                }
                List {
                    ForEach(users) {
                        user in NavigationLink(destination: EditUserView(user: user, name: user.name!, lastName: user.lastName!, email: user.email!, password: "", confirmPassword: "")) {
                            VStack {
                                Text("\(user.name ?? "") \(user.lastName ?? "")")
                            }
                        }
                    }.onDelete(perform: deleteUser)
                }
            }
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
    func deleteUser(offSet: IndexSet) {
        withAnimation {
            offSet.map{ users[$0] }.forEach(managedObjectContext.delete)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
