admin = User.new
admin.email = 'admin@admin.com'
admin.password  = 'adminadmin'
admin.password_confirmation  = 'adminadmin'
admin.save!

5.times do |i|
  user = User.new
  user.email = "poldo#{i}@poldo.com"
  user.password  = 'poldopoldo'
  user.password_confirmation  = 'poldopoldo'
  user.save!
end

5.times do |i|
  event = FactoryGirl.create(:event, scheduled: i.to_i.days.from_now, user: admin)
  FactoryGirl.create(:invitation, event: event, email: 'thefirstpoldo@poldo.com')
end
