class Backends::AdminsController < BackendsController
  skip_before_action :check_login,only: [:login]
  def login
    render layout: false
  end

  def confirm_page
    render layout: false
  end

  def confirm_commit
    current_user.update(confirm: params[:confirm])
    redirect_to backends_path
  end

  def index
    @admins = Admin.all
  end

  def edit
    render layout: false
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.update(admin_params_permit)
    redirect_to :back,flash: { success: '更新成功'}
  end

  private

  def admin_params_permit
    params.require(:admin).permit(:name, :account, :password, :email, :fb, :major)
  end

end
