#CREATE DATABASE backend;

#Para declarar que DB se va a usar.
#USE backend;

#Sentencia para crear una tabla, o sea un objeto.
CREATE TABLE persons(
	person_id int,
    last_name VARCHAR(45),
    first_name VARCHAR(45),
	address VARCHAR(45),
	city VARCHAR(45) 
);

ALTER TABLE persons ADD email VARCHAR(100);

#Para usar "DROP", hay que tener *MUCHO* cuidado. 

    
    
