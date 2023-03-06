/* DetailView.swift --> NewsUI. Created by Miguel Torres on 05/03/23. */

import SwiftUI

struct DetailView: View {
    // Creamos una variable que necesita ser inicializada para mostrar la página web.
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
