module Admin
  class HomeController < AdminController
    before_action :authenticate_admin_user!

    def index; end
  end
end
