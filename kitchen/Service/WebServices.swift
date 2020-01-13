//
//  WebServices.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 12/01/2020.
//

import Foundation

class WebService {
static var server: String = "http://recettestnsi.ddns.net/api/recettes";

func getAllRecipes(completion: @escaping ([RecetteJson]) -> ()){
    guard let url = URL(string : WebService.server)
        else {
            fatalError("url is wrong !!!")
    }
    let request = NSMutableURLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    URLSession.shared.dataTask(with: request as URLRequest) {
        data, response, error in
        do {
            let json = try JSONSerialization.jsonObject(with: data!)
            let dictionary = json
                let jsonData = try JSONSerialization.data(withJSONObject: dictionary)
                let decoder = JSONDecoder()
                let recettes = try! decoder.decode([RecetteJson].self,  from: jsonData)
                DispatchQueue.main.async {
                    completion(recettes)
                }
            
            
        } catch let error as NSError {
            print(error)
        }
        
    }.resume()
}
}
