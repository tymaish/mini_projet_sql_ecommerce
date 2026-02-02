
-- =====================================================
-- ANALYSE SQL – MINI PROJET E-COMMERCE (SÉNÉGAL)
-- =====================================================


-- Question 1 : Les clients sont inscrits au total 
SELECT COUNT(*) FROM clients;

-- Question 2 :Les clients habitent à Dakar 
SELECT COUNT(id_client)
FROM clients
WHERE ville = 'Dakar';

-- Question : 3 les clients inscrits après le 1er mars 2024 
SELECT prenom, nom, date_inscription
FROM clients
WHERE date_inscription > '2024-03-01';

-- Question 4 : Nombre de commandes passées
SELECT  COUNT(id_commande)
FROM commandes;

-- Question 5 : Nombre de commandes par client
SELECT c.prenom, c.nom, COUNT(co.id_commande) as Nombre_Commandes
FROM commandes co
JOIN clients c on c.id_client = co.id_client
GROUP BY c.prenom, c.nom
ORDER BY Nombre_Commandes DESC;

-- Question 6 : Les produits dont le prix est supérieur à 10 000 FCFA ?
SELECT nom_produit, prix_unitaire
 FROM produits
WHERE prix_unitaire > 10000;

-- Question 7 : montant total vendu par produit
SELECT p.nom_produit,
       SUM(dc.quantite * p.prix_unitaire) AS montant_total_vendu
FROM produits p
JOIN details_commande dc ON p.id_produit = dc.id_produit
GROUP BY p.nom_produit;

-- Question 8 : Les produits les plus vendus
SELECT p.nom_produit, sum(dc.quantite) Total_Vendu
FROM details_commande dc
JOIN produits p on dc.id_produit = p.id_produit
GROUP BY p.nom_produit
ORDER BY Total_Vendu desc;

-- Question 9 : Le chiffre d’affaires total de la boutique
SELECT sum(dc.quantite * p.prix_unitaire) as Chiffre_d_affaires
FROM produits p
JOIN details_commande dc ON p.id_produit = dc.id_produit;


-- Question 10 : Les clients les plus actifs
SELECT c.prenom, c.nom,
 COUNT(co.id_commande) as Nombre_de_commandes
 FROM clients c
 JOIN commandes co ON c.id_client = co.id_client
 GROUP BY c.prenom, c.nom
 ORDER BY Nombre_de_commandes DESC;