-- =========================
-- SZEREPKÖR
-- =========================
CREATE TABLE szerepkor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    leiras VARCHAR(255) NOT NULL
);

-- =========================
-- FELHASZNÁLÓ
-- =========================
CREATE TABLE felhasznalo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    felhasznalonev VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    szuletesi_datum DATE,
    nem VARCHAR(50),
    keresztnev VARCHAR(100),
    vezeteknev VARCHAR(100),
    profil_kep VARCHAR(255),
    mit_keres VARCHAR(100),
    kit_keres VARCHAR(100),
    eloszor_tej BOOLEAN,
    kedvenc_muzli VARCHAR(100),
    kedvenc_tej VARCHAR(100),
    likeok_szama INT DEFAULT 0,
    matchek_szama INT DEFAULT 0,
    regisztracio_idopont TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    utolso_bejelentkezes TIMESTAMP
);

-- =========================
-- FELHASZNÁLÓ SZEREPKÖR
-- =========================
CREATE TABLE felhasznalo_szerepkor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    szerepkor_id INT NOT NULL,
    felhasznalo_id INT NOT NULL,
    
    FOREIGN KEY (szerepkor_id) REFERENCES szerepkor(id) ON DELETE CASCADE,
    FOREIGN KEY (felhasznalo_id) REFERENCES felhasznalo(id) ON DELETE CASCADE,
    
    UNIQUE (szerepkor_id, felhasznalo_id)
);

-- =========================
-- TERMÉK
-- =========================
CREATE TABLE termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    leiras TEXT,
    ar DECIMAL(10,2) NOT NULL
);

-- =========================
-- TERMÉKKATEGÓRIA
-- =========================
CREATE TABLE termekkategoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- TERMÉK KATEGÓRIA KAPCSOLÓ
-- =========================
CREATE TABLE termek_kategoria (
    termek_id INT NOT NULL,
    kategoria_id INT NOT NULL,

    PRIMARY KEY (termek_id, kategoria_id),

    FOREIGN KEY (termek_id) REFERENCES termek(id) ON DELETE CASCADE,
    FOREIGN KEY (kategoria_id) REFERENCES termekkategoria(id) ON DELETE CASCADE
);