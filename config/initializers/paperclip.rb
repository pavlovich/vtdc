# Paperclip::Attachment.default_options.update({
#   :path => "images/:class/:id/:attachment/:style/img_:fingerprint",
#   :storage => :fog,
#   :fog_credentials => {
#     :provider           => 'Rackspace',
#     :rackspace_username => 'blablabla',
#     :rackspace_api_key  => 'blablabla',
#     :persistent => false
#   },
#   :fog_directory => 'blablabla',
#   :fog_public => true,
#   :fog_host => 'http://blablabla.rackcdn.com'
# })

# options = {}

# options[:path] = attachment_path

# options[:storage] = :fog

# options[:url] = 'assets.vermonttotaldobermanclub.com' #example: assets.blah.com
# options[:fog_credentials] = {

# :provider=>'Google',

# :google_storage_access_key_id=>'GOOG3Y2ZDDQCYASFB5DX',

# :google_storage_secret_access_key=>'D3OYiJZv9Wnz3Oj9CqpEZ4rdAZai/KBPP1OSOcQ2'

# }
# options[:fog_public] = true #this must be set to true or ALL assets will be private by DEFAULT

# options[:fog_host] = CONFIG['HOST'] #example: http://assets.blah.com.commondatastorage.googleapis.com This can be changed to CDN

# options[:fog_directory] =CONFIG['BUCKET'] #example: assets.blah.com
