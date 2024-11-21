SELECT nombre AS "nombre_producto", solicitud
FROM
  (
      SELECT id_producto, 
				 COUNT(id_producto) AS "solicitud"
      FROM hechos_venta
      GROUP BY id_producto
      HAVING COUNT(id_producto) > 0
  ) a
INNER JOIN dim_producto b ON a.id_producto = b.id_producto
/*uniendo con dimension Producto*/


		


	
	