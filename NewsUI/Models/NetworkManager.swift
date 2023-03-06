/* NetworkManager.swift --> NewsUI. Created by Miguel Torres on 05/03/23. */

import Foundation

class NetworkManager: ObservableObject {
    
    // Usamos los parentesis para llamar al constructor al crear el arreglo de objetos. (Al parecer en variables si es necesario, en constantes no, o tal vez es dependiendo de si es una estructura o una clase.)
    @Published var posts = [Post]() // El @Publised es para indicar que esta es la variable que queremos compartir del protocolo ObservableObject.
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // Usamos el DispatchQueue para que no se congele la interfaz en lo que se obtienen los datos de la API.
                            DispatchQueue.main.async {
                                self.posts = results.hits // Siempre que usemos un atributo de la clase dentro de un closure, debemos usar la palabra reservada self.
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
