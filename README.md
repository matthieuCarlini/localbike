Projet DBT de fin de formation Databird
exemple d'analyse sur le dataset localbike

### Computing

les données de la base opérationnelle sont dans bigquery : localbike
le données de traitement dbt sont dans bigquery : 
 - databird_stg_localbike (views)
 - databird_int_localbike (views)
 - databird_mrt_localbike (tables)

### git

le projet est vesrsionné sur github : https://github.com/matthieuCarlini/localbike

### Structuration DBT

utilisation des couches bronze, silver et gold de l'architecture medaillon

Plusieurs options étaient possibles pour le choix de modélisation. 
le choix retenu pour déployer rapidement est le suivant : 
- le bronze sera de type ODS, sans transformation par rapport à la source excepté la mise de FK si nécessaire
- le silver sera une modélisation Kimball avec deux tables de faits et des dimensions. Si une historisation était nécessaire, il faudrait faire du SCD type
2 dans les dimensions avec une logique de snapshots (https://docs.getdbt.com/docs/build/snapshots)
- le gold contiendra le DM avec 
 * une table de fait de type OBT contenant les order items et la plupart des axes d'analyses pour un outil de BI en self service.
pas d'agrégation pour laisser la liberter d'agréger selon les dimensions voulens dans le tableau de bord, en revanche on calcul le total_amout par order item.
 * une table de fait agrégée comprenant le comportement d'achat des customers

Une option plus complexe mais plus satisfaisante a été écartée : 
- bronze de type ODS
- silver DWH modélisé DataVault V2 avec une logique objet hubs, satellites, links (utilisation de l'extension DataVault-DBT possible : https://www.getdbt.com/product/data-vault)
- gold DM modélisé Kimball
- platinum dans une couche sématique comme Cube Cloud (https://cube.dev/)

### Dashboard

Utilisation de Preset, solution cloud de superset pour créer un dashboard à 3 onglets

### Semantic layer

Connection de cube cloud pour test
