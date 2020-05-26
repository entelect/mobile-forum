//: Please build the scheme 'RxSwiftPlayground' first
import RxSwift

// MARK: RxSwift Basics
example(of: "Creating - just operator") {
    Observable.just(pickUpLineA)
        .subscribe {
            print($0)
    }.dispose()
}

//example(of: "Creating - of operator") {
//    Observable.of(pickUpLineA, pickUpLineB, pickUpLineC)
//        .subscribe {
//            print($0)
//    }.dispose()
//}

//example(of: "Creating - of operator (with type of Array)") {
//    Observable.of([pickUpLineA, pickUpLineB, pickUpLineC])
//        .subscribe {
//            print($0)
//    }.dispose()
//}

//example(of: "Creating - from operator (with type of Array)") {
//    Observable.from([pickUpLineA, pickUpLineB, pickUpLineC])
//        .subscribe {
//            print($0)
//    }.dispose()
//}

//example(of: "Subscribe - Basic") {
//    Observable.from([pickUpLineA, pickUpLineB, pickUpLineC])
//        .subscribe {
//            print($0)
//    }.dispose()
//}

//example(of: "Subscribe - OnX Closures") {
//    Observable.from([pickUpLineA, pickUpLineB, pickUpLineC])
//    .subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") }
//    )
//    .dispose()
//}

//example(of: "Empty") {
//    Observable.empty()
//    .subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") }
//    )
//    .dispose()
//}

//example(of: "Never") {
//    Observable.never()
//    .subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") }
//    )
//    .dispose()
//}

//example(of: "Dispose") {
//    Observable.never()
//    .subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") },
//        onDisposed: { print("Disposed") }
//    )
//    .dispose()
//}

//example(of: "Dispose bag") {
//    let disposeBag = DisposeBag()
//
//    Observable.never()
//    .subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") },
//        onDisposed: { print("Disposed") }
//    )
//    .disposed(by: disposeBag)
//}

//example(of: "Observable that errors") {
//    let disposeBag = DisposeBag()
//
//    enum PickUpLineError: Error {
//        case nsfw
//    }
//
//    Observable.create{ observer in
//        observer.onNext(pickUpLineA)
//        observer.onNext(pickUpLineD)
//        observer.onError(PickUpLineError.nsfw)
//        observer.onNext(pickUpLineA)
//
//        return Disposables.create()
//    }
//    .subscribe(
//        onNext: { print($0) },
//        onError: { print("An Error occured: \($0)")}
//    )
//    .disposed(by: disposeBag)
//}

// MARK: RxSwift Subjects

//example(of: "Publish Subject") {
//    let disposeBag = DisposeBag()
//
//    let publishSubject = PublishSubject<String>()
//
//   publishSubject.subscribe(
//            onNext: { print("Subscriber A: \($0)") }
//        )
//        .disposed(by: disposeBag)
//
//    publishSubject.onNext(pickUpLineA)
//
//    publishSubject.subscribe(
//        onNext: { print("Subscriber B: \($0)") }
//    )
//    .disposed(by: disposeBag)
//
//    publishSubject.onNext(pickUpLineB)
//}

//example(of: "Behaviour Subject") {
//    let disposeBag = DisposeBag()
//
//    let behaviorSubject = BehaviorSubject<String>(value: pickUpLineA)
//
//   behaviorSubject.subscribe(
//            onNext: { print("Subscriber A: \($0)") }
//        )
//        .disposed(by: disposeBag)
//
//    behaviorSubject.onNext(pickUpLineB)
//
//    behaviorSubject.subscribe(
//        onNext: { print("Subscriber B: \($0)") }
//    )
//    .disposed(by: disposeBag)
//
//    behaviorSubject.onNext(pickUpLineC)
//}

//example(of: "Replay Subject") {
//    let disposeBag = DisposeBag()
//
//    let replaySubject = ReplaySubject<String>.create(bufferSize: 3) // Change buffer to 2
//
//    replaySubject.onNext(pickUpLineA)
//
//    replaySubject.subscribe(
//            onNext: { print("Subscriber A: \($0)") }
//        )
//        .disposed(by: disposeBag)
//
//    replaySubject.onNext(pickUpLineB)
//    replaySubject.onNext(pickUpLineC)
//
//    replaySubject.subscribe(
//        onNext: { print("Subscriber B: \($0)") }
//    )
//    .disposed(by: disposeBag)
//
//    replaySubject.onNext(pickUpLineD)
//}

// MARK: RxSwift Operators

