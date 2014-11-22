Pod::Spec.new do |s|
  s.name                  = "LibMagic"
  s.version               = "5.18.0"
  s.summary               = "Magic Library for file type guess."
  s.description           = <<-DESC
                            The file command is "a file type guesser", 
                            that is, a command-line tool that tells you 
                            in words what kind of data a file contains. 
                            Unlike most GUI systems, command-line UNIX systems 
                            - with this program leading the charge - don't rely
                            on filename extentions to tell you the type of a file, 
                            but look at the file's actual contents. This is, of 
                            course, more reliable, but requires a bit of I/O.
                            DESC
  s.homepage              = "https://github.com/ischlecken/LibMagic"
  s.license               = 'MIT'
  s.author                = { "Hugo Schlecken" => "h.schlecken@gmx.de" }
  s.source                = { :git => "https://github.com/ischlecken/LibMagic.git", :tag => s.version.to_s }

  s.ios.deployment_target = '7.1'
  s.osx.deployment_target = '10.9'
  s.requires_arc          = true

  s.source_files          = 'Pod/src/*','Pod/Classes/*'
  s.libraries             = 'z'
  s.resources             = 'Pod/Assets/magic'

  s.public_header_files   = 'Pod/src/*.h','Pod/Classes/*.h'
 # s.private_header_files = 'Pod/src/config.h'
  s.xcconfig              = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'HAVE_CONFIG_H=1' }

end

