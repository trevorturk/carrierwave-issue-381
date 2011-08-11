class FooUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  version :small do

    process :resize_to_fit => [100,100]

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

# class FooUploader < CarrierWave::Uploader::Base
# 
#   include CarrierWave::MiniMagick
#   
#   version :rotated do
#     process :rotate
# 
#     version :boxed do
#       process :resize_to_fit => [100, 100]
#     end
#   end
# 
#   def rotate
#     manipulate! do |img|
#       img.rotate 90
#       img
#     end
#   end
# 
# end
