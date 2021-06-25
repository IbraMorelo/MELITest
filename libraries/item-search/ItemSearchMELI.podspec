#
# Be sure to run `pod lib lint ItemSearchMELI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ItemSearchMELI'
  s.version          = '0.0.1'
  s.summary          = 'ItemSearchMELI iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Module to Test in MELI!
                       DESC

  s.homepage         = 'https://github.com/IbraMorelo/MELITest.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ibra.morelo' => 'ibramorelo@gmail.com' }
  s.source           = { :git => 'https://github.com/IbraMorelo/MELITest.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '11.0'
  s.default_subspec = 'Core'
  s.swift_version         = '5.0'
  s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '5.0' }
  s.default_subspec = 'Core'
  s.subspec "Core" do |ss|
    ss.dependency 'ItemSearchMELI/Resources'
    ss.source_files = 'Source/**/*'
    ss.dependency 'Alamofire'
    ss.dependency 'RxSwift'
    ss.dependency 'RxCocoa'
    ss.dependency 'Nuke'
  end

  s.subspec "Resources" do |ss|
    ss.resource_bundles      = { 
      'ItemSearchMELIResources' => [
        'Assets/LocalizedStrings/*.lproj/*.strings',
        'Assets/LocalizedStrings/*.lproj/*.stringsdict',
        'Assets/Images.xcassets',
        'Assets/**/*.{storyboard,xib,json}'
      ]
    } 
  end

  s.test_spec 'Tests' do |ss|
    ss.dependency 'ItemSearchMELI/Core'
    ss.source_files = 'Tests/**/*.{h,m,swift}'
    ss.ios.resources = ['Tests/**/*.{json}']
  end
end
