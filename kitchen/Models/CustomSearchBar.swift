import SwiftUI
import TVUIKit

struct SearchView: UIViewControllerRepresentable {

    func makeUIViewController(context: UIViewControllerRepresentableContext<SearchView>) -> UINavigationController {
        let controller = UISearchController(searchResultsController: context.coordinator)
        controller.searchResultsUpdater = context.coordinator
        return UINavigationController(rootViewController: UISearchContainerViewController(searchController: controller))
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<SearchView>) {
    }

    func makeCoordinator() -> SearchView.Coordinator {
        Coordinator()
    }

    typealias UIViewControllerType = UINavigationController

    class Coordinator: UIViewController, UISearchResultsUpdating {
        func updateSearchResults(for searchController: UISearchController) {
            // do here what's needed
        }
    }
}

struct CustomSearchBar: View {
    @State private var text: String = ""
    var body: some View {
        VStack {
            SearchView()
            Spacer()
        }
    }
}
