# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
	username: "Christel",
	email: "christel@2004.be",
  	password: "1234",
  	password_confirmation: "1234",
	admin: false
)
u.skip_confirmation!
u.save!
