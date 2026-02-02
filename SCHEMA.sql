-- =====================================================
-- Base de données : SunShop Sénégal
-- =====================================================

CREATE DATABASE sunshop_senegal;

-- =====================================================
-- Table : clients
-- =====================================================
CREATE TABLE clients (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    ville VARCHAR(50),
    date_inscription DATE
);

-- =====================================================
-- Table : produits
-- =====================================================
CREATE TABLE produits (
    id_produit SERIAL PRIMARY KEY,
    nom_produit VARCHAR(100),
    categorie VARCHAR(50),
    prix_unitaire NUMERIC(10,2)
);

-- =====================================================
-- Table : commandes
-- =====================================================
CREATE TABLE commandes (
    id_commande SERIAL PRIMARY KEY,
    id_client INT REFERENCES clients(id_client),
    date_commande DATE
);

-- =====================================================
-- Table : details_commande
-- =====================================================
CREATE TABLE details_commande (
    id_detail SERIAL PRIMARY KEY,
    id_commande INT REFERENCES commandes(id_commande),
    id_produit INT REFERENCES produits(id_produit),
    quantite INT
);
