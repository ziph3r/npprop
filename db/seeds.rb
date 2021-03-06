#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Zone::ARRS.each do |z|
	zone = Zone.find_or_create_by(:name => z)
end

ProductStatusMaster::ARRS.each do |z|
	pm = ProductStatusMaster.find_or_create_by(:name => z)
end

Province::ARRS.each do |p|
	pv = Province.find_or_create_by(:name => p)
end

user = User.where(['email = ?', 'admin@npproperty.net']).first
user = User.new(:email => 'admin@npproperty.net') if user.nil?
user.password = "NpPr0p3rtii$!"
user.save
