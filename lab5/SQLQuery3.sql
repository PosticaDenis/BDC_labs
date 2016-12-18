CREATE UNIQUE INDEX impr ON imprimante(Cod);
CREATE UNIQUE INDEX lptp ON laptop_uri(Cod);
CREATE UNIQUE INDEX pc ON pc_uri(Cod);
CREATE UNIQUE INDEX prd ON produse(Model);

DROP INDEX impr ON imprimante;
DROP INDEX lptp ON laptop_uri;
DROP INDEX pc ON pc_uri;
DROP INDEX prd ON produse;