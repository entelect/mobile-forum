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
