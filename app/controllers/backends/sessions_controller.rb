class Backends::SessionsController <  BackendsController
  skip_before_action :check_login
  def create
    @admin = Admin.find_by(account: params[:account])
    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      if !@admin.confirm
        redirect_to confirm_page_backends_admins_path
      else
        redirect_to backends_path ,flash: { success: '登入成功'}
      end
    else
      redirect_to :back,flash: { error: '登入失敗'}
    end
  end

  def destroy
    session.delete(:admin_id)
    redirect_to backends_path,flash: { success: '登出成功'}
  end
end
