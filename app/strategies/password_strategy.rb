Warden::Strategies.add(:password) do
  def valid?
    params['email'] && params['password']
  end

  def authenticate!
    user = User.find_by(email: params['email'])

    if user && user.authenticate(params['password'])
      success!(user)
    else
      fail!('Invalid email or password')
    end
  end
end
