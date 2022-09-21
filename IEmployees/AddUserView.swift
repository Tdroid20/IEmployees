//
//  EditUserView.swift
//  IEmployees
//
//  Created by user226765 on 9/20/22.
//

import SwiftUI

struct AddUserView: View {
    
    @Environment(\.dismiss) var dismiss;
    @Environment(\.managedObjectContext) var managedObjectContext;
    
    @State var name: String = "";
    @State var lastName: String = "";
    @State var email: String = "";
    @State var password: String = "";
    @State var confirmPassword: String = "";
    @State var isPasswordInvalid: Bool = false;
    
    var body: some View {
        Form {
            Section {
                VStack {
                    Text("\(Image(systemName: "list.bullet.clipboard")) User info")
                        .bold()
                    HStack {
                        TextField("name", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .foregroundColor(.black)
                            .padding(.bottom)
                            .textContentType(.name)
                        
                        TextField("LastName", text: $lastName)
                            .textFieldStyle(.roundedBorder)
                            .foregroundColor(.black)
                            .padding(.bottom)
                            .textContentType(.givenName)
                        
                    }.padding(.bottom);
                    
                    Text("\(Image(systemName: "mail")) Email")
                        .bold()
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.black)
                        .padding(.bottom)
                        .textContentType(.emailAddress)
                    
                    Text("\(Image(systemName: "key"))Password")
                        .bold()
                    TextField("Your Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.black)
                        .padding(.bottom)
                        .textContentType(.password)
                    TextField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.black)
                        .padding(.bottom)
                        .textContentType(.password)

                    
                    Button("Submit") {
                        if(confirmPassword != password) {
                            isPasswordInvalid = true
                        } else {
                            UserController().userAdd(name: name, lastName: lastName, email: email, password: password, context: managedObjectContext);
                            
                            dismiss()
                        }
                                            
                    }
                    .padding(15)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(width: 100, height: 30)
                    
                }.padding(15)
                
            }
        }
        .alert("❗┃Alert", isPresented: $isPasswordInvalid, actions: {
            Button("Ok") {
                isPasswordInvalid = false;
                password = "";
                confirmPassword = "";
            }
        }, message: {
            Text("As senhas não conferem");
        })
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
