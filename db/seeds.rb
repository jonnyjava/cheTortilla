user = User.new
user.email = 'admin@admin.com'
user.password  = 'adminadmin'
user.password_confirmation  = 'adminadmin'
user.save!

5.times do |i|
  user = User.new
  user.email = "poldo#{i}@poldo.com"
  user.password  = 'poldopoldo'
  user.password_confirmation  = 'poldopoldo'
  user.save!
end
