
- Consultas en Tienda

SELECT nombre FROM tienda.producto;
SELECT nombre, precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre, precio, precio * 1.04 FROM tienda.producto;
SELECT nombre AS nombre_de_producto, precio AS euros, precio * 1.04 AS dolares_americanos FROM tienda.producto;
SELECT UPPER(nombre), precio FROM tienda.producto;
SELECT LOWER(nombre), precio FROM tienda.producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM tienda.fabricante;
SELECT nombre, ROUND(precio) FROM tienda.producto;
SELECT nombre, TRUNCATE(precio, 0) FROM tienda.producto;
SELECT codigo_fabricante FROM tienda.producto;
SELECT DISTINCT codigo_fabricante FROM tienda.producto;
SELECT nombre FROM tienda.fabricante ORDER BY nombre ASC;
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
SELECT nombre FROM tienda.producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM tienda.fabricante LIMIT 5;
SELECT * FROM tienda.fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM tienda.producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = 2;
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio ASC LIMIT 1;
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;
SELECT p.nombre, p.precio, f.nombre As fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT p.nombre, p.precio, f.nombre As fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
SELECT p.nombre, p.precio, f.nombre As fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE (f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate');
SELECT p.nombre, p.precio, f.nombre As fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT p.nombre, p.precio, f.nombre As fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre, p.precio, f.nombre As fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT DISTINCT f.codigo, f.nombre FROM tienda.fabricante f JOIN tienda.producto p ON f.codigo = p.codigo_fabricante;
SELECT f.nombre, p.nombre AS producto FROM tienda.fabricante f LEFT JOIN tienda.producto p ON f.codigo = p.codigo_fabricante;
SELECT f.nombre FROM tienda.fabricante f LEFT JOIN tienda.producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;
SELECT * FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = 'Lenovo');
SELECT * FROM tienda.producto WHERE precio = (SELECT MAX(precio) FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = 'Lenovo'));
SELECT p.nombre FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
SELECT p.nombre FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;
SELECT p.* FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= (SELECT MAX(p2.precio) FROM tienda.producto p2 JOIN tienda.fabricante f2 ON p2.codigo_fabricante = f2.codigo WHERE f2.nombre = 'Lenovo');
SELECT p.* FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(precio) FROM tienda.producto WHERE codigo_fabricante = p.codigo_fabricante);

- Consultas en Universidad

SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM universidad.persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM universidad.persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT * FROM universidad.asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento FROM universidad.profesor AS pr JOIN universidad.persona AS p ON pr.id_profesor = p.id JOIN universidad.departamento AS d ON pr.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM universidad.alumno_se_matricula_asignatura AS am JOIN universidad.asignatura AS a ON am.id_asignatura = a.id JOIN universidad.curso_escolar AS ce ON am.id_curso_escolar = ce.id JOIN universidad.persona AS p ON am.id_alumno = p.id WHERE p.nif = '26902806M';
SELECT DISTINCT d.nombre AS departamento FROM universidad.departamento AS d JOIN universidad.profesor AS p ON d.id = p.id_departamento JOIN universidad.asignatura AS a ON p.id_profesor = a.id_profesor JOIN universidad.grado AS g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM universidad.persona AS p JOIN universidad.alumno_se_matricula_asignatura AS am ON p.id = am.id_alumno JOIN universidad.curso_escolar AS ce ON am.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

SELECT d.nombre AS nom_departament, p.apellido1, p.apellido2, p.nombre FROM universidad.profesor pr LEFT JOIN universidad.departamento d ON pr.id_departamento = d.id JOIN universidad.persona p ON pr.id_profesor = p.id ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT p.apellido1, p.apellido2, p.nombre FROM universidad.profesor pr LEFT JOIN universidad.departamento d ON pr.id_departamento = d.id JOIN universidad.persona p ON pr.id_profesor = p.id WHERE pr.id_departamento IS NULL;
SELECT d.nombre AS departamento FROM universidad.departamento d RIGHT JOIN universidad.profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;
SELECT p.apellido1, p.apellido2, p.nombre FROM universidad.profesor pr LEFT JOIN universidad.asignatura a ON pr.id_profesor = a.id_profesor JOIN universidad.persona p ON pr.id_profesor = p.id WHERE a.id_profesor IS NULL;
SELECT a.nombre FROM universidad.asignatura a LEFT JOIN universidad.profesor pr ON a.id_profesor = pr.id_profesor WHERE pr.id_profesor IS NULL;
-Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.


SELECT COUNT(*) AS total_alumnos FROM universidad.persona WHERE tipo = 'alumno';
SELECT COUNT(*) AS alumnos_nacimiento_1999 FROM universidad.persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre AS departamento, COUNT(pr.id_profesor) AS total_professores FROM universidad.departamento d JOIN universidad.profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY total_professores DESC;
SELECT d.nombre AS departamento, COUNT(pr.id_profesor) AS total_professores FROM universidad.departamento d LEFT JOIN universidad.profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre;
SELECT g.nombre AS grado, COUNT(a.id) AS total_asignaturas FROM universidad.grado g LEFT JOIN universidad.asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY total_asignaturas DESC;
SELECT g.nombre AS grado, COUNT(a.id) AS total_asignaturas FROM universidad.grado g LEFT JOIN universidad.asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40;
SELECT g.nombre AS grado, a.tipo, SUM(a.creditos) AS suma_creditos FROM universidad.grado g JOIN universidad.asignatura a ON g.id = a.id_grado GROUP BY g.id, a.tipo;
SELECT ce.anyo_inicio AS inicio, COUNT(am.id_alumno) AS numero_alumnos FROM universidad.curso_escolar ce JOIN universidad.alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar GROUP BY ce.id;
SELECT pr.id_profesor, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS numero_asignaturas FROM universidad.profesor pr LEFT JOIN universidad.asignatura a ON pr.id_profesor = a.id_profesor JOIN universidad.persona p ON pr.id_profesor = p.id GROUP BY pr.id_profesor ORDER BY numero_asignaturas DESC;
SELECT * FROM universidad.persona WHERE id = (SELECT id FROM universidad.persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1);
SELECT pr.id_profesor, p.nombre, p.apellido1, p.apellido2 FROM universidad.profesor pr LEFT JOIN universidad.persona p ON pr.id_profesor = p.id WHERE pr.id_departamento IS NOT NULL AND pr.id_profesor NOT IN (SELECT id_profesor FROM universidad.asignatura);


