# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create Default Admin
user1 = User.create! :email => 'admin@boyscoutsfd.com', :password => 'secret',
                     :first_name => "AdminFirstName01", :last_name => "AdminLastName01" unless User.find_by_email('admin@boyscoutsfd.com')

#Create regular users
user2 = User.create! :email => 'user01@boyscoutsfd.com', :password => 'secret',  :can_view_routes => true,
                     :first_name => "FirstName01", :last_name => "LastName01" unless User.find_by_email('user01@boyscoutsfd.com')
user3 = User.create! :email=> 'user02@boyscoutsfd.com', :password => 'secret',
                     :first_name => "FirstName02", :last_name => "LastName02" unless User.find_by_email('user02@boyscoutsfd.com')



#Create Another admin to test My Groups
user4 = User.create! :email => 'admin2@boyscoutsfd.com', :password => 'secret',
                     :first_name => "FirstName012", :last_name => "LastName012" unless User.find_by_email('admin2@boyscoutsfd.com')


#Create a group to function as a Troop and set the admin to the created default admin.
groupAdmin = Group.create! :name => "SiteAdmins", :admin => true unless Group.find_by_name("SiteAdmins")
groupTroopLeader = Group.create! :name => "Troop01Leader" unless Group.find_by_name('Troop01')
group1 = Group.create! :name => "Troop01" unless Group.find_by_name('Troop01')
group2 = Group.create! :name => "Troop02" unless Group.find_by_name('Troop02')
group3 = Group.create! :name => "Troop03" unless Group.find_by_name('Troop03')
groupAdmin.users << user1
groupAdmin.users << user4
groupTroopLeader.children << group1

#Create new routes and add new subscriptions to that routes
route1 = Route.create! :name => "Route01", :group_id => group1.id unless Route.find_by_name("Route01")
route2 = Route.create! :name => "Route02", :group_id => group1.id unless Route.find_by_name("Route02")

route1.users << user2
route1.users << user3

sub1 = Subscription.create! :first_name => "FirstName01", :last_name => "LastName01", :route_id => route1.id, :address_line_1 => "1234 Fake Street",
                            :city => "Fake City", :zip => "00001", :state => "Fake Station", :qty => 1 unless Subscription.find_by_first_name("FirstName01")
sub2 = Subscription.create! :first_name => "FirstName02", :last_name => "LastName02", :route_id => route1.id, :address_line_1 => "1235 Fake Street",
                            :city => "Fake City", :zip => "00002", :state => "Fake Station", :qty => 2 unless Subscription.find_by_first_name("FirstName02")
sub3 = Subscription.create! :first_name => "FirstName03", :last_name => "LastName03", :route_id => route1.id, :address_line_1 => "1236 Fake Street",
                            :city => "Fake City", :zip => "00006", :state => "Fake Station", :qty => 3 unless Subscription.find_by_first_name("FirstName03")

#create a current payment for sub 1, and an old payment for sub2
pay1 = Payment.create! :subscription_id => sub1.id, :amount_paid => sub1.qty * 30, :start_date => DateTime.now,
                       :end_date  => (DateTime.now + 366) unless Payment.find_by_subscription_id(sub1.id)

pay1 = Payment.create! :subscription_id => sub1.id, :amount_paid => sub1.qty * 30, :start_date => (DateTime.now - 366),
                       :end_date  => (DateTime.now - 1) unless Payment.find_by_subscription_id(sub1.id)


