Pod::Spec.new do |s|
  s.name          = "CoreExtensions"
  s.version       = "0.0.1"
  s.summary       = "Swift Core Extensions"
  s.description   = <<-DESC
  This Framework provides extensions for regex matching to the swift standard library.
                   DESC

  s.homepage      = "https://github.com/baberthal/SwiftCoreExt"
  s.license       = "MIT"
  s.author        = { "Morgan Lieberthal" => "morgan@jmorgan.org" }
  s.source        = { :git => "https://github.com/baberthal/SwiftCoreExt.git", :tag => "0.0.1" }

  s.source_files  = "CoreExtensions", "CoreExtensions/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.platform = :osx, '10.10'
end
