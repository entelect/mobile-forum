//: Please build the scheme 'RxSwiftPlayground' first
import RxSwift

example(of: "manual dispose") {
    let subscriber = Observable<Void>.never()
        .subscribe(
            onNext: { print($0) },
            onCompleted: { print("Completed") },
            onDisposed: { print("Disposed") }
        )
    
    subscriber.dispose()
}

example(of: "disposeBag") {
  let disposeBag = DisposeBag()

  Observable<Void>.never()
      .subscribe(
          onNext: { print($0) },
          onCompleted: { print("Completed") },
          onDisposed: { print("Disposed") }
      )
      .disposed(by: disposeBag)
}

example(of: "Subcribing to observable with errors") {
    let disposeBag = DisposeBag()

    enum PickUpLineError: Error {
        case nsfw
    }

    Observable<String>.create { observer -> Disposable in
            observer.onNext(pickUpLineA)
            observer.onNext(pickUpLineB)
            observer.onError(PickUpLineError.nsfw)

            return Disposables.create()
        }.subscribe(
            onNext: { element in
                print(element)
            },
            onError: { error in
                print("An Error occured: \(error)")
            }
        )
        .disposed(by: disposeBag)
}

example(of: "Filter") {
  
    Observable.of(1,2,2,1)
        .filter(<#T##predicate: (Int) throws -> Bool##(Int) throws -> Bool#>)
        .subscribe (onNext: { element in
            print(element)
        }).dispose()
}

example(of: "Flatmap") {
  
  let disposeBag = DisposeBag()
    
    enum MatchStatus {
        case single
        case hitched
        case basicallyMarried
        case couple
    }
    
    struct KindlingUser {
        let name: String
        let matchStatus : BehaviorSubject<MatchStatus>
    }
  
    
    let bob = KindlingUser(name: "Bob", matchStatus: BehaviorSubject<MatchStatus>(value: .single))
    let jane = KindlingUser(name: "Jane", matchStatus: BehaviorSubject<MatchStatus>(value: .single))
    
    let kindlingUsers = PublishSubject<KindlingUser>()
    
    kindlingUsers
        .flatMap{ $0.matchStatus }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    //kindlingUsers.onNext(bob)
    
    //bob.matchStatus.onNext(.hitched)
    
    //kindlingUsers.onNext(jane)
    
    //jane.matchStatus.onNext(.basicallyMarried)
}


