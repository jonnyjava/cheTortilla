admin = User.new
admin.email = 'admin@admin.com'
admin.password  = 'adminadmin'
admin.password_confirmation  = 'adminadmin'
admin.save!

5.times do |i|
  user = FactoryGirl.create(:user)
end

5.times do |i|
  event = FactoryGirl.create(:event, scheduled: i.to_i.days.from_now, user: admin)
  FactoryGirl.create(:invitation, event: event, email: 'thefirstpoldo@poldo.com')
end

5.times do |i|
  event = FactoryGirl.create(:event, scheduled: i.to_i.weeks.from_now)
  FactoryGirl.create(:invitation, event: event, email: 'admin@admin.com')
end
