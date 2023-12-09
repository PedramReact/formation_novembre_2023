include: "/views/usagers.view.lkml"
view: +usagers {
  dimension: sexe_label {
    sql: case when ${sexe}=1 then "Masculin"
              when ${sexe}=2 then "Feminin"
              Else "inconnu" end;;
  }
  dimension: usagers_categorie {
    sql: case when ${catu}=1 then "Conducteur"
              when ${catu} in (2,3) then "Non_conducteur"
              Else "Inconnu" end;;
  }
  dimension: gravite_label {
    case: {
      when: {
        label: "mortel"
        sql: ${grav}=2 ;;
      }
      when: {
        label: "non_mortel"
        sql: ${grav} in (1,3,4) ;;
      }
      else: "Inconnu"
    }
  }
  dimension: trajet_label {
    case: {
      when: {
        label: "Domicile-Travail"
        sql: ${trajet}=1 ;;
      }
      when: {
        label: "Hors Domicile-Travail"
        sql: ${trajet} >1 and ${trajet} <9;;
      }
      else: "Inconnu"
    }
  }
}
