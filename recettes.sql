-- Create new database
DROP DATABASE IF EXISTS `new_database`;
CREATE DATABASE `new_database`;
USE `new_database`;

-- Create `new_comments` table
DROP TABLE IF EXISTS `new_comments`;

CREATE TABLE `new_comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `review` int NOT NULL DEFAULT '3',
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `recipe_id` (`recipe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Insert data into `new_comments` table
LOCK TABLES `new_comments` WRITE;

INSERT INTO `new_comments` VALUES 
(2, 3, 1, 'Deuxième commentaire', '2021-07-06 13:56:48', 0),
(1, 1, 1, 'Premier commentaire\n', '2021-07-06 13:56:48', 1),
(3, 2, 1, 'J\'adore le cassoulet mais je préfère manger des kebabs !', '2021-07-06 13:56:48', 3),
(5, 2, 1, 'Et de 5 ! trop bien la recette :)', '2021-07-06 14:10:50', 3),
(7, 2, 1, 'Test de 5', '2021-07-06 14:14:39', 5);

UNLOCK TABLES;

-- Create `new_recipes` table
DROP TABLE IF EXISTS `new_recipes`;

CREATE TABLE `new_recipes` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `recipe` text NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `author` varchar(512) NOT NULL,
  PRIMARY KEY (`recipe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Insert data into `new_recipes` table
LOCK TABLES `new_recipes` WRITE;

INSERT INTO `new_recipes` VALUES 
(1, 'Cassoulet Toulousain', 'Le cassoulet (de l\'occitan cassolet, caçolet) est une spécialité régionale du Languedoc, à base de haricots secs, généralement blancs, et de viande. À son origine, il était à base de fèves. Le cassoulet tient son nom de la cassole en terre cuite émaillée dite caçola en occitan et fabriquée à Issel.', 1, 'mickael.andrieu@exemple.com'),
(2, 'Couscous', 'Le couscous (en berbère : سكسو  ou كسكس,  en arabe maghrébin : كسكس ou طعام) est d\'une part une semoule de blé dur préparée à l\'huile d\'olive (un des aliments de base traditionnel de la cuisine des pays du Maghreb) et d\'autre part, une spécialité culinaire issue de la cuisine berbère, à base de couscous, de légumes, d\'épices, d\'huile d\'olive et de viande (rouge ou de volaille) ou de poisson.', 0, 'mickael.andrieu@exemple.com'),
(3, 'Escalope milanaise', 'L\'escalope à la milanaise, ou escalope milanaise (cotoleta a la milanesa in langue lombarde), est une escalope panée, de viande de veau, traditionnellement prise dans le faux-filet. Historiquement, on la cuit avec du beurre. Elle est généralement servie avec salade ou frites, accompagnée de sauce mayonnaise. On peut y ajouter un filet de jus de citron. En Italie, ce mets ne se sert pas avec des pâtes.', 1, 'mathieu.nebra@exemple.com'),
(4, 'Salade Romaine', 'La salade César (en anglais : Caesar salad ; en espagnol : ensalada César ; en italien : Caesar salad) est une recette de cuisine de salade composée de la cuisine américaine, traditionnellement préparée en salle à côté de la table, à base de laitue romaine, œuf dur, croûtons, parmesan et de « sauce César » à base de parmesan râpé, huile d\'olive, pâte d\'anchois, ail, vinaigre de vin, moutarde, jaune d\'œuf et sauce Worcestershire.', 0, 'laurene.castor@exemple.com'),
(10, 'Paella', 'La paella est un plat traditionnel à base de riz rond, originaire de la région de Valence en Espagne, qui tient son nom de la poêle qui sert à la cuisiner.', 1, 'mathieu.nebra@exemple.com'),
(11, 'Tartiflette', 'La tartiflette (dérivé de tartifle, ou tartiflê, pomme de terre, en savoyard) est une recette de cuisine, à base de gratin de pommes de terre, oignons, lardons, le tout gratiné au reblochon (fromage AOP des pays de Savoie).', 1, 'mickael.andrieu@exemple.com'),
(12, 'Steak tartare', 'Le steak tartare ou tartare est une recette à base de viande de bœuf ou de viande de cheval crue, généralement hachée gros, ou coupée en petits cubes au couteau (d\'où l\'appellation de tartare au couteau). Le filet américain est une variante belge et du nord de la France.', 0, 'mickael.andrieu@exemple.com'),
(13, 'Quiche lorraine', 'La quiche lorraine est une variante de quiche / tarte salée de la cuisine lorraine et de la cuisine française, à base de pâte brisée ou de pâte feuilletée, de migaine d\'œufs, de crème fraîche et de lardons.', 1, 'laurene.castor@exemple.com');

UNLOCK TABLES;

-- Create `new_users` table
DROP TABLE IF EXISTS `new_users`;

CREATE TABLE `new_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(64) NOT NULL,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Insert data into `new_users` table
LOCK TABLES `new_users` WRITE;

INSERT INTO `new_users` VALUES 
(1, 'Mickaël Andrieu', 'mickael.andrieu@exemple.com', 'S3cr3t', 34),
(2, 'Mathieu Nebra', 'mathieu.nebra@exemple.com', 'MiamMiam', 34),
(3, 'Laurène Castor', 'laurene.castor@exemple.com', 'laCasto28', 28);

UNLOCK TABLES;
