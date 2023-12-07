include: "/views/usagers.view.lkml"
view: +usagers {



  dimension: age_range_accident_moment {
    type:  string
    sql: case
            when (${caracteristiques.an} - ${an_nais}) <=15 then 'Enfant'
            when (${caracteristiques.an} - ${an_nais}) <=24 then 'Adolescent'
            when (${caracteristiques.an} - ${an_nais}) <=64 then 'Adulte'
            else 'Aine'
            end;;
    label: "tranche age moment accident"
  }

  dimension: gender {
    type: string
    sql: case
             when ${sexe} = 1 then 'Masculin'
             when ${sexe} = 2 then 'Feminin'
             end;;
    label: "Genre"
  }

  dimension: gravity {
    type: string
    sql: case
              when ${grav} = 2 then 'Accident mortel'
              else 'Accident non mortel'
         end;;
    label: "Gravite"
  }

  dimension: user_category{
    type: string
    sql: case
              when ${catu} = 1 then 'Conducteur'
              else 'Non conducteur'
         end;;
    label: "Categorie personne"
  }

  dimension: traject_purpose{
    type: string
    sql: case
              when ${trajet} = 1 then 'Domicile – travail'
              when ${trajet} in (-1, 0) then 'Non renseigné'
              else 'Hors domicile – travail'
          end;;
    label: "motif trajet"
  }





}
