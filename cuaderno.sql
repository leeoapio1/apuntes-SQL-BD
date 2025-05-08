# Cuaderno SQL
select nombre_estudiante, rut_estudiante
from  estudiante

select *
from estudiante

select *
from estado_civil

-- mostrar estudiantes que se llaman ronaldo y mostrar su estado civil
select est.nombre_estudiante, e_c.nombre_estado_civil
from  estudiante as est, estado_civil as e_c 
where est.id_estado_civil = e_c.id_estado_civil
       and est.nombre_estudiante = 'ronaldo' 

-- filtrar por nombre de los estudiantes y sus ciudades
select est.nombre_estudiante, ciu.nombre_ciudad
from estudiante as est, ciudad as ciu
where est.id_ciudad = ciu.id_ciudad

-- mostrar todos los datos en las tablas de los  estudiantes 
select est.nombre_estudiante, ciu.nombre_ciudad, e_c.nombre_estado_civil
from estudiante as est, ciudad as ciu, estado_civil as e_c
where est.id_ciudad = ciu.id_ciudad
and est.id_estado_civil = e_c.id_estado_civil


select est.nombre_estudiante, ciu.nombre_ciudad, e_c.nombre_estado_civil
from estudiante as est, ciudad as ciu, estado_civil as e_c
where est.id_ciudad = ciu.id_ciudad
and est.id_estado_civil = e_c.id_estado_civil
and (e_c.nombre_estado_civil = 'soltero') 
or (e_c.nombre_estado_civil = 'casado')


-- filtrar por los estudiantes que esten casados o solteros 
select est.nombre_estudiante, ciu.nombre_ciudad, e_c.nombre_estado_civil
from estudiante as est, ciudad as ciu, estado_civil as e_c
where est.id_ciudad = ciu.id_ciudad
and est.id_estado_civil = e_c.id_estado_civil
and (e_c.nombre_estado_civil = 'soltero'
or e_c.nombre_estado_civil = 'casado')

-- filtrar por los estudiantes por su estado civil, su ciudad y nombre
select est.nombre_estudiante, ciu.nombre_ciudad, e_c.nombre_estado_civil
from estudiante as est, ciudad as ciu, estado_civil as e_c
where est.id_ciudad = ciu.id_ciudad
and est.id_estado_civil = e_c.id_estado_civil
and e_c.nombre_estado_civil in ('soltero','casado')

-- nombre de los estudiantes con estado civil que contienen la letra i 
-- filtrar por una letra o cualquier caracter el * remplaza varios caracteres y el _ remplaza solo 1 
select est.nombre_estudiante, e_c.nombre_estado_civil
from estudiante as est, estado_civil as e_c
where est.id_estado_civil = e_c.id_estado_civil
and e_c.nombre_estado_civil like '%i%'

--mostrar estados civiles en el cual el id_estado_civil se encuentra en rango de 1 a 3 
--filtrar entre rangos numericos
select est.nombre_estudiante, e_c.id_estado_civil
from estudiante as est, estado_civil as e_c
where est.id_estado_civil = e_c.id_estado_civil
and e_c.id_estado_civil between '1' and '3'

--filtrar solo el id
select e_c.nombre_estado_civil
from estado_civil as e_c
where e_c.id_estado_civil >= 1 and e_c.id_estado_civil <= 3

--determinar los estudiantes que viven en una ciudad con cuyo nombre  contiene la letra a o la letra e y el id ciudad es 1 o 3
select est.nombre_estudiante, ciu.nombre_ciudad, ciu.id_ciudad
from estudiante as est, ciudad as ciu
where est.id_ciudad = ciu.id_ciudad 
and ciu.id_ciudad like '%n%'

--identificar las ciudades que contienen en su nombre  la letra n y viven estudiantes que no son solteros ni divorciados 

 select ciu.nombre_ciudad, e_c.nombre_estado_civil 
 from ciudad as ciu, estado_civil as e_c, estudiante as est
 where ciu.id_ciudad = est.id_ciudad and e_c.id_estado_civil = est.id_estado_civil 
 and ciu.nombre_ciudad like '%n%' 
 and e_c.nombre_estado_civil not in ('soltero' , 'divorciado')
 --para que no se repitan estos datos, es necesario a la hora de hacer los joins precurar que no se repitan los datos repetidos entre las mismas tablas 
  --%n% antes de la n o despues puede haber caracteres atras o adelante, _n_ solo puede haber un caraccter adelante o atras de la n
