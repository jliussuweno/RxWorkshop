//: [Previous](@previous)
/*:
 ----
 ## `Combination Operator: Merge`
 
 `merge` is a reactive operator to combine several observables of the same type so they act like a single observable.
 
 ----
 
 ![Merge's Marble](merge.png)
*/

import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// Observable of videos uploaded by Atta
let atta = Observable.of("video atta 1", "video atta 2")

/// Observable of videos uploaded by Kekeyi
let kekeyi = Observable.of("video kekeyi 1")
let deddy = Observable.of("video deddy 1")
        
/// `Merge` the two observables and subscribe to the result

let combinedYoutuber = Observable.merge(atta, kekeyi, deddy)

combinedYoutuber.subscribe(onNext: { video in
    print(">>> Tokopedia Publish : \(video)")
}).disposed(by: disposeBag)

//: [Next](@next)
