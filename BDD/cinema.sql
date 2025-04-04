-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 03 avr. 2025 à 09:50
-- Version du serveur : 8.0.30
-- Version de PHP : 8.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cinema`
--
CREATE DATABASE IF NOT EXISTS `cinema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cinema`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `name`, `description`) VALUES
(14, 'Aventure', 'Le film d&#039;action est un genre cinématographique qui met en scène une succession de scènes spectaculaires souvent stéréotypées (courses-poursuites, fusillades, explosions…) construites aut [...]'),
(15, 'Drame', 'Le drame est un genre cinématographique qui traite des situations généralement non épiques dans un contexte sérieux, sur un ton plus susceptible d&amp;#039;inspirer la tristesse que le rire. Historiquement, le drame était un genre littéraire comprenant tous les ouvrages composés pour le théâtre.'),
(16, 'Animation', 'Le cinéma d’animation, nommé aussi le cinéma image par image est en fait une illusion, tout comme le cinéma. Il s’agit d’images f ixes à qui on donne la vie. Pour cela, il existe toutes sor [...]'),
(17, 'Fantastique', 'Le cinéma fantastique est un genre cinématographique regroupant des films faisant appel au surnaturel, à l&#039;horreur, à l&#039;insolite ou aux monstres. L’intrigue se fonde sur des éléments [...] [...]'),
(18, 'Guerre', 'Un film de guerre est un film traitant le thème de la guerre, en s&#039;attardant généralement sur un conflit armé qu&#039;il soit naval, aérien ou terrestre.\r\n\r\nLes thèmes explorés incluent le [...] [...]'),
(19, 'Horreur', 'Le film d&#039;horreur, ou film d&#039;épouvante, est un genre cinématographique dont l&#039;objectif est de créer un sentiment de peur, de répulsion ou d&#039;angoisse chez le spectateur. Il est  [...] [...]');

-- --------------------------------------------------------

--
-- Structure de la table `films`
--

CREATE TABLE `films` (
  `id_film` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `director` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `actors` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ageLimit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `duration` time NOT NULL,
  `synopsis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` float NOT NULL,
  `stock` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `films`
--

INSERT INTO `films` (`id_film`, `category_id`, `title`, `director`, `actors`, `ageLimit`, `duration`, `synopsis`, `date`, `image`, `price`, `stock`) VALUES
(7, 17, 'Avatar', 'James Cameron', 'Sam Worthington      /         Zoe Saldana/Sigourney Weaver/Stephen Lang', '10', '02:44:00', 'L’action se déroule en 21544 sur Pandora, une des lunes de Polyphème, une planète géante gazeuse en orbite autour d&#039;Alpha Centauri A dans le système stellaire le plus proche de la Terre. L’exolune, recouverte d’une jungle luxuriante, est le théâtre du choc entre les autochtones Na&#039;vis et les Terriens. Les premiers vivent en parfaite symbiose avec leur environnement et tentent de se défendre face à l’invasion militarisée des seconds, venus exploiter un minerai rare susceptible de résoudre la crise énergétique sur Terre : l&#039;unobtanium. L&#039;un des principaux gisements se trouve sous un gigantesque arbre-maison habité par les Omaticayas, un important clan Na&#039;vi. Visant à s&#039;en emparer, les Terriens créent le programme Avatar. En contrôlant des corps Na&#039;vis clonés et génétiquement modifiés, ils projettent de s&#039;insérer dans la population afin de négocier avec elle. Toutefois, les militaires assurant la protection des équipes de recherche voient d&#039;un mauvais œil le programme Avatar, qu&#039;ils jugent beaucoup trop lent. Ils sont convaincus que la force brutale, tirant profit de leur avance technologique, leur permettrait de conquérir la planèteN 1 en quelques jours. Le personnage central de l’histoire, Jake Sully, un marine paraplégique doté d&#039;un avatar, va devoir choisir son camp avec pour enjeu le destin de la planèteN 1.', '2020-05-14', 'avengers.jpg', 12, 122),
(9, 15, 'Matrix', 'Wachowski sisters', 'Keanu Reeves/Laurence Fishburne/Carrie Anne Moss', '16', '02:15:00', 'dqfdsfdsfsdfsdfsfdfdsdfsdffdfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', '2015-08-07', 'matrix.jpg', 12, 121),
(10, 17, 'Wall-e', 'Andrew Stanton', 'Ben Burtt/Eliss a Knight/Jeff-Garlin', '10', '02:32:00', 'dqsldmlqskdmqkmlsdqsdkq', '2021-12-12', 'wall_e.jpg', 12, 12),
(11, 14, 'E.T', 'Steven Spielberg', 'Henry Thomas/D rew Barrymore /Dee Wallace', '10', '02:12:00', 'SMLSKCSDFKSFKDSMFLKSDLFKSKFMSFKSDFKMS', '2022-12-12', 'ET.jpg', 12, 212),
(12, 18, 'Avengers', 'Josh Wendon', 'Robert Downey Jr./Chris Evans/Mar k Ruffalo', '13', '01:12:00', 'dsldskdlsddsdsd', '2022-12-12', 'avengers.jpg', 12, 12),
(13, 17, '7 ans au tibet', 'Jean- Jacques  Annaud', 'Brad Pitt / David Thewlis / Jamyang Jamtsho Wangchuk / David Thewlis / B.D Wong', '10', '02:32:00', 'À l&#039;été 1939, l&#039;alpiniste autrichien Heinrich Harrer fait partie d&#039;une expédition envoyée par le Troisième Reich visant à gravir le Nanga Parbat, un sommet inviolé de l&#039;Himalaya, situé à l&#039;epoque aux Indes britanniques, et ce au moment même où éclate la Seconde Guerre mondiale. Harrer abandonne sa femme enceinte en Autriche.\r\n\r\nFait prisonnier par les Britanniques avec ses compagnons, il apprend que sa femme a demandé le divorce et attend le jugement pour pouvoir se remarier avec celui que son fils considère déjà comme son père.\r\n\r\nEn 1944, il réussit à s&#039;évader et commence alors une longue errance qui le mène, avec son ami Peter Aufschnaiter, à Lhassa, la capitale du Tibet, où il fait la connaissance du 14e dalaï-lama, Tenzin Gyatso, alors âgé de 11 ans, dont il devient l&#039;ami. Cette rencontre le transforme.\r\n\r\nL&#039;invasion du Tibet par la Chine en 1950 l&#039;oblige à fuir. Il quitte le dalaï-lama à regret. À l&#039;occasion de cette séparation, Tenzin Gyatso lui offre une boite à musique pour son fils.\r\n\r\nFinalement, Heinrich Harrer découvre son fils, se réconcilie avec lui grâce à la boîte à musique et lui fait partager sa passion de l&#039;alpinisme.', '2022-12-12', '7-ans-au-Tibet.jpg', 12, 14),
(14, 14, 'Green Book : sur les routes du', 'Pter ferrly', 'Viggo Mortense n / Mahershal a Ali / Linda Cardellini / Nick Vallelonga / Dimiter Marinov', '13', '02:12:00', 'DSDFDSLF%SDMFLSDFMSDLMLF%SLMDFLMSD', '2015-12-12', 'Green-Book.jpg', 12, 12),
(18, 14, 'Green Book : sur les routes du', 'Pter ferrly', 'Viggo Mortense n / Mahershal a Ali / Linda Cardellini / Nick Vallelonga / Dimiter Marinov', '13', '02:12:00', 'DSDFDSLF%SDMFLSDFMSDLMLF%SLMDFLMSD', '2018-12-15', 'Green-Book.jpg', 12, 12);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id_order` int NOT NULL,
  `user_id` int NOT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_paid` enum('0','1') COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id_order`, `user_id`, `price`, `created_at`, `is_paid`) VALUES
