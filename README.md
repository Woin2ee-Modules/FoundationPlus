# FoundationPlus

A Extensions of Foundation framework in Swift.

## Supports

### `Sequence`

- **asyncForEach(_:)**

### `Task`

- **init(priority:operation:catch:)** : _(Available when `Failure` is `Never`.)_

### `Collection`

- **hasElements**
- **closest(with:)** : _(Available when `Element` is `Comparable & SignedNumeric`.)_

### `Array`

- **index(of:)** : Returns the index corresponding to the given enum value in the `AllCases`. _(Available when `Element` conforms to `CaseIterable & Equatable`.)_
- **init?<Tuple>(_ tuple: Tuple)**

## Requirements
- Swift 5.9
