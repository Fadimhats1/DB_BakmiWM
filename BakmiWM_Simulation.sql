USE BakmiWM

-- 1. Simulasi ketika pelanggan baru ingin memesan menu makanan
-- Pertama - tama pelanggan harus mendaftarkan diri terlebih dahulu

BEGIN TRAN

INSERT INTO Customer VALUES ('CU011', 'Thomas Miles', 'Male', '083572618263', 'thomas.miles.com', 'Jalan Otista no. 93')

ROLLBACK
COMMIT

SELECT * FROM MenuTranDetail

-- Lalu ketika pelanggan telah mendaftarkan diri, pelanggan akan memilih menu, disini pelanggan akan memilih 3 menu

BEGIN TRAN

INSERT INTO MenuTransaction VALUES ('MT016', 'SF002', 'CU011', '2021-12-31')

INSERT INTO MenuTranDetail VALUES 
('MT016', 'ME004', 4),
('MT016', 'ME002', 1),
('MT016', 'ME003', 2)

ROLLBACK
COMMIT

-- 2. Simulasi ketika pelanggan yang sudah terdaftar ingin memesan souvenir

BEGIN TRAN

INSERT INTO SouvenirTransaction VALUES ('ST017', 'SF008', 'CU008', '2021-12-31')

INSERT INTO SouvenirTranDetail VALUES 
('ST017', 'SO004', 4),
('ST017', 'SO008', 5),
('ST017', 'SO001', 3),
('ST017', 'SO009', 2)

ROLLBACK
COMMIT

-- 3. Simulasi ketika staff ingin mengedit transaksi dari souvenir dikarenakan terjadi kesalahan input

UPDATE SouvenirTranDetail SET Qty = 3 WHERE SouvenirTranID LIKE 'ST016' AND SouvenirID LIKE 'SO002'

-- 4. Simulasi ketika ingin menghapus karyawan yang sebelum nya terdaftar

BEGIN TRAN

DELETE Staff WHERE StaffID LIKE 'SF005'

ROLLBACK
COMMIT

-- 5. Simulasi ketika staff ingin mengupdate harga menu menjadi lebih mahal dikarenakan harga BBM naik

BEGIN TRAN

UPDATE Menu SET MenuPrice = 27000 WHERE MenuID LIKE 'ME001'

ROLLBACK
COMMIT