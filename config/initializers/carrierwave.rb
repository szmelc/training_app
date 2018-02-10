CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region:                ENV["AWS_DEFAULT_REGION"]
  }
  config.fog_provider =   'fog/aws'
  config.fog_directory  = 'netgurutrainingapp'
  config.fog_public     = false
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
end
