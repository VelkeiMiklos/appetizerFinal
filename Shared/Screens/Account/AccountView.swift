//
//  AccountView.swift
//  AppetizersFinal
//
//  Created by Deim Peter Pal on 2022. 06. 06..
//

import SwiftUI

struct AccountView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                }
                
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
            .navigationTitle("Account")
        }
    }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
