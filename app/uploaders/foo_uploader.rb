class FooUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file
  process :resize_to_fit => [200,200]

  version :small do

    process :resize_to_fit => [100,100]

    version :mirror do
      process :flop => [false]

      def flop(foo)
        manipulate! {|img|
          img.flop!
        }
      end

    end

  end

end
