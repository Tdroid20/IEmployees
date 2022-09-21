//
//  DataControl.swift
//  IEmployees
//
//  Created by user226765 on 9/20/22.
//  PoweredBy Skyrus Tdroid
//

import Foundation;
import CoreData;

class UserController: ObservableObject {
    let container = NSPersistentContainer(name: "Employees");
     
     init() {
       
       container.loadPersistentStores{
         descripiton, error in if let error = error {
           print("Error ao carregar os dados \(error)")
         }
       }
     }
    
    func save(context: NSManagedObjectContext) {
           do {
             try context.save();
           } catch {
               let error = error as NSError;
               print("Ero ao tentar salvar os dados no banco de dados \(error)");
           }
       }
    
    func userAdd(name: String, lastName: String, email: String, password: String, context: NSManagedObjectContext) {
        let user = Users(context: context);
        
        user.id = UUID();
        user.name = name;
        user.lastName = lastName;
        user.email = email;
        user.password = password;
        user.createdAt = Date();
        user.updatedAt = Date();
        
        save(context: context)
    }
    
    func editUser(user: Users,name: String, lastName: String, email: String, password: String, context: NSManagedObjectContext) {
        
        user.name = name;
        user.lastName = lastName;
        user.email = email;
        user.password = password;
        user.updatedAt = Date();
        
        save(context: context);
    }
}
