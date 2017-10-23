class RelationshipsController < AuthenticatedController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).where.not(id: current_user.id)
    @relationships = Relationship.all
  end

  def create
    # TODO Redo
    @user = User.find(user_id)
    # @relationship = Relationship.new(follower: current_user, followed: @user)
    @relationship = current_user.follow(@user)
    notice = 'You added a friend'
    redirect_to root_path, notice: notice
  end

  private

  def user_id
    params.require(:user).permit(:id)[:id]
  end
end
