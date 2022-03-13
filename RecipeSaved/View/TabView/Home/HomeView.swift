//
//  HomeView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var search = ""
    
    @State private var showFilter=false
    
    @State var fillter=[String]()
    
    @StateObject var viewModel = ViewModel()
    
    @State var not = false
    var body: some View {
        NavigationView{
            ZStack{
                if viewModel.isLoading{
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(2)
                        .tint(Color("primary"))
                }else{
                    if viewModel.error{
                        VStack{
                            Image("connection_error")
                                .resizable()
                                .scaledToFit()
                            Text("Something wrong check your Internet connection")
                                .font(.title3)
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        
                    }else{
                        RecipeList(recipes: viewModel.recipes, isFav: $not)
                            
                    }
                    
                }
                
            }
            .searchable(text: $search)
            .onSubmit(of: .search, {
                viewModel.isLoading=true
                viewModel.recipes=[]
                viewModel.fetch(ser: search, fillter: fillter)
                
            })
            .halfSheet(showSheet: $showFilter, sheetView: {
                FilterView(fillter: $fillter, showFilter: $showFilter)
            }, onEnd: {
                
            })
            .onChange(of: fillter, perform: { newValue in
                if  fillter != [] {
                    viewModel.isLoading=true
                    viewModel.recipes=[]
                    viewModel.fetch(ser: search, fillter: fillter)
                    
                }
            })
            
            
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        viewModel.isLoading=true
                        viewModel.recipes=[]
                        fillter=[String]()
                        search=""
                        viewModel.fetch(ser: nil, fillter: nil)
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showFilter=true
                    } label: {
                        Label("Filter", systemImage: "line.3.horizontal.decrease")
                    }

                    
                }
                
            })
            
            .onAppear(perform: {
                not = false
            })
            .navigationTitle("Recipes")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .navigationViewStyle(.stack)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
