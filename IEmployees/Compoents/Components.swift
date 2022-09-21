//
//  Components.swift
//  IEmployees
//
//  Created by user226765 on 9/21/22.
//

import SwiftUI

struct Title: View {
    var body: some View {
        HStack {
            Text("I")
                .foregroundColor(.blue)
                .font(.system(size: 43, weight: .bold))
                +
            Text("Employees")
                .foregroundColor(.orange)
                .font(.system(size: 43, weight: .bold))
        }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
