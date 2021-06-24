//
//  ServiceDefinitions.swift
//  ItemSearchMELI
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

enum ServiceDefinitions {
    private static var baseURL = "https://api.mercadolibre.com/"
    
    static func search(site: String, name: String) -> String {
        return String(format: "%@sites/%@/search?q=%@", baseURL, site, name)
    }
    
    static func item(id: String) -> String {
        return String(format: "items?ids=%@", baseURL, id)
    }
}
