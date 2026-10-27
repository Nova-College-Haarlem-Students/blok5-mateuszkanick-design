CREATE TABLE `soort` (
  `soort_id` integer PRIMARY KEY,
  `naam` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `rol` (
  `rol_id` integer PRIMARY KEY,
  `naam` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `gebruiker` (
  `gebruiker_id` integer PRIMARY KEY,
  `rol_id` integer NOT NULL,
  `naam` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `wachtwoord` varchar(255) NOT NULL
);

CREATE TABLE `dier` (
  `dier_id` integer PRIMARY KEY,
  `soort_id` integer NOT NULL,
  `naam` varchar(255) NOT NULL,
  `ras` varchar(255),
  `geslacht` varchar(255) NOT NULL,
  `geboortedatum` date,
  `chipnummer` varchar(255) UNIQUE,
  `foto_url` varchar(255),
  `beschrijving` text,
  `adoptieprijs` decimal(8,2) NOT NULL,
  `verwijderd_op` timestamp
);

CREATE TABLE `aanvraag` (
  `aanvraag_id` integer PRIMARY KEY,
  `gebruiker_id` integer NOT NULL,
  `dier_id` integer NOT NULL,
  `aanvraagdatum` date NOT NULL,
  `status` varchar(255) NOT NULL
);

CREATE TABLE `wijzigingslog` (
  `log_id` integer PRIMARY KEY,
  `verzorger_id` integer NOT NULL,
  `dier_id` integer NOT NULL,
  `tijdstip` timestamp NOT NULL,
  `omschrijving` text NOT NULL
);

ALTER TABLE `dier` ADD FOREIGN KEY (`soort_id`) REFERENCES `soort` (`soort_id`);

ALTER TABLE `gebruiker` ADD FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`);

ALTER TABLE `aanvraag` ADD FOREIGN KEY (`gebruiker_id`) REFERENCES `gebruiker` (`gebruiker_id`);

ALTER TABLE `aanvraag` ADD FOREIGN KEY (`dier_id`) REFERENCES `dier` (`dier_id`);

ALTER TABLE `wijzigingslog` ADD FOREIGN KEY (`verzorger_id`) REFERENCES `gebruiker` (`gebruiker_id`);

ALTER TABLE `wijzigingslog` ADD FOREIGN KEY (`dier_id`) REFERENCES `dier` (`dier_id`);
