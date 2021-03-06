CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    region:                'eu-west-2',                  # optional, defaults to 'us-east-1'
    aws_access_key_id:     Rails.application.credentials[Rails.env.to_sym][:aws_key],    # required unless using use_iam_profile
    aws_secret_access_key: Rails.application.credentials[Rails.env.to_sym][:aws_secret], # required unless using use_iam_profile
  }
  config.fog_directory  = Rails.application.credentials[Rails.env.to_sym][:aws_bucket]                 # required
end
