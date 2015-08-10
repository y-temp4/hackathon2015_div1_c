# coding:utf-8

0.upto(30) do |n|
    User.create :email => "test#{n}@email.com", :password => 'password'
end
