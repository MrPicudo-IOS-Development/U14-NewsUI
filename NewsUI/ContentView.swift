/* ContentView.swift --> NewsUI. Created by Miguel Torres on 27/02/23. */

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(posts){
                Text($0.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
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
 
 */
