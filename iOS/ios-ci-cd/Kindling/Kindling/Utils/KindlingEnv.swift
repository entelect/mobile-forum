import Foundation

func isDebug() -> Bool {
    #if DEBUG
    return true
    #else
    return false
    #endif
}

enum KindlingEnv {
    case production
    case qa
    case development
    
    static var currentEnv: KindlingEnv {
        if let info = Bundle.main.infoDictionary, let env = info["APP_ENV"] as? String {
            if env == "DEVELOPMENT" {
                return .development
            }
            if env == "QA" {
                return .qa
            }
            if env == "PRODUCTION" {
                return .production
            }
        }
        fatalError("Environment variables aren't set")
    }
}
