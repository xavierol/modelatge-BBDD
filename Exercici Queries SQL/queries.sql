Exercici Queries SQL


⦁ Quantitat de registres de la taula de vols:

SELECT COUNT(*) FROM flights;


⦁ Retard promig de sortida i arribada segons l’aeroport origen:

SELECT origin, AVG(ArrDelay) AS prom_arribades, AVG(DepDelay) AS prom_sortides 
FROM flights 
GROUP BY origin;



⦁ Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més, volen que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):

SELECT origin, colYear, colMonth, AVG(ArrDelay) AS prom_arribades 
FROM flights 
GROUP BY origin, colYear, colMonth 
ORDER BY origin, colYear ASC;


⦁ Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat:

SELECT City, colYear, colMonth, AVG(ArrDelay) AS prom_arribades 
FROM flights INNER JOIN usairports ON flights.Dest=usairports.IATA 
GROUP BY City, colYear, colMonth 
ORDER BY City, colYear ASC;

