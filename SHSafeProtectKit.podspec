#
# Be sure to run `pod lib lint SHSafeProtectKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SHSafeProtectKit'
  s.version          = '0.0.1'
  s.summary          = 'SHSafeProtectKit'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#  s.description      = <<-DESC
#
#                       DESC

  s.homepage         = 'https://github.com/shLuckySeven/SHSafeProtectKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shLuckySeven' => 'shuhuan329@163.com' }
  s.source           = { :git => 'https://github.com/shLuckySeven/SHSafeProtectKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.frameworks   = 'Foundation'
  s.platform     = :ios
  s.requires_arc = true

  s.subspec 'Core' do |ss|
      ss.requires_arc = true
      ss.source_files = 'SHSafeProtectKit/Core/*'
  end
  
  s.subspec 'Foundation' do |ss|
      ss.requires_arc = true
      ss.source_files = 'SHSafeProtectKit/Foundation/*'
      ss.dependency 'SHSafeProtectKit/Core'
  end
  
  s.subspec 'MRC' do |ss|
      ss.requires_arc = false
      ss.source_files = 'SHSafeProtectKit/MRC/*'
      ss.dependency 'SHSafeProtectKit/Foundation'
      ss.dependency 'SHSafeProtectKit/Core'
  end
end
