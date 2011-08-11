class FooUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process :resize_to_fit => [500,500]

  version :standard do
    process :resize_to_fit => [250,250]

    version :mirror do
      process :flop
    end
  end

  def flop
    manipulate! do |img|
      img.flop!
      img
    end
  end
end
