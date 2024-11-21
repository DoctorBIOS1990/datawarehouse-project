SELECT nombre, ventas_por_mercados
FROM
  (
      SELECT id_mercado,
				 SUM(monto) AS "ventas_por_mercados"
      FROM hechos_venta
      GROUP BY id_mercado
      HAVING SUM(monto) > 0
  ) a
INNER JOIN dim_mercado b ON a.id_mercado = b.id_mercado
/*uniendo con dimension Mercado*/


		


	
	