#
# Be sure to run `pod lib lint YZTableViewAdapter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YZTableViewAdapter'
  s.version          = '0.1.0'
  s.summary          = 'A Lightweight Tool for Fast Assembly of TableViewCells'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
YZTableViewAdapter uses adapter to manage various TableViewCells. You just need to implement some protocols for each cell to quickly build a list.
                       DESC

  s.homepage         = 'https://github.com/qyz777/YZTableViewAdapter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qyz777' => 'qyizhong1998@gmail.com' }
  s.source           = { :git => 'https://github.com/qyz777/YZTableViewAdapter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YZTableViewAdapter/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YZTableViewAdapter' => ['YZTableViewAdapter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
