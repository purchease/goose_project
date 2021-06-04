class Board::Create < Mutations::Command

  required do
    model :game
  end

  def execute
    create_default_board
  end

  # TODO Create a webview to select the cases
  def create_default_board
    # Start Case
    Space.create!(position: 0,space_skill_id: 4, game_id: game.id)
    # Neutral cases
    [1,2,3,4,7,8,10,11,12,13,15,16,17,20,21,22,24,25,26,28,29,30,33,34,35,37,38,39,40,43,44,46,47,48,49,51,53,55,56,57,60,61,62].each do |case_id|
      Space.create!(position: case_id,space_skill_id: 1, game_id: game.id)
    end

    # Two times cases
    [5,9,14,18,23,27,32,36,41,45,50,54,59].each do |case_id|
      Space.create!(position: case_id, space_skill_id: 2, game_id: game.id)
    end

    # Hole cases
    [5,9,14,18,23,27,32,36,41,45,50,54,59].each do |case_id|
      Space.create!(position: case_id, space_skill_id: 3, game_id: game.id)
    end

    # Other cases
    [6, 19, 31, 42, 52, 58].each do |case_id|
      Space.create!(position: case_id, space_skill_id: 5, game_id: game.id)
    end
  end


end