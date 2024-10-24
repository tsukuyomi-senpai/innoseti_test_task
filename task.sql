
-- Вставка данных в таблицу
------------------------------

INSERT INTO invoice (uid, amount, arrival_city_name, arrival_city_uid, arrival_date, arrival_kladr, cargo_kind, created_date_time, date, departure_city_name, departure_city_uid, departure_kladr, freight_in_kops, net_volume, net_weight, number, updated_date_time, insurance_company, transport_company, channel_name)
VALUES
(gen_random_uuid(), 5312, 'Черняховск', gen_random_uuid(), '2024-10-31', '000000001', 'Ноутбуки', CURRENT_TIMESTAMP, '2024-24-10', 'Санкт-Петербург', gen_random_uuid(), '10000000', 100000, 10.5, 17.2, '123123124124', CURRENT_TIMESTAMP, 'RGS', 'Грузовичкофф', 'Alfa-Dellin'),
(gen_random_uuid(), 52, 'Калининград', gen_random_uuid(), '2024-10-25', '000000002', 'Сервера', CURRENT_TIMESTAMP, '2024-24-10', 'Москва', gen_random_uuid(), '20000000', 120000, 15.6, 16.5, '14124144444', CURRENT_TIMESTAMP, 'Renins', 'ДЛ', 'Alfa-Dellin'),
(gen_random_uuid(), 1412, 'Москва', gen_random_uuid(), '2024-12-06', '000000003', 'Мониторы', CURRENT_TIMESTAMP, '2024-24-10', 'Камчатка', gen_random_uuid(), '20000000', 150000, 12.4, 10.5, '2', CURRENT_TIMESTAMP, 'ГРС', 'СКУФ', 'Alfa-Dellin');

INSERT INTO distinct_policy (invoice_object_uid, invoice_type_id, invoice_object_number, invoice_object_date, policy_created_date_time, channel_name, key, id)
VALUES
(gen_random_uuid(), '234', '123-31243275', '2024-12-06', CURRENT_TIMESTAMP, 'Alfa-Dellin', 'key123874913', gen_random_uuid()),
(gen_random_uuid(), '256', '123-78623847', '2024-10-25', CURRENT_TIMESTAMP, 'Renins-Skif', 'key123832472', gen_random_uuid());

------------------------------

-- A. возвращающий все накладные за второй квартал 2022 года

SELECT * FROM invoice WHERE date >= '2022-04-01' AND date <= '2022-07-01';

-- Б. возвращающий все накладные, у которых есть полисы, созданные за период с 2 по 10 марта

SELECT *, uid FROM invoice
JOIN distinct_policy ON invoice.uid = distinct_policy.invoice_object_uid
WHERE policy_created_time >= '2022-03-02 00:00:00' AND policy_created_time <= '2022-03-10 23:00:00';

-- В. обновляющий накладные, у которых город прибытия «Калининград»

UPDATE invoice SET amount = 123, cargo_kind = 'что-то новое', departure_city_name = 'Советск' WHERE arrival_city_name = 'Калининград';
