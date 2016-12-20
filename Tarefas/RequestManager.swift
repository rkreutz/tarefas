//
//  RequestManager.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import Foundation
import Alamofire

struct RequestManager {
    
    static func updatePlaces(completion: @escaping ((_ list: [String]?, _ errorMsg: String?) -> Void)) {
        let url = ProjectConfiguration.serverHost.stringByAppendingPathComponent(pathComponent: "tarefa")
        print("URL de serviço RESTful: \(url)")
        
        Alamofire.request(url).responseJSON { response in
            var list: [String]?
            var errorMsg: String?
            
            print("Resposta do serviço:")
            debugPrint(response)
            
            // Checks for any errors and the data that was fetched
            switch response.result {
            case .failure(let err):
                errorMsg = err.localizedDescription
            case .success(let result):
                guard let result = result as? [String: Any], let jsonList = result["lista"] as? [String] else {
                    errorMsg = "Alguma coisa deu errado ao tentar carregar lista de tarefas."
                    break
                }
                list = jsonList
            }
            
            // After the webservice is finished we can call the completion handler
            completion(list, errorMsg)
        }
    }
    
}
