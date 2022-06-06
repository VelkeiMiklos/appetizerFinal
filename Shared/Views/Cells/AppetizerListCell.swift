//
//  AppetizerListCell.swift
//  AppetizersFinal
//
//  Created by Deim Peter Pal on 2022. 06. 06..
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    
    var body: some View {
        
        HStack(spacing: 5){
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .frame(width: 120, height: 90)
                    .scaledToFit()
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .frame(width: 120, height: 90)
                    .scaledToFit()
                    .cornerRadius(8)
            }

            VStack(alignment: .leading, spacing: 10){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.1f")")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.secondary)
            }
            .padding(.leading)
        }
        
    }
}


struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
