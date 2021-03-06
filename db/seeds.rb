# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  User.create(id: 1, email: "nans@yopmail.com", fidmarques_uuid: "072e69bc-c51a-11eb-8529-0242ac130003", name: "Nans", password:"random")
  User.create(id: 2, email: "david@yopmail.com",fidmarques_uuid: "1d92c90a-c51a-11eb-8529-0242ac130003", name: "David", password:"random")
  User.create(id: 3, email: "ambroise@yopmail.com",fidmarques_uuid: "219053ce-c51a-11eb-8529-0242ac130003", name: "Ambroise", password:"random")
end

SpaceSkill.create(id: 1, name: "NEUTRAL", rule: "This case is neutral.")
SpaceSkill.create(id: 2, name: "TWO_TIMES", rule: "Multiple by 2 the total dice.")
SpaceSkill.create(id: 3, name: "MOVE_BACK_3_CASES", rule: "Move Back 3 cases")
SpaceSkill.create(id: 4, name: "GO_BACK_STARTING", rule: "BACK TO 0.")
SpaceSkill.create(id: 5, name: "BUMP_5_CASES", rule: "YOU DROP AND MOVE BACKWARD TO 4 CASES.")




