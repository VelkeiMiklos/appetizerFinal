//
//  AppetizerListView.swift
//  AppetizersFinal
//
//  Created by Deim Peter Pal on 2022. 06. 06..
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()

    var body: some View {
        ZStack {
            VStack{
                NavigationView {
                    List(viewModel.appetizers) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                            .onTapGesture {
                                viewModel.isShowingDetail = true
                                viewModel.selectedAppetizer = appetizer
                            }
                    }
                    .navigationTitle("Appetizers")
                    .disabled(viewModel.isShowingDetail)

                }
            }
            .blur(radius: viewModel.isShowingDetail ? 20: 0)
            .onAppear {
                viewModel.getAppetizers()
            }
                        
            if viewModel.isLoading{
                LoadingView()
            }
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
            }
                
        }

        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
    
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

