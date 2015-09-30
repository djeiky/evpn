class Admin::AdminController < ApplicationController
  layout "admin"
  before_filter :is_admin?

  def index
  end
end
