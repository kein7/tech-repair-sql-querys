USE tech_repair

INSERT INTO estados VALUES ('Preparación'),('En reparación'),('Reparado'),('Listo')

INSERT INTO direcciones VALUES ('Alameda','241',NULL,'Santiago Centro'),
('Av. La florida','1523',NULL,'La Florida'),
('Vicuña Mackena','421',NULL,'Puente Alto'),
('Av Libertador Bernardo OHiggins','227',NULL,'Santiago Centro')

INSERT INTO direcciones VALUES ('Brasil',254,24,'Santiago Centro')

DELETE FROM direcciones 
DBCC CHECKIDENT (direcciones, RESEED, 0)

INSERT INTO planes VALUES ('Cambio Pantalla - Gama alta','250000','Op','5 dias'),
('Cambio Pantalla - Gama media alta','150000','Op','5 dias'),
('Cambio Pantalla - Gama media','70000','Op','5 dias'),
('Cambio Pantalla - Gama baja','30000','Op','5 dias')

DELETE FROM planes
DBCC CHECKIDENT (planes, RESEED, 0)

INSERT INTO clientes VALUES (1,'Juan Carlos','Romero','Diaz','19124643','2','juanCarlos_r@gmail.com','943521253'),
(2,'Carlos Martin','Donoso','Valenzuela','16343241','2','carlos_d_v@gmail.com','964537123'),
(3,'Lucia Paz','Olivares','Acevedo','18765432','2','luci123@gmail.com','985475311'),
(4,'Almendra Josefa','Fuentes','Martinez','20765234','2','alfm@gmail.com','918564615')
INSERT INTO clientes VALUES (5,'Marcela Camila','Rosas','Marengo','16342471','2','mCamilaRMar@gmail.com','957698532')


DELETE FROM clientes
DBCC CHECKIDENT (clientes, RESEED, 0)

INSERT INTO tecnicos VALUES ('Andres Ignacio','Morales','Vasquez','17653122','5','andresMV@gmail.com','943521253'),
('Alexis Tomas','Salinas','Ramirez','18453452','3','asr7@gmail.com','954354234'),
('Raul Esteban','Aro','Correa','19565499','6','r9@gmail.com','965412135'),
('Javier Ignacio','Gonzalez','Olivares','12342643','3','jigonol2@gmail.com','923436549')

INSERT INTO tecnicos VALUES ('Mario Hugo','Torres','Lopez','18623232','5','MTlopez@gmail.com','983126871')

INSERT INTO terceros VALUES ('4124543','Francisca Monserrat','Mora','Sepulveda','20834835','4'),
('6535618','Alejandro Ramon','Muñoz','Lopez','17834532','7'),
('9876721','Francisco Luis','Castillo','Ruiz','18434862','3'),
('2314543','Laura Camila','Torres','Morales','12543665','1')
INSERT INTO terceros VALUES ('6435234','Camila Luisa','Morales','Castillo','15343342','2')

INSERT INTO gamas VALUES ('Alta'),
('Media alta'),
('Media'),
('Baja')

INSERT INTO ordenes (tecnico_id,estado_id,telefono_id,cliente_id,plan_id,tercero_id) VALUES (1,1,1,1,1,1),
(2,1,2,2,1,2),
(3,1,3,3,1,3),
(4,1,4,4,1,4)
(5,3,5,5,1,5)