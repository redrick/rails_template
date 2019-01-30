module Admin
  class AdminUsersController < AdminController
    before_action :find_admin_users, only: [:index]
    before_action :find_admin_user, only: %i[edit update destroy]

    def index; end

    def new
      @admin_user = AdminUser.new
    end

    def create
      @admin_user = AdminUser.new(premitted_params[:admin_user])

      if @admin_user.save
        redirect_to admin_admin_users_path, flash: { success: 'Admin created' }
      else
        render 'new'
      end
    end

    def edit; end

    def update
      if @admin_user.update(premitted_params[:admin_user])
        redirect_to admin_admin_users_path
      else
        render 'edit'
      end
    end

    def destroy
      @admin_user.destroy
      redirect_to admin_admin_users_path
    end

    private

    def find_admin_users
      @admin_users = AdminUser.all.paginate(page: params[:page])
    end

    def find_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

    def premitted_params
      params.permit(admin_user: %i[email password password_confirmation])
    end
  end
end
