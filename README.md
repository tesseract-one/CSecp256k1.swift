# CSecp256k1.swift

![🐧 linux: ready](https://img.shields.io/badge/%F0%9F%90%A7%20linux-ready-red.svg)
[![GitHub license](https://img.shields.io/badge/license-Apache%202.0-lightgrey.svg)](LICENSE)
[![Build Status](https://github.com/tesseract-one/CSecp256k1.swift/workflows/Build%20&%20Tests/badge.svg?branch=main)](https://github.com/tesseract-one/CSecp256k1.swift/actions/workflows/build.yml?query=branch%3Amain)
[![GitHub release](https://img.shields.io/github/release/tesseract-one/CSecp256k1.swift.svg)](https://github.com/tesseract-one/CSecp256k1.swift/releases)
[![SPM compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![CocoaPods version](https://img.shields.io/cocoapods/v/CSecp256k1.swift.svg)](https://cocoapods.org/pods/CSecp256k1)
![Platform macOS | iOS | tvOS | watchOS | Linux](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS-orange.svg)

Swift C module for [bitcoin secp256k1 library](https://github.com/bitcoin-core/secp256k1).

## Installation

CSecp256k1.swift deploys to macOS, iOS, tvOS, watchOS and Linux. It has been tested on the latest OS releases only however, as the module uses very few platform-provided APIs, there should be very few issues with earlier versions.

Setup instructions:

- **Swift Package Manager:**
  Add this to the dependency section of your `Package.swift` manifest:

    ```Swift
    .package(url: "https://github.com/tesseract-one/CSecp256k1.swift.git", from: "0.2.0")
    ```

- **CocoaPods:** Put this in your `Podfile`:

    ```Ruby
    pod 'CSecp256k1', '~> 0.2'
    ```

## Usage Examples

### Sign and Verify
```Swift
import CSecp256k1

let privKey: [UInt8] = [
    0x9d, 0x61, 0xb1, 0x9d, 0xef, 0xfd, 0x5a, 0x60, 0xba,
    0x84, 0x4a, 0xf4, 0x92, 0xec, 0x2c, 0xc4, 0x44, 0x49,
    0xc5, 0x69, 0x7b, 0x32, 0x69, 0x19, 0x70, 0x3b, 0xac,
    0x03, 0x1c, 0xae, 0x7f, 0x60
]

let data = [UInt8](repeating: 0, count: 32)

let context: OpaquePointer! = secp256k1_context_create(
    UInt32(SECP256K1_CONTEXT_SIGN|SECP256K1_CONTEXT_VERIFY)
)

var signature = secp256k1_ecdsa_recoverable_signature()
let res = secp256k1_ecdsa_sign_recoverable(context, &signature, data, privKey, nil, nil)
assert(res > 0)

var pubKey = secp256k1_pubkey()
let res2 = secp256k1_ec_pubkey_create(context, &pubKey, privKey)
assert(res2 > 0)

var ssig = secp256k1_ecdsa_signature()
let res3 = secp256k1_ecdsa_recoverable_signature_convert(context, &ssig, &signature)
assert(res3 > 0)

let isValid = secp256k1_ecdsa_verify(context, &ssig, hash, &pubKey)
assert(isValid == 1)
```

## License

CSecp256k1.swift can be used, distributed and modified under [the Apache 2.0 license](LICENSE).

Bitcoin secp256k1 can be used, distributed and modified under the [MIT license](https://github.com/bitcoin-core/secp256k1/blob/master/COPYING). 
