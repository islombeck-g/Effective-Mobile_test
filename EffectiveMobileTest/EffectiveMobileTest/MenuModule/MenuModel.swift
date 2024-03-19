import Foundation
import SwiftUI

enum MenuPages: Hashable {
    case search
    case detail(vacancy: Vacancy)
}

extension Vacancy: Hashable {
    static func == (lhs: Vacancy, rhs: Vacancy) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct MenuItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let color: Color
    let action: () -> Void
}

struct Welcome: Codable {
    let offers: [Offer]
    let vacancies: [Vacancy]
}

struct Offer: Codable {
    let id: String?
    let title: String
    let link: String
    let button: Button_?
}

struct Button_: Codable {
    let text: String
}

struct Vacancy: Codable, Identifiable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    let isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

struct Address: Codable {
    let town, street, house: String
}

struct Experience: Codable {
    let previewText, text: String
}

struct Salary: Codable {
    let full: String
    let short: String?
}

//MARK: for Dubug
var offer1 = Offer(id: "1", title: "Offer 1", link: "https://example.com/offer1", button: Button_(text: "Apply"))
var offer2 = Offer(id: "2", title: "Offer 2", link: "https://example.com/offer2", button: nil)

var debugOffers = [offer1, offer2]

var address1 = Address(town: "New York", street: "Main Street", house: "123")
var experience1 = Experience(previewText: "2+ years", text: "At least 2 years of experience in a similar role.")
var salary1 = Salary(full: "$60,000 - $80,000 per year", short: nil)

var vacancy1 = Vacancy(id: "1", lookingNumber: 3, title: "Software Engineer", address: address1, company: "ACME Inc.", experience: experience1, publishedDate: "2023-04-01", isFavorite: false, salary: salary1, schedules: ["Full-time"], appliedNumber: 25, description: "We are looking for a talented Software Engineer to join our team.", responsibilities: "Design, develop, and maintain software applications.", questions: ["What is your experience with Swift?", "Can you describe your approach to testing?"])

var address2 = Address(town: "San Francisco", street: "Market Street", house: "456")
var experience2 = Experience(previewText: "5+ years", text: "At least 5 years of experience in a senior role.")
var salary2 = Salary(full: "$90,000 - $120,000 per year", short: "$90k - $120k")

var vacancy2 = Vacancy(id: "2", lookingNumber: 1, title: "Senior Software Architect", address: address2, company: "TechCorp", experience: experience2, publishedDate: "2023-03-15", isFavorite: true, salary: salary2, schedules: ["Full-time", "Remote"], appliedNumber: 10, description: "We are seeking a talented Senior Software Architect to lead our development team.", responsibilities: "Design and implement high-performance, scalable software systems.", questions: ["How would you approach a large-scale system design?", "What are your thoughts on microservices architecture?"])

var debugVacancies = [vacancy1, vacancy2]
