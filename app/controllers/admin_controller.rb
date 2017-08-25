class AdminController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_paper_trail_whodunnit

  layout 'admin'

  def user_for_paper_trail
    current_admin_user ? current_admin_user.id : 'Unknown'
  end
end
