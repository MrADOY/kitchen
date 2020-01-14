import SwiftUI
import TVUIKit

struct SearchView: UIViewControllerRepresentable {
    
    @Binding var text: String
    func makeUIViewController(context: UIViewControllerRepresentableContext<SearchView>) -> UINavigationController {
        let controller = UISearchController(searchResultsController: context.coordinator)
        controller.searchResultsUpdater = context.coordinator
        controller.searchBar.becomeFirstResponder()
        controller.hidesNavigationBarDuringPresentation = false
        return UINavigationController(rootViewController: UISearchContainerViewController(searchController: controller))
    }


    func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<SearchView>) {
    }

    func makeCoordinator() -> SearchView.Coordinator {
        Coordinator(text: $text)
    }

    typealias UIViewControllerType = UINavigationController

    class Coordinator: UIViewController, UISearchResultsUpdating {

        @Binding var text: String
        
        init(text: Binding<String>){
            _text = text
            super.init(coder : NSCoder.empty())!
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func updateSearchResults(for searchController: UISearchController) {
            text = searchController.searchBar.text ?? ""
        }
    }
}

struct CustomSearchBar: View {
    @State private var text: String = ""
    @State var showSearch = true
    @EnvironmentObject var userData: UserData
    @State var showingProfile: Bool = false
    var body: some View {
        VStack {
            if showSearch {
            SearchView(text : $text)
            } else {
                EmptyView()
            }
            if text != "" && text.count > 3 {
                NavigationView {
                    List {
                        ForEach(self.userData.recetteDataJson.filter { (recette : RecetteJson) -> Bool in
                            return recette.name.lowercased().contains(text.lowercased())
                        }) { recette in
                            Button(action: { self.showingProfile.toggle() }) {
                                CategoryItem(recette: recette)
                            }
                            .background(URLImage(url: recette.picture_url))
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: self.$showingProfile) {
                                RecetteDetail(recette: recette).environmentObject(self.userData)
                            };
                        }
                    }
                }
            } else {
                EmptyView()
                Spacer()
            }
            Spacer()
        }
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension NSCoder {
  class func empty() -> NSCoder {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWith: data)
    archiver.finishEncoding()
    return NSKeyedUnarchiver(forReadingWith: data as Data)
  }
}
