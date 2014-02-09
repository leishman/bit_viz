helpers  do
  def assign_user
    @user = User.find(session[:user_id])
  end
end
