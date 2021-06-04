# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(fidmarques_uuid: "072e69bc-c51a-11eb-8529-0242ac130003", name: "Nans")
User.create(fidmarques_uuid: "1d92c90a-c51a-11eb-8529-0242ac130003", name: "David")
User.create(fidmarques_uuid: "219053ce-c51a-11eb-8529-0242ac130003", name: "Ambroise")

SpaceSkill.create(id: 1, name: "BLANK", rule: "This case is neutral.")
SpaceSkill.create(id: 2, name: "TWO_TIMES", rule: "Multiple by 2 the total dice.")
SpaceSkill.create(id: 3, name: "HOLE", rule: "YOU DROP AND MOVE BACKWARD TO 4 CASES.")
SpaceSkill.create(id: 4, name: "HOLE", rule: "YOU DROP AND MOVE BACKWARD TO 4 CASES.")

Game.create(number_of_players: 3, invitation_code: "BOUBOU")


