SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `primer_apellido` varchar(120) NOT NULL,
  `segundo_apellido` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `ingresos` float NOT NULL
);

CREATE TABLE `entrada` (
  `id` int(11) NOT NULL,
  `dinero` float NOT NULL,
  `fecha` datetime NOT NULL,
  `proyecto_id` int(11) NOT NULL DEFAULT 0
);

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `monto` double NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  `estatus` tinyint(1) NOT NULL,
  `limite` datetime NOT NULL DEFAULT current_timestamp(),
  `inicio` datetime DEFAULT NULL
);


ALTER TABLE `cuentas`ADD PRIMARY KEY (`id`);
ALTER TABLE `entrada` ADD PRIMARY KEY (`id`), ADD KEY `fk_proyecto_id` (`proyecto_id`);

ALTER TABLE `proyectos` ADD PRIMARY KEY (`id`), ADD KEY `cuenta_id` (`cuenta_id`);


ALTER TABLE `cuentas` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `entrada` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `proyectos` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `entrada` ADD CONSTRAINT `fk_proyecto_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`);

ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`cuenta_id`) REFERENCES `cuentas` (`id`);
COMMIT;
