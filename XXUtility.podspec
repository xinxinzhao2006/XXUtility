#
# Be sure to run `pod lib lint XXUtility.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XXUtility'
  s.version          = '0.1.1'
  s.summary          = 'XXUtility 常用工具类 '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
   # XXUtility 常用工具类
                       DESC

  s.homepage         = 'https://github.com/xinxinzhao2006/XXUtility'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '小新' => '1350009686@qq.com' }
  s.source           = { :git => 'https://github.com/xinxinzhao2006/XXUtility.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XXUtility/Classes/**/*'
  
  # s.resource_bundles = {
  #   'XXUtility' => ['XXUtility/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', "Foundation"
  s.dependency 'AFNetworking', '~> 3.1.0'
end
