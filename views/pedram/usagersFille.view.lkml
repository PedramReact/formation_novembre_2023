include: "/views/usagers.view.lkml"
view: +usagers {
  dimension: regroup_user_Age_accident_2{
    case :{
      when:{
        sql: ${anne_accidents}  - ${an_nais}  <= 14 ;;
        label: "Enfants"
      }
      when:{
        sql: ${anne_accidents} - ${an_nais}   > 15 and  ${anne_accidents}    - ${an_nais}  <= 24 ;;
        label: "Adolescents"
      }
      when:{
        sql: ${anne_accidents}    - ${an_nais}  > 24 and  ${anne_accidents}    - ${an_nais}  <= 64 ;;
        label: "Adultes"
      }
      when:{
        sql: ${anne_accidents}    - ${an_nais}  > 65 ;;
        label: "Aînés"
      }

      else: "inconu"

    }
  }


  dimension: anne_accidents{
    type: number
    sql: ${caracteristiques.an} ;;

  }











#exo 4
  dimension: conducteur{
    description: "si l'usager etait conducteur ou pas"
    case :{
      when:{
        sql: ${catu}=1;;
        label: "Conducteur"
      }
      else: " non_conducteur"

    }
  }
  dimension: accident_mortel{
    description: "accident mortel"
    case :{
      when:{
        sql: ${grav}=2;;
        label: "Accident mortel"
      }
      else: " non_mortel"

    }
  }
  dimension: usagers_sexe {

    case :{
      when:{
        sql: ${sexe}=1;;
        label: "Masculin"
      }
      when:{
        sql: ${sexe}=2;;
        label: "Féminin"
      }
      else: " inconu"

    }

  }

}
