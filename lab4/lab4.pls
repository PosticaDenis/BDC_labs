select Model, Viteza, Hd 
from pc_uri 
where Pret < 500;

select Viteza, avg(Pret) as Pret_mediu 
from pc_uri 
group by Viteza;

select P.Producator, P.Model, L.Viteza
from laptop_uri L, produse P
where P.Model = L.Model
and L.Viteza < (select min(Viteza) from pc_uri);

select P.Producator
from  produse P, pc_uri PC
where P.Model = PC.Model
and PC.Ram = (select min(Ram) from pc_uri)
and P.Producator in 
(select P.Producator
from  produse P, imprimante I
where P.Model = I.Model)
group by P.Producator;

select 'Clasa Econom' as clasa, Model, Pret
from laptop_uri
where Pret < 750
union all
select 'Clasa Business' as clasa, Model, Pret
from laptop_uri
where Pret between 750 and 1100
union all
select 'Clasa Premium' as clasa, Model, Pret
from laptop_uri
where Pret >1100;