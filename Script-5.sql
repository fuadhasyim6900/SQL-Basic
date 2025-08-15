
--create Table students
CREATE TABLE students(
    id INTEGER PRIMARY KEY,
    nama VARCHAR,
    institute VARCHAR,
    berat_badan FLOAT,
    tinggi_badan FLOAT);
--data students
INSERT INTO public.students (id, nama, institute, berat_badan, tinggi_badan)
VALUES
    (1, 'Joko kendil', 'Universitas Indonesia', 65.5, 172.0),
    (2, 'Budi krempeng', 'Institut Teknologi Bandung', 72.3, 178.5),
    (3, 'Otong surotong', 'Universitas Gadjah Mada', 54.8, 160.2),
    (4, 'Eko ganteng', 'Universitas Diponegoro', 59.0, 165.4),
    (5, 'Ucup surucup', 'Universitas Airlangga', 68.7, 170.0);

SELECT * FROM students;
