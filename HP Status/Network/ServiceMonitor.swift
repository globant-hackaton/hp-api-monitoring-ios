//
//  ServiceMonitor.swift
//  HP Status
//
//  Created by Humberto Quiñonez on 23/02/24.
//

import Foundation

class ServiceMonitor {
    // Función para verificar el estado de un servicio
    func checkServiceStatus(service: ServiceModel, completion: @escaping (String, Bool, Int) -> Void) {
        let serviceURL = APIConstants.urlBase.appendingPathComponent(service.url.lowercased())

        URLSession.shared.dataTask(with: serviceURL) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                let status = response.statusCode
                let isAvailable = (StatusConstants.validStatus).contains(status)
                completion(service.name, isAvailable, status)
            } else {
                completion(service.name, false, 500)
            }
        }.resume()
    }

    // Función para imprimir el estado de cada servicio
    func monitorServices(completion: @escaping ([StatusCellViewModel]) -> Void) {
        var response: [StatusCellViewModel] = []
        let dispatchGroup = DispatchGroup()
        
        for service in APIConstants.services {
            dispatchGroup.enter()
            checkServiceStatus(service: service) { serviceName, isAvailable, status in
                let model = StatusCellViewModel(title: service.url, statusCode: status, statusDescription: isAvailable ? "Activo" : "Inactivo")
                response.append(model)
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(response)
        }
    }
}
