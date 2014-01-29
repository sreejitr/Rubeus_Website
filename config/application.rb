require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Rubeus

  #String constants used in both html and specs
  HOME = "Home"
  PRODUCTS = "Products"
  SELL_PRODUCT = "Sell Something"
  SEARCH_PRODUCT = "Search for Products"
  OFFERS = "Offers"
  MESSAGES = "Messages"
  FAVORITES = "Favorites"
  MY_PRODUCTS = "My products"
  PROFILE = "Profile"
  MY_PROFILE = "My Profile"
  EDIT_PROFILE = "Edit Profile"
  DELETE_ACCOUNT = "Delete Account"
  LOCATION = "Location"
  CONTACT = "Contact"
  OWNED_PRODUCTS = "Owned Products"
  SOLD_PRODUCTS = "Sold Products"
  NAME = 'Name'
  SHOW_INTEREST = 'Show Interest!'
  EDIT_PROFILE_INFO = 'Edit Profile Information'
  PHONE_NO = "Phone no"
  ADDRESS = "Address"
  CITY = "City"
  STATE = "State"
  ZIP_CODE = "Zip code"
  SAVE_CHANGES = 'Save changes'
  DISCARD_CHANGES = 'Discard changes'
  BACK = 'Back'
  NO_OWNED_PRODUCTS = "You don't own any products yet."
  NO_SOLD_PRODUCTS = "You haven't sold any products yet."
  ACCEPT = 'Accept'
  ACCEPTED_MSG = 'Accepted!'
  WITHDRAW = 'Withdraw'
  SEND_MESSAGE = 'Message'
  REPLY = 'Reply'
  PENDING_OFFER = 'Offer pending'
  NUMBER_OF_OFFERS = 'No. of Offers'
  #Enumeration for product status column
	NOT_FOR_SALE = 'NOT_FOR_SALE'
  FOR_SALE = 'FOR_SALE'
  SOLD = 'SOLD'

  #Footer content
  ABOUT_US= "About us"
  CONTACT_US= "Contact us"
  TERMS_AND_CONDITIONS= "Terms and Conditions"
	ALOK= "Alok Nerurkar as Cedric Diggory"
  BRANDON= "Brandon Gannicottas Lucius Malfoy"
  PUSHKAR= "Pushkar Joglekar as Remus_Lupin"
  RASHMI= "Rashmi Krishnan as Rita Skeeter"
  SREEJITA= "Sreejita Ray as Minerva McGonagall"
  JOHN= " and John as Albus Dumbledore"
  TEAM_CONTACT= "If you like our website or want to shoot expletives for the horrible time you had,
  please mail us at team.rubeus@gmail.com (We promise we will get back to you after our exams!)"
  CONDITIONS= "If you don't like a product, its not our fault. If you do not get any offers it is not our fault.
Keep trying!"

  DELETE = "Delete"
  UPDATE = "Update"
  EDIT = "Edit"

  NOT_EDITABLE_MSG = "Sold products cannot be edited or deleted"

  SUCCESSFUL_OFFER_MSG = "Offer extended successfully"

  ERROR_OFFER_MSG = "Offer already extended for this product"

  ERROR_OFFER_MSG_FOR_SELLER = "Offer cannot be extended for owned products"

  SIGN_OUT = "Sign Out"

  ALL_PRODUCTS = "All Products"
  COMPOSE_MESSAGE = "Lets start a conversation"
  TEST_MESSAGE = "Test Message"

  class Application < Rails::Application
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

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    #Force the application to not access the DB or load models when precompiling your assets.
    config.assets.initialize_on_precompile = false
  end
end
