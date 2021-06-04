Goose Model

User(id, fidmarques_uuid, name, 
Player(id, color, user_id,

Game(id, number_of_players, 
PlayerSpacePosition(id, player_id, space_id

GameCredit(id, game_id, is_used, 

Space(id,game_space_skill_id, position, game_id
SpaceSkill(id, rule

Gift(id, name
GiftAttribution(id, player_id, 

Goose Rules

Quand on est invité dans une partie on peut inscrire son prénom ( on devrait recevoir cette information depuis CORE )

On démarre à 0
On doit aller jusqu’à la case 62 pour avoir terminé la partie

Bouger un joueur -> 

Si on arrive sur la même case qu’un autre joueur alors on le fait repartir à 0
5 cases spéciales

Le dès ( Dice ) est une action ( mutation donc rien à faire )

On obtient un crédit quand on scan un article 

On peut compter le nombre de tour grâce aux GameCredit concernant une partie

Mutations :

DiceRoll
