import Foundation
import SwiftUI

final class MenuViewModel: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var currentPage: MenuPages?
    
    @Published var searcVacancyText: String = ""
    @Published var menuItems: [MenuItem] = [
        MenuItem(imageName: "1", title: "Вакансии рядом с вами", color: .blue, action: {
            
        }),
        MenuItem(imageName: "Star", title: "Поднять резюме в поиске", color: .green, action: {
            
        }),
        MenuItem(imageName: "Icon-2", title: "Временная работа и подработка", color: .green, action: {
            
        })
    ]
    
    @Published var offers: [Offer] = []
    @Published var vacancies: [Vacancy] = []
    
    var filteredJobs: [Vacancy] {
        guard !searcVacancyText.isEmpty else { return vacancies}

        return vacancies.filter { job in
            job.company.lowercased().contains(searcVacancyText.lowercased()) ||
            ((job.description?.lowercased().contains(searcVacancyText.lowercased())) != nil)
        }
    }
    
//    init() {
//        self.fetchData()
//    }
//    MARK: For DEBUG
    init() {
        self.offers = debugOffers
        self.vacancies = debugVacancies
        
    }
    private func fetchData() {
        guard let url = URL(string: "https://api-endpoint.com/data") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Server responded with an error")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let welcome = try JSONDecoder().decode(Welcome.self, from: data)
                DispatchQueue.main.async {
                    self.offers = welcome.offers
                    self.vacancies = welcome.vacancies
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
//    MARK: Menu coordinator module
    @ViewBuilder
    func getPage(for route: MenuPages) -> some View {
        switch route {
        case .search:
            MenuMainScreen()
        case .detail(vacancy: let vacancy):
            DetailVacancyView(vacancy: vacancy)
        }
    }
    func navigateTo(_ appRoute: MenuPages) {
        currentPage = appRoute
        path.append(appRoute)
    }
    func navigateBack() {
        path.removeLast()
    }
}
