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
    @Published var error=false
    
    private var numberofTry = 3
    
    init(){
        fetch(ser: nil, fillter: nil)
    }
    
    func fetch (ser:String?,fillter:[String]?){
        numberofTry=3
        guard let url = URL(string: API_INFO.getApi(search: ser, fillter: fillter)) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil{
                DispatchQueue.main.async {
                    self.isLoading=false
                    self.error=true
                }
                
            }
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
                    if self.numberofTry != 0{
                        self.fetch(ser: ser, fillter: fillter)
                        self.numberofTry-=1
                    }
                    else{
                        self.isLoading=false
                        self.error=true
                    }
                }
                
            }
        }.resume()
        
    }
}
