class AdminController < ApplicationController
  layout "admin"
  before_filter :is_admin?
end
