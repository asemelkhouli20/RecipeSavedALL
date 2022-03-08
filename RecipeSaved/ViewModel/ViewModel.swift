//
//  viewModel.swift
//  RecipeSaved
//
//  Created by Asem on 08/03/2022.
//

import SwiftUI

class ViewModel : ObservableObject {
    @Published var recipes = [Recipe]()
    @Published var isLoading = true
    
    init(){
        fetch(ser: nil)
        fetch(ser: nil)
    }
    
    func fetch (ser:String?){
        guard let url = URL(string: API_INFO.getApi(search: ser)) else {return}
        print(API_INFO.getApi(search: ser))
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let data = data {
                do{
                    let task = try JSONDecoder().decode(main.self, from: data)
                    for item in task.hits {
                        DispatchQueue.main.async {
                            self.recipes.append(item.recipe)
                        }
                    }
                    DispatchQueue.main.async {
                        self.isLoading=false

                    }
                }catch{
                    print("error error")
                }
                
            }
        }.resume()
        
    }
}
