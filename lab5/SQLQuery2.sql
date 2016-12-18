select * from laptop_uri
select * from pc_uri

insert pc_uri(Cod, Model, Viteza, Ram, Hd, Pret)
(select min(Cod) + 30 as Cod, Model + 100 as Model, 
        max(Viteza) as Viteza, max(Ram) * 2 as Ram, 
		max(Hd) * 2 as Hd, round(max(Pret)/1.5, 2) as Pret
 from laptop_uri
 group by Model)
