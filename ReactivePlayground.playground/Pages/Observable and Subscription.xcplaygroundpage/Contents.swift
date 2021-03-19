//: [Previous](@previous)

/*:
 ----
 ## `Observable and Subscription`
 What's Observable?
 An observable represents a stream or source of data that can be observed over time for new data events.
 
 ----
 
 What's Subscription?
 Subscriptions are what set everything in motion. When subscribing, observer handlers are needed to be supplied.
 
 ----
 ![observable's Marble](observable.png)
 
 */

import Foundation
import RxSwift

struct Video {
    let title: String
    var like: Int = 0
    var dislike: Int = 0
}

enum VideoError: Error {
    case emptyTitle
}

/// Create `observable`
let attaHalilintar = Observable<Video>.create { observer -> Disposable in
    let videoList = [
        Video(title: "Unboxing iPhone"),
        Video(title: "Unboxing iPad"),
        Video(title: "Unboxing Mac"),
        Video(title: "Video Pamit")
//        Video(title: "")]
]
    
    videoList.forEach { video in
        if video.title == "Video Pamit" {
            observer.on(.next(video))
            observer.on(.completed)
        } else if video.title.isEmpty {
            observer.on(.error(VideoError.emptyTitle))
        } else {
            observer.on(.next(video))
        }
    }
    
//    observer.on(.next(Video(title: "Test")))
    
    return Disposables.create()
}

var disposeBag = DisposeBag()

/// Create `observer`

let edo = attaHalilintar.subscribe(onNext: { video in
    print(">>> Edo Nonton: \(video.title)")
}, onError: { error in
    print(">> Edo Error: \(error.localizedDescription)")
}, onCompleted: {
    print(">>> Edo completed")
}, onDisposed: {
    print(">>> Edo disposed")
})
.disposed(by: disposeBag)

//edo.dispose()

let jlius = attaHalilintar.subscribe(onNext: { videojj in
    print("jlius enggak nonton: \(videojj.title)")
}, onError: { error in
    print("jlius ada error pas noton: \(error.localizedDescription)")
}, onCompleted: {
    print("jlius selesai")
}, onDisposed: {
    print("jlius disposed")
})
.disposed(by: disposeBag)

//jlius.dispose()

//internal final class VCA {
//    var disposeBag = DisposeBag()
//}
