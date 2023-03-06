/* ContentView.swift --> NewsUI. Created by Miguel Torres on 27/02/23. */

import SwiftUI

struct ContentView: View {
    
    // Variable que permite transmitir la información de la clase con el protocolo ObservableObject.
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List(networkManager.posts) { post in
                // Aquí mandamos la url que se va a usar para construir la vista del DetailView.
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                            .foregroundColor(.purple)
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/* Notas de la aplicación:
 
 In every groups can put 10 views if you want to create more than 10 views you should add another group...
 
 Lista simple creada para practicar:
 List {
 Text("Objeto 1")
 Image(systemName: "heart")
 Text("Objeto 2")
 Image(systemName: "pencil")
 Text("Objeto 3")
 Image(systemName: "folder")
 Text("Objeto 4")
 Image(systemName: "paperplane.circle")
 Text("Objeto 5")
 Image(systemName: "tray.circle")
 }
 
 
 // Estructura que adopta el protocolo Identifiable, que requiere forsozamente de un atributo llamado id.
 struct Post: Identifiable {
 let id = UUID() // Le asignamos un identificador único a cada objeto.
 let title: String
 }
 
 // Arreglo de objetos tipo Post
 let posts = [
 Post(title: "Hola"),
 Post(title: "Mundo"),
 Post(title: "desde"),
 Post(title: "SwiftUI")
 ]
 
 
 */
