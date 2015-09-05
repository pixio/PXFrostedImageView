Pod::Spec.new do |s|
  s.name             = "PXFrostedImageView"
  s.version          = "0.1.2"
  s.summary          = "Image view with blurry frosted background."
  s.description      = <<-DESC
                       A simple, tintable image view that displays a frosted version of its content.
                       DESC
  s.homepage         = "https://github.com/pixio/PXFrostedImageView"
  s.license          = 'MIT'
  s.author           = { "Daniel Blakemore" => "DanBlakemore@gmail.com" }
  s.source = {
   :git => "https://github.com/pixio/PXFrostedImageView.git",
   :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PXFrostedImageView' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Accelerate'
  s.dependency 'PXImageView'
  s.dependency 'UIImageUtilities'
  s.dependency 'UIColor-MoreColors'
end
