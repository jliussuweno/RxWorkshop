//: [Previous](@previous)
/*:
 ----
 ## `Creation Operators: Just, Of, From`
 
 You could create an observable by using one of these operators.
 The difference between these three:
 - `just` : will only emitting a single value
 - `of` : could emit multiple values of same type, using variadic parameter
 - `from` : similar with `of` but using array
 
 ----
*/

import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// Observable of video titles

/// just
let justObservable = Observable<Int?>.just(nil)

/// of
let ofObservable = Observable<String>.of("Video Mukbang", "Video Jalan2", "Video Pamit")

/// from
let arrayData = ["Video1", "Video2", "Video3"]
let fromObservable = Observable<String>.from(arrayData)

/// Subscribe process of `titles` observable
justObservable.subscribe(onNext: { number in
    print(">>> \(number)")
}, onError: { err in
    print(">>> \(err.localizedDescription)")
}, onCompleted: {
    print(">>> Completed")
}, onDisposed: {
    print(">>> Disposed")
}).disposed(by: disposeBag)


//ofObservable.subscribe(onNext: { videoTitle in
//    print(">>> \(videoTitle)")
//}, onError: { err in
//    print(">>> \(err.localizedDescription)")
//}, onCompleted: {
//    print(">>> Completed")
//}, onDisposed: {
//    print(">>> Disposed")
//}).disposed(by: disposeBag)

//fromObservable.subscribe(onNext: { videoTitle in
//    print(">>> \(videoTitle)")
//}, onError: { err in
//    print(">>> \(err.localizedDescription)")
//}, onCompleted: {
//    print(">>> Completed")
//}, onDisposed: {
//    print(">>> Disposed")
//}).disposed(by: disposeBag)


//: [Next](@next)
