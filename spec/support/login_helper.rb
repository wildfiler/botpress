module LoginHelper
  def login(user)
    post('/session',
         params: { 'session[email]' => user.email,
                   'session[password]' => user.password })
  end
end
