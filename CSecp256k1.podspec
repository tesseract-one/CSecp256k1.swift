Pod::Spec.new do |s|
  s.name             = 'CSecp256k1'
  s.version          = '999.99.9'
  s.summary          = 'Swift C module for bitcoin secp256k1 library.'
  
  s.description      = <<-DESC
Swift C module for bitcoin secp256k1 library. Exports C methods for Swift.
                       DESC

  s.homepage         = 'https://github.com/tesseract-one/CSecp256k1.swift'

  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Tesseract Systems, Inc.' => 'info@tesseract.one' }
  s.source           = { :git => 'https://github.com/tesseract-one/CSecp256k1.swift.git', :tag => s.version.to_s, :submodules => true }

  s.swift_version    = '5.4'

  base_platforms     = { :ios => '11.0', :osx => '10.13', :tvos => '11.0' }
  s.platforms        = base_platforms.merge({ :watchos => '6.0' })
  
  s.module_name = 'CSecp256k1'
  
  s.source_files = 'Sources/CSecp256k1/config/*.h', 'Sources/CSecp256k1/secp256k1/include/*.h', 'Sources/CSecp256k1/secp256k1/src/*.h', 'Sources/CSecp256k1/secp256k1/src/modules/ecdh/main_impl.h', 'Sources/CSecp256k1/secp256k1/src/modules/recovery/main_impl.h', 'Sources/CSecp256k1/secp256k1/src/secp256k1.c'
  
  s.public_header_files = 'Sources/CSecp256k1/secp256k1/include/*.h'
  
  s.exclude_files = 'Sources/CSecp256k1/secp256k1/src/test*', 'Sources/CSecp256k1/secp256k1/src/asm/*', 'Sources/CSecp256k1/secp256k1/src/bench*', 'Sources/CSecp256k1/secp256k1/include/secp256k1_schnorrsig.h', 'Sources/CSecp256k1/secp256k1/include/secp256k1_extrakeys.h'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) HAVE_CONFIG_H',
    'GCC_WARN_UNUSED_FUNCTION' => 'NO',
    'GCC_WARN_UNUSED_VARIABLE' => 'NO',
    'GCC_WARN_64_TO_32_BIT_CONVERSION' => 'NO'
  }
  
  s.test_spec 'CSecp256k1Tests' do |ts|
    ts.platforms = base_platforms
    ts.source_files = 'Tests/CSecp256k1Tests/**/*.swift'
  end
end
