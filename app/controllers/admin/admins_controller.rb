class Admin::AdminsController< AuthenticatedController
  before_action :authenticate_admin

  private

  def authenticate_admin
    if current_user.role != 'admin'
      redirect_to cards_path
    end
  end
end
