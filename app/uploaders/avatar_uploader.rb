class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [75, 75]
  end

  version :medium do
    process resize_to_fill: [150, 150]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
