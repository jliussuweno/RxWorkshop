//: [Previous](@previous)
/*:
 ----
 ## `Transformation Operator: Map`
 
 `map` is an operator that will modify each item produced by an observable, then will further emit the transformed values.
 
 The modification is described on the closure of this operator.
 
 ----
 
 ![Map's Marble](map.png)
*/

import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// List of video titles
let titles = Observable<String>.from([
    "Video Lucu",
    "Video Unboxing",
    "Video Mukbang"
])

/// Subscribe process of `titles` observable
let clickbaitTitles = titles.map { videoTitle -> String in
    return "LUAR BIASA! Anda tidak akan percata kalau tidak nonton habis \(videoTitle) ini!"
}

let clickbaitTitleInt = titles.map { videoTitle -> Int in
    if videoTitle == "Video Lucu" {
        return 1
    } else if videoTitle == "Video Unboxing" {
        return 2
    } else {
        return 3
    }
}

//clickbaitTitles.subscribe(onNext: { videoTitle in
//    print(">>> Title yang baru : \(videoTitle)")
//}, onError: { err in
//    print(">>> \(err.localizedDescription)")
//}, onCompleted: {
//    print(">>> Completed")
//}, onDisposed: {
//    print(">>> Disposed")
//}).disposed(by: disposeBag)


clickbaitTitleInt.subscribe(onNext: { videoTitle in
    print(">>> Title yang baru : \(videoTitle)")
}, onError: { err in
    print(">>> \(err.localizedDescription)")
}, onCompleted: {
    print(">>> Completed")
}, onDisposed: {
    print(">>> Disposed")
}).disposed(by: disposeBag)
//: [Next](@next)
