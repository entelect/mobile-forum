enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case other = "Other"
}

enum DatingPreference: String, CaseIterable {
    case men = "Men"
    case women = "Women"
    case both = "Both"
}

extension DatingPreference {
    
    func isCompatible(withGender gender: Gender) -> Bool {
        if self == .both {
            return true
        }
        if self == .men && gender == .male {
            return true
        }
        if self == .women && gender == .female {
            return true
        }
        return false
    }
}

struct KindlingUser {
    let id: Int
    var username: String
    var emailAddress: String
    var password: String
    var age: Int
    var gender: Gender
    var datingPreference: DatingPreference
    var imageUrl: String
}
