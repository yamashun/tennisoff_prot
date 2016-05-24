module UsersHelper
  def show
    @user = Usr.find(current_user.id)
  end
end
