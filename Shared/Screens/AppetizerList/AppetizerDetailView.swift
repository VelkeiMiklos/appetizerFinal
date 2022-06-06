//
//  AppetizerDetailView.swift
//  AppetizersFinal
//
//  Created by Deim Peter Pal on 2022. 06. 06..
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        ZStack{
            VStack{
                
                AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                    image
                        .resizable()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 325, height: 200)
                } placeholder: {
                    Image("food-placeholder")
                        .resizable()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 325, height: 200)
                }
                
                
                Spacer()
                
                VStack{
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(appetizer.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom, 25)
                
            }
        }
        .frame(width: 325, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowingDetail = false
        }, label: {
            XDismissButton()
        }), alignment: .topTrailing)
    }
    
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
    }
}


struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value) g")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
