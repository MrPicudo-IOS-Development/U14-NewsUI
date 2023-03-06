/* WebView.swift --> NewsUI. Created by Miguel Torres on 05/03/23. */

import Foundation
import WebKit
import SwiftUI // Necesario para que se identifique el Typealias "Context" y el protocolo UIViewRepresentable.

/* A wrapper for a UIKit view that you use to integrate that view into your SwiftUI view hierarchy. */
/// Estructura reutilizable para poder crear una vista web en cualquier aplicación en SwiftUI que queramos. Solamente tenemos que mandarla a llamar en donde queremos que se muestre con: WebView(urlString: url)
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    // Crea una vista de tipo "WKWebView", que será transformada en uan vista de tipo "WebView" de SwiftUI gracias a nuestra estructura que creamos.
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    // El parámetro uiView que tiene que ser del mismo tipo de vista que retornamos en el método makeUIView.
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let safeURL = URL(string: safeString) {
                let request = URLRequest(url: safeURL)
                uiView.load(request)
            }
        }
    }
}
