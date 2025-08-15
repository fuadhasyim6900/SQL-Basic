-- Create Table
create table mahasiswa (
	nim int primary key,
	nama varchar,
	tinggi_badan float);
-- Add Column
alter table mahasiswa
add column berat_badan int;

-- Drop Column
alter table mahasiswa 
drop column Tinggi_badan;

-- Rename Column 
alter table mahasiswa 
rename column nama
to nama_lengkap;

-- Set Not Null 
alter table mahasiswa 
alter column nama_lengkap set not null;

-- Rename Table
alter table mahasiswa 
rename to mahasiswa_oxford;

-- Truncate Table 
truncate table mahasiswa_oxford; 

-- Drop Table
drop table mahasiswa_oxford;