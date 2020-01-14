//
//  WebServices.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 12/01/2020.
//

import Foundation

class WebService {
static var server: String = "http://recettestnsi.ddns.net/api";

    func postLogin(email: String, password: String, completion: @escaping (Bool) -> ()){
        let keyChainService = KeyChainService()
        guard let url = URL(string: WebService.server + "/user/login")
            else {
                fatalError("url is not valid")
        }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = "{ \"email\" : \"\(email)\", \"password\" : \"\(password)\"}"
        request.httpBody = parameters.data(using: String.Encoding.utf8);
        URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: Any] {
                    if let result = dictionary["success"] as? Bool {
                        if result {
                            print(result)
                            keyChainService.save(dictionary["access_token"] as! String, for: "access_token")
                        }
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    }
                }
            }
            catch let error as NSError {
                print(error)
            }
        }.resume()
    }
    
func getAllRecipes(completion: @escaping ([RecetteJson]) -> ()){
    let keyChainService = KeyChainService()
    guard let url = URL(string : WebService.server + "/recettes")
        else {
            fatalError("url is wrong !!!")
    }
    let request = NSMutableURLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let token = keyChainService.retriveToken(for: "access_token")
    request.setValue("Bearer " + token!, forHTTPHeaderField: "Authorization")
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
    
    func postFavorite(idRecette: Int, completion: @escaping (Bool) -> ()){
        let keyChainService = KeyChainService()
        guard let url = URL(string: WebService.server + "/recettes/favorite")
            else {
                fatalError("url is not valid")
        }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let token = keyChainService.retriveToken(for: "access_token")
        request.setValue("Bearer " + token!, forHTTPHeaderField: "Authorization")
        let parameters = "{ \"id\" : \"\(idRecette)\"}"
        request.httpBody = parameters.data(using: String.Encoding.utf8);
        URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
                if let dictionary = json as? [String: Any] {
                    if let result = dictionary["success"] as? Bool {
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    }
                }
            }
            catch let error as NSError {
                print(error)
            }
        }.resume()
    }
}
