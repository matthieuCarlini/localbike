Projet DBT de fin de formation Databird
exemple d'analyse sur le dataset localbike

### Computing

les données de la base opérationnelle sont dans bigquery : localbike
le données de traitement dbt sont dans bigquery : Databird

### git

le projet est vesrsionné sur github : https://github.com/matthieuCarlini/localbike

### Structuration DBT

utilisation des couches bronze, silver et gold de l'architecture medaillon
- le bronze sera de type ODS, sans transformation par rapport à la source excepté la mise de FK si nécessaire
- le silver sera de type DWH, avec dataquality et jointures, mais un minimum voire pas de calculs et d'agrégations
- le gold contiendra le DM

