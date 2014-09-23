module Admin
  class BaseController < ApplicationController
  	before_filter :authorize
  end
end