class ApplicationController < ActionController::Base
   before_filter :set_cache_buster
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception
   include SessionsHelper
   include FarmDetailsHelper
   include FertilizersHelper
  

  private
    def set_cache_buster
       response.headers["Last-Modified"] = Time.now.httpdate
       response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
       response.headers['Pragma'] = 'no-cache'
       response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
    end

    def initialize_constants
      @soil_type_con = LookupField.search("SOILTYPES")
      @season_con = LookupField.search("SEASON")
      @crop_name_con = LookupField.search("CROPNAMES")
      @soil_texture_con = LookupField.search("SOILTEXTURES")
      @soil_ph_con = LookupField.search("SOIL_PH")
      @soil_biota_con = LookupField.search("SOIL_BIOTA")
      @fertilizer_con = LookupField.search("FERTILIZERS")
      @quantity_con = LookupField.search("QUANTITY")
    end


end
