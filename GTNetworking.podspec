Pod::Spec.new do |s|
  s.name             = 'GTNetworking'
  s.version          = '0.0.1'
  s.summary          = 'GTNetworking is a high level request util based on AFNetworking.'
  s.homepage         = 'https://github.com/liuxc123/GTNetworking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liuxc123' => 'lxc_work@126.com' }
  s.source           = { :git => 'https://github.com/liuxc123/GTNetworking.git', :tag => s.version.to_s }
  s.requires_arc  = true

  s.source_files = 'GTNetworking/*.{h,m}'
  s.private_header_files = "GTNetworking/GTNetworkPrivate.h"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.frameworks = 'CFNetwork'


  s.dependency 'AFNetworking', '~> 3.2.1'

end
