-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 08 jan. 2020 à 15:17
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `livesymfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `titre`, `slug`, `contenu`, `created_at`, `updated_at`, `featured_image`, `users_id`) VALUES
(1, 'Macbook Pro', 'macbook-pro', 'pc portable', '2020-01-08 14:50:06', '2020-01-08 14:50:06', '5e15de0eb80d8660519025.jpg', 3);

-- --------------------------------------------------------

--
-- Structure de la table `articles_categories`
--

CREATE TABLE `articles_categories` (
  `articles_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `articles_categories`
--

INSERT INTO `articles_categories` (`articles_id`, `categories_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `articles_mots_cles`
--

CREATE TABLE `articles_mots_cles` (
  `articles_id` int(11) NOT NULL,
  `mots_cles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`, `slug`) VALUES
(1, 'Ordinateur Portable', 'ordinateur-portable');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id` int(11) NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rgpd` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `articles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191012122013', '2020-01-08 11:37:35'),
('20191012123216', '2020-01-08 11:37:35'),
('20191012123603', '2020-01-08 11:37:35'),
('20191012124140', '2020-01-08 11:37:35'),
('20191012124959', '2020-01-08 11:37:36'),
('20191012125251', '2020-01-08 11:37:36'),
('20191012125525', '2020-01-08 11:37:37'),
('20191012125853', '2020-01-08 11:37:37'),
('20191012130005', '2020-01-08 11:37:37'),
('20191012130115', '2020-01-08 11:37:37'),
('20191012130207', '2020-01-08 11:37:37');

-- --------------------------------------------------------

--
-- Structure de la table `mots_cles`
--

CREATE TABLE `mots_cles` (
  `id` int(11) NOT NULL,
  `mot_cle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`) VALUES
(3, 'lois.bertrand78@gmail.com', '[\"ROLE_USER\",\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$R0xBWU91dVIyZS9SRW1nTw$/uj1lpLkXZpZ31OwcOSgrV7OJ3iCpQrJMeN6k79tREM'),
(4, 'laurent@gmail.com', '[\"ROLE_USER\",\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$R2ZYdERLeFBTMURmQ3c2bw$1YO9YPy3wnjvD0d0OQsCyPxBQamCZtCFEwSsW8sxzSk'),
(5, 'test@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Ymp0aHhqYTNmV2NpVWYxRw$elkxUdf1MF730plynrP7k9GXqzFMDb7NTqYz94Qd2zk');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BFDD316867B3B43D` (`users_id`);

--
-- Index pour la table `articles_categories`
--
ALTER TABLE `articles_categories`
  ADD PRIMARY KEY (`articles_id`,`categories_id`),
  ADD KEY `IDX_DE004A0E1EBAF6CC` (`articles_id`),
  ADD KEY `IDX_DE004A0EA21214B7` (`categories_id`);

--
-- Index pour la table `articles_mots_cles`
--
ALTER TABLE `articles_mots_cles`
  ADD PRIMARY KEY (`articles_id`,`mots_cles_id`),
  ADD KEY `IDX_2927AB461EBAF6CC` (`articles_id`),
  ADD KEY `IDX_2927AB46C0BE80DB` (`mots_cles_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D9BEC0C41EBAF6CC` (`articles_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `mots_cles`
--
ALTER TABLE `mots_cles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mots_cles`
--
ALTER TABLE `mots_cles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `FK_BFDD316867B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `articles_categories`
--
ALTER TABLE `articles_categories`
  ADD CONSTRAINT `FK_DE004A0E1EBAF6CC` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DE004A0EA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `articles_mots_cles`
--
ALTER TABLE `articles_mots_cles`
  ADD CONSTRAINT `FK_2927AB461EBAF6CC` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2927AB46C0BE80DB` FOREIGN KEY (`mots_cles_id`) REFERENCES `mots_cles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `FK_D9BEC0C41EBAF6CC` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
