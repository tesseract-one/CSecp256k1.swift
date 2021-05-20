Pod::Spec.new do |s|
  s.name             = 'CSecp256k1'
  s.version          = '0.0.1'
  s.summary          = 'Swift C module for bitcoin secp256k1 library.'
  
  s.description      = <<-DESC
Swift C module for bitcoin secp256k1 library. Exports C methods for Swift.
                       DESC

  s.homepage         = 'https://github.com/tesseract-one/CSecp256k1.swift'

  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Tesseract Systems, Inc.' => 'info@tesseract.one' }
  s.source           = { :git => 'https://github.com/tesseract-one/CSecp256k1.swift.git', :tag => s.version.to_s, :submodules => true }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  
  s.swift_versions = ['5', '5.1', '5.2', '5.3']
  
  s.module_name = 'CSecp256k1'
  
  s.source_files = 'Sources/CSecp256k1/config/*.h', 'Sources/CSecp256k1/secp256k1/include/*.h', 'Sources/CSecp256k1/secp256k1/src/*.h', 'Sources/CSecp256k1/secp256k1/src/modules/ecdh/main_impl.h', 'Sources/CSecp256k1/secp256k1/src/modules/recovery/main_impl.h', 'Sources/CSecp256k1/secp256k1/src/secp256k1.c', 'Sources/CSecp256k1/include/*.h'
  
  s.public_header_files = 'Sources/CSecp256k1/include/*.h', 'Sources/CSecp256k1/secp256k1/include/*.h'
  
  s.exclude_files = 'Sources/CSecp256k1/secp256k1/src/test*', 'Sources/CSecp256k1/secp256k1/src/asm/*', 'Sources/CSecp256k1/secp256k1/src/bench*', 'Sources/CSecp256k1/secp256k1/include/secp256k1_schnorrsig.h', 'Sources/CSecp256k1/secp256k1/include/secp256k1_extrakeys.h'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) HAVE_CONFIG_H',
    'GCC_WARN_UNUSED_FUNCTION' => 'NO',
    'GCC_WARN_UNUSED_VARIABLE' => 'NO'
  }
end
