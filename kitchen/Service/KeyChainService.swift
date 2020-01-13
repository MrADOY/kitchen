//
//  KeyChainService.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 11/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//
import Foundation

class KeyChainService {
    
    var server :String = "login"
    
    func save (_ value : String, for key: String){
        let value = value.data(using: String.Encoding.utf8)!
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: value
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { return print("save error in secure chain")}
    }
    
    func delete (for key: String) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: key]
        let status = SecItemDelete(query as CFDictionary)
        if(status == errSecSuccess){
            return true;
        }
        return false ;
    }
    
    func retriveToken(for key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue
        ]
        
        var retriveData: AnyObject? = nil
        let _ = SecItemCopyMatching(query as CFDictionary, &retriveData)
        guard let data = retriveData as? Data else { return nil }
        let token = String(data: data, encoding: String.Encoding.utf8)
       // print(token!)
        return token!
    }
}
