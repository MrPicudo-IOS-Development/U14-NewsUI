/* PostData.swift --> NewsUI. Created by Miguel Torres on 05/03/23. */

import Foundation

struct Results: Decodable {
    // Arreglo de objetos tipo Post
    let hits: [Post]
}

// Estructura para crear objetos de tipo Post
struct Post: Decodable, Identifiable {
    // Variable computable
    var id: String {
        return objectID
    }
    // Atributos normales
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
