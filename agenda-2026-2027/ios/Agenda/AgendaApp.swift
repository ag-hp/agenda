import SwiftUI
import WebKit

@main
struct AgendaApp: App {
    var body: some Scene {
        WindowGroup {
            AgendaPage()
        }
    }
}

private struct AgendaPage: UIViewRepresentable {
    func makeCoordinator() -> NavigationPolicy {
        NavigationPolicy()
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = false
        webView.scrollView.bounces = false

        guard let page = Bundle.main.url(
            forResource: "index", withExtension: "html", subdirectory: "web"
        ) else {
            assertionFailure("No se incluyó web/index.html en el paquete.")
            return webView
        }

        context.coordinator.page = page
        webView.loadFileURL(page, allowingReadAccessTo: page.deletingLastPathComponent())
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}

    final class NavigationPolicy: NSObject, WKNavigationDelegate {
        var page: URL?

        func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
        ) {
            var destination = navigationAction.request.url.flatMap {
                URLComponents(url: $0, resolvingAgainstBaseURL: false)
            }
            destination?.fragment = nil
            decisionHandler(destination?.url == page && page != nil ? .allow : .cancel)
        }
    }
}
