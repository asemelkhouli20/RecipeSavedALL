//
//  viewModel.swift
//  RecipeSaved
//
//  Created by Asem on 08/03/2022.
//

import SwiftUI

class ViewModel : ObservableObject {
    @Published var recipes = [Recipe]()
    
    init(){
        fetch(ser: nil)
    }
    
    func fetch (ser:String?){
        guard let url = URL(string: API_INFO.getApi(search: ser)) else {return}
        print(API_INFO.getApi(search: ser))
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            print(data!)
            if let data = data {
                do{
                    let task = try JSONDecoder().decode(main.self, from: data)
                    print(data)
                    
                    print(task)
                }catch{
                    print("error error")
                }
                
            }
        }.resume()
        
    }
}
