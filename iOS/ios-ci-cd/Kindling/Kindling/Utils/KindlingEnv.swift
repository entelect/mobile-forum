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
        return .production
    }
}