//example(of: "Operators - Filter") {
//    struct PickUpLine {
//        let line: String
//        let successRating: Int
//    }
//
//    let pickUpLines = [
//        PickUpLine(line: pickUpLineA, successRating: 50),
//        PickUpLine(line: pickUpLineB, successRating: 23),
//        PickUpLine(line: pickUpLineC, successRating: 15),
//        PickUpLine(line: pickUpLineD, successRating: 100)
//    ]
//
//    Observable.from(pickUpLines)
//        .filter { $0.successRating >= 50}
//        .subscribe(
//            onNext: { print($0.line) }
//        )
//        .dispose()
//}

//example(of: "Operators - distinctUntilChanged") {
//    struct PickUpLine {
//        let line: String
//        let successRating: Int
//    }
//
//    let pickUpLines = [
//        PickUpLine(line: pickUpLineA, successRating: 50),
//        PickUpLine(line: pickUpLineA, successRating: 50),
//        PickUpLine(line: pickUpLineB, successRating: 23),
//        PickUpLine(line: pickUpLineC, successRating: 15),
//        PickUpLine(line: pickUpLineD, successRating: 100)
//    ]
//
//    Observable.from(pickUpLines)
//        .distinctUntilChanged {(lineA, lineB) in lineA.line == lineB.line }
//        .subscribe(
//            onNext: { print($0.line) }
//        )
//        .dispose()
//}


//example(of: "Operators - Map") {
//    struct PickUpLine {
//        let line: String
//        let successRating: Int
//    }
//
//    let pickUpLines: [PickUpLine] = [
//        PickUpLine(line: pickUpLineA, successRating: 50),
//        PickUpLine(line: pickUpLineB, successRating: 23),
//        PickUpLine(line: pickUpLineC, successRating: 15),
//        PickUpLine(line: pickUpLineD, successRating: 100)
//    ]
//
//    Observable.from(pickUpLines)
//        .map{ element -> PickUpLine in
//            if element.successRating < 50 {
//                let updatedLine = PickUpLine(
//                    line: element.line, successRating:
//                    element.successRating + 20
//                )
//                return updatedLine
//            }
//
//            return element
//        }
//        .subscribe(
//            onNext: { print("\($0.line): \($0.successRating)") }
//        )
//        .dispose()
//}

//example(of: "Operators - distinctUntilChanged") {
//    struct PickUpLine {
//        let line: String
//        let successRating: Int
//    }
//
//    let pickUpLines = [
//        PickUpLine(line: pickUpLineA, successRating: 50),
//        PickUpLine(line: pickUpLineA, successRating: 50),
//        PickUpLine(line: pickUpLineB, successRating: 23),
//        PickUpLine(line: pickUpLineC, successRating: 15),
//        PickUpLine(line: pickUpLineD, successRating: 100)
//    ]
//
//    Observable.from(pickUpLines)
//        .distinctUntilChanged {(lineA, lineB) in lineA.line == lineB.line }
//        .subscribe(
//            onNext: { print($0.line) }
//        )
//        .dispose()
//}

//example(of: "Operators - Flatmap") {
//
//  let disposeBag = DisposeBag()
//
//    enum MatchStatus {
//        case single
//        case hitched
//        case basicallyMarried
//        case couple
//    }
//
//    struct KindlingUser {
//        let name: String
//        let matchStatus : BehaviorSubject<MatchStatus>
//    }
//
//
//    let bob = KindlingUser(name: "Bob", matchStatus: BehaviorSubject<MatchStatus>(value: .single))
//    let jane = KindlingUser(name: "Jane", matchStatus: BehaviorSubject<MatchStatus>(value: .single))
//
//    let kindlingUsers = PublishSubject<KindlingUser>()
//
//    kindlingUsers
//        .flatMap{ $0.matchStatus }
//        .subscribe(onNext: {
//            print($0)
//        })
//        .disposed(by: disposeBag)
//
//    kindlingUsers.onNext(bob)
////    kindlingUsers.onNext(jane)
////
////    print("Updating Bob's status")
////    bob.matchStatus.onNext(.hitched)
//
////    print("Updating Jane's status")
////    jane.matchStatus.onNext(.basicallyMarried)
////
////    print("Updating Bob's status")
////    bob.matchStatus.onNext(.single)
//
//    // Flat maps are useful for multiple streams of the same type.
//}

//example(of: "Operators - merge") {
//    let observableA = Observable.from([pickUpLineA, pickUpLineB])
//    let observableB = Observable.from([pickUpLineC, pickUpLineD])
//
//
//    Observable.merge(observableA, observableB)
//        .subscribe(
//            onNext: { print($0) }
//        )
//        .dispose()
//}

//example(of: "Operators - zip") {
//    let observableA = Observable.from([pickUpLineA, pickUpLineB])
//    let observableB = Observable.from([pickUpLineC, pickUpLineD])
//
//
//    Observable.zip(observableA, observableB){ (a,b) in
//            "\(a) | \(b)"
//        }
//        .subscribe(
//            onNext: { print($0) }
//        )
//        .dispose()
//}
