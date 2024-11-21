SELECT 
		nombre_producto, 
		solicitud, 
		nombre AS "nombre_mercado" FROM
		(
			SELECT nombre AS "nombre_producto", id_mercado, solicitud
			FROM
			  (
			      SELECT id_producto, 
					       id_mercado,
							 COUNT(id_producto) AS "solicitud"
			      FROM hechos_venta
			      GROUP BY id_producto, id_mercado
			      HAVING COUNT(id_producto) > 0
			  ) a
			INNER JOIN dim_producto b ON a.id_producto = b.id_producto
			/*uniendo con dimension Producto*/
		) c

INNER JOIN dim_mercado d ON c.id_mercado = d.id_mercado;
/*uniendo con dimension Mercado*/

		


	
	