(1, 7, 12, '2025-03-28 16:01:20', '1'),
(2, 7, 36, '2025-03-28 16:02:58', '1'),
(3, 7, 24, '2025-03-28 16:03:53', '1'),
(4, 7, 24, '2025-03-28 16:08:18', '1'),
(5, 7, 36, '2025-03-28 16:09:19', '1'),
(6, 7, 36, '2025-03-28 16:10:50', '1');

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `film_id` int NOT NULL,
  `price_film` float NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`order_id`, `film_id`, `price_film`, `quantity`) VALUES
(1, 11, 12, 1),
(2, 11, 12, 1),
(2, 13, 12, 1),
(2, 10, 12, 1),
(3, 12, 12, 1),
(3, 18, 12, 1),
(4, 12, 12, 1),
(4, 10, 12, 1),
(5, 11, 12, 1),
(6, 11, 12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `firstName` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `pseudo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `mdp` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `civility` enum('f','h') COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `zip` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` enum('ROLE_USER','ROLE_ADMIN') COLLATE utf8mb4_general_ci DEFAULT 'ROLE_USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `firstName`, `lastName`, `pseudo`, `mdp`, `email`, `phone`, `civility`, `birthday`, `address`, `zip`, `city`, `country`, `role`) VALUES
(7, 'Sahar', 'Mahdouani', 'sousou', '$2y$10$gg4vB/kdPEwBHl3TgNF0yujGc54tNcFrz7t/29j1nf3uO9WTqh./S', 'sahar.mahdouani@10mentionweb.org', '0701020304', 'f', '2000-05-02', '9 rue de la liberté', '91240', 'Evry', 'France', 'ROLE_ADMIN'),
(9, 'Yacine', 'Djediden', 'Yaya', '$2y$10$1UX0YOsF4kVcrRVUVSFnAO8qTMNQ4cCtbH.Zlv9gsKOFy49hmXaw6', 'yacine.djediden@10mentionweb.org', '0753062767', 'h', '2001-12-03', '1rue résistance', '91000', 'Lyon', 'France', 'ROLE_USER');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `categorie_id` (`category_id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `films`
--
ALTER TABLE `films`
  MODIFY `id_film` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_10` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_100` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_101` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_102` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_103` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_104` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_105` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_106` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_107` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_108` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_109` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_11` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_110` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_111` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_112` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_113` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_114` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_115` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_116` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_117` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_118` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_119` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_12` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_120` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_121` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_122` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_123` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_124` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_125` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_126` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_127` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_128` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_129` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_13` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_130` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_131` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_132` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_133` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_134` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_135` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_136` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_137` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_138` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_139` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_14` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_140` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_141` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_142` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_143` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_144` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_145` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_146` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_147` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_148` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_149` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_15` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_150` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_151` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_152` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_153` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_154` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_155` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_156` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_157` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_158` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_159` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_16` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_160` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_161` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_162` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_163` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_164` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_165` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_166` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_167` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_168` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_169` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_17` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_170` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_171` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_172` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_173` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_174` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_175` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_176` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_177` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_178` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_179` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_18` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_180` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_181` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_182` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_183` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_184` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_185` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_186` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_187` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_188` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_189` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_19` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_190` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_191` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_192` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_193` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_194` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_195` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_196` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_197` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_198` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_199` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_20` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_200` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_201` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_202` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_203` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_204` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_205` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_206` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_207` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_208` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_209` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_21` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_210` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_211` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_212` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_213` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_214` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_215` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_216` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_217` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_218` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_219` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_22` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_220` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_221` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_222` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_223` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_224` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_225` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_226` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_227` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_228` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_229` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_23` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_230` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_231` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_232` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_233` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_234` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_235` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_236` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_237` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_238` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_239` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_24` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_240` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_241` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_242` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_243` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_244` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_245` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_246` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_247` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_248` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_249` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_25` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_250` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_251` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_252` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_253` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_254` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_255` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_256` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_257` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_258` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_259` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_26` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_260` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_261` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_262` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_263` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_264` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_265` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_266` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_267` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_268` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_269` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_27` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_270` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_271` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_272` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_273` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_274` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_275` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_276` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_277` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_278` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_279` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_28` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_280` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_281` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_282` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_283` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_284` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_285` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_286` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_287` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_288` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_289` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_29` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_290` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_291` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_292` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_293` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_294` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_295` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_296` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_297` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_298` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_299` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_30` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_300` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_301` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_302` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_303` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_304` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_305` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_306` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_307` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_308` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_309` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_31` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_310` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_311` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_312` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_313` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_314` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_315` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_316` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_317` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_318` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_319` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_32` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_320` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_321` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_322` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_323` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_324` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_325` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_326` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_327` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_328` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_329` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_33` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_330` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_331` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_332` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_333` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_334` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_335` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_336` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_337` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_338` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_339` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_34` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_340` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_341` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_342` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_343` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_344` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_345` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_346` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_347` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_348` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_349` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_35` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_350` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_351` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_352` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_353` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_354` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_355` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_356` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_357` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_358` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_359` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_36` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_360` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_361` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_362` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_363` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_364` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_365` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_366` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_367` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_368` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_369` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_37` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_370` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_371` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_372` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_373` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_374` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_375` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_376` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_377` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_378` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_379` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_38` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_380` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_381` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_382` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_383` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_384` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_385` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_386` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_387` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_388` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_389` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_39` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_390` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_391` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_392` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_393` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_394` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_395` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_396` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_397` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_398` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_399` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_40` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_400` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_401` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_402` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_403` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_404` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_405` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_406` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_407` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_408` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_409` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_41` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_410` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_411` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_412` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_413` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_414` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_415` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_416` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_417` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_418` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_419` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_42` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_420` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_421` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_422` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_423` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_424` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_425` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_426` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_427` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_428` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_429` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_43` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_430` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_431` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_432` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_433` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_434` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_435` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_436` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_437` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_438` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_439` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_44` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_440` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_441` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_442` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_443` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_444` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_445` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_446` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_447` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_448` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_449` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_45` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_450` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_451` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_452` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_453` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_454` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_455` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_456` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_457` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_458` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_459` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_46` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_460` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_461` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_462` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_463` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_464` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_465` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_466` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_467` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_468` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_469` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_47` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_470` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_471` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_472` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_473` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_474` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_475` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_476` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_477` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_478` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_479` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_48` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_480` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_481` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_482` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_483` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_484` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_485` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_486` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_487` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_488` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_489` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_49` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_490` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_491` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_492` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_493` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_494` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_5` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_50` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_51` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_52` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_53` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_54` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_55` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_56` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_57` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_58` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_59` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_6` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_60` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_61` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_62` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_63` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_64` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_65` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_66` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_67` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_68` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_69` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_7` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_70` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_71` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_72` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_73` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_74` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_75` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_76` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_77` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_78` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_79` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_8` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_80` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_81` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_82` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_83` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_84` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_85` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_86` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_87` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_88` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_89` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_90` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_91` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_92` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_93` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_94` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_95` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_96` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_97` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_98` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `films_ibfk_99` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_categorie`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
