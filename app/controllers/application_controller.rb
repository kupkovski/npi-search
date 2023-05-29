# frozen_string_literal: true

# Main controller for the app
class ApplicationController < ActionController::Base
  add_flash_types :alert, :notice
end
