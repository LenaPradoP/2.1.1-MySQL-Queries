
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

