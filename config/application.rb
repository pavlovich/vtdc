require File.expand_path('../boot', __FILE__)

require 'rails/all'

#require 'Fog'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Vtdc
  class Application < Rails::Application
    # Hobo: the showman subsite loads showman.css & showman.js
    config.assets.precompile += %w(showman.css showman.js)
    config.i18n.default_locale = :en
    # Hobo: the private subsite loads private.css & private.js
    config.assets.precompile += %w(private.css private.js)
    
    config.generators do |g|
      g.test_framework :rspec, :fixtures => true
      g.fallbacks[:rspec] = :test_unit
      g.fixture_replacement = :factory_girl
    end

    # Hobo: Named routes have changed in Hobo 2.0.   Set to false to emit both the 2.0 and 1.3 names.
    config.hobo.dont_emit_deprecated_routes = false
    # Hobo: the public subsite loads public.css & public.js
    config.assets.precompile += %w(public.css public.js)
    config.assets.precompile += %w(vtdc.css)
    config.assets.precompile += %w(fullcalendar.css fullcalendar.print.css jquery-ui-timepicker-addon.css)
    config.assets.precompile += %w(calendar.js fullcalendar.js gcal.js jquery.rest.js rails.js jquery-ui-timepicker-addon.js)

    # Added by the Rails 3 jQuery Template
    # http://github.com/lleger/Rails-3-jQuery, written by Logan Leger
    config.action_view.javascript_expansions[:defaults] = %w(jquery rails)
    config.action_view.javascript_expansions[:cdn] = %w(https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js rails)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    config.assets.initialize_on_precompile = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.paperclip_defaults = {
        :path => "images/:class/:id/:attachment/:style/img_:fingerprint",
        :storage => :fog,
        :url => 'photos.totaldoberman.com', #example: assets.blah.com
        :fog_credentials => {
            :provider=>'Google',
            :google_storage_access_key_id=>'GOOGSAS4BZ2ML56TOQ7L',
            :google_storage_secret_access_key=>'WloJIDKFr1StFzjRY/Z3I9YwTn0au0LsKAEM3IBk'

      #  :google_storage_access_key_id=>'GOOG3Y2ZDDQCYASFB5DX',
      #  :google_storage_secret_access_key=>'D3OYiJZv9Wnz3Oj9CqpEZ4rdAZai/KBPP1OSOcQ2'


    },
        :fog_public => true, #this must be set to true or ALL assets will be private by DEFAULT
        :fog_host => 'http://photos.totaldoberman.com', #example: http://assets.blah.com.commondatastorage.googleapis.com This can be changed to CDN
        :fog_directory => 'photos.totaldoberman.com' #example: assets.blah.com
   #     :fog_host => 'http://images.totaldoberman.com', #example: http://assets.blah.com.commondatastorage.googleapis.com This can be changed to CDN
   #     :fog_directory => 'images.totaldoberman.com' #example: assets.blah.com
    }

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

  end

end

module HoboFields
  module Types
    class RedactorText < HtmlString
      HoboFields.register_type(:rdtext, self)
    end
  end
end

class String
  def to_object_name_and_method_name
    object_name, method_name = self.split('[')[-1].split().unshift(self.split('[')[0..-2].join('['))
    method_name.chomp!(']') if method_name && !method_name.empty?
    method_name, object_name = [object_name, 'this'] if !method_name
    [object_name.to_sym, method_name.to_s]
  end
end

#module RedactorRails
##  IMAGE_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/pjpeg', 'image/tiff', 'image/x-png']
#
##  FILE_TYPES = ['application/msword', 'application/pdf', 'text/plain', 'text/rtf', 'application/vnd.ms-excel']
#
##  autoload :Http, 'redactor-rails/http'
#
#  @@image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]
#  @@document_file_types = ["pdf", "doc", "docx", "xls", "xlsx", "rtf", "txt"]
#
#
#  @@picture_model = Vtdc::Picture
#  @@document_model = Vtdc::Document
#
#end

