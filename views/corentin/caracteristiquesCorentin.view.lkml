include: "/views/caracteristiques.view.lkml"
view: +caracteristiques{

  dimension_group: current_corentin {
    type:  time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql:  current_date() ;;
  }

  dimension: anciennete_acc_corentin {
    type: number
    sql: ${current_corentin_year}-${an} ;;
  }

  dimension: age_usager_corentin {
    type: number
    sql: ${an} - ${usagers.an_nais}
      ;;
  }

  dimension: age_usager_group {
    type: string
    sql: CASE
          WHEN ${age_usager_corentin} <= 15 THEN 'Enfants'
          WHEN ${age_usager_corentin} >15 and ${age_usager_corentin} <= 24 THEN 'Adolescents'
          WHEN ${age_usager_corentin} >24 and ${age_usager_corentin} <= 64 THEN 'Adultes'
          WHEN ${age_usager_corentin} > 64 THEN 'Aînés'
          ELSE 'inconnu'
        END
          ;;
  }

  dimension: conducteur_ou_pas_corentin{
    sql: CASE
          WHEN ${usagers.catu} = 1 THEN 'conducteur'
          ELSE 'non_conducteurs'
          END ;;
  }

  dimension: sexe_corentin {
    sql: CASE
          WHEN ${usagers.sexe}=1 THEN 'masculin'
          ELSE 'féminin'
          END;;
  }

  dimension: mortel_ou_pas_corentin {
    sql: CASE
          WHEN ${usagers.grav}=2 THEN 'mortel'
          ELSE 'non mortel'
          END  ;;
  }

  dimension_group: accident_corentin {
    type:  time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql:  CAST(concat(${an},'-',${mois},'-',${jour}) as DATE) ;;
  }


  dimension: domicile_ou_non_corentin {
    sql: CASE
            WHEN  ${usagers.trajet} = 1 THEN 'domicile-travail'
            ELSE 'hors domicile_travail'
        END;;
  }

  dimension: adress_link_corentin {
    sql: concat(${adr},' ',${dep}) ;;
    link: {
      label: "Google Maps"
      url: "https://www.google.com/maps/?q={{ value }}"
      icon_url: "https://google.com/favicon.ico"
    }
  }

  dimension: an_hidden_corentin {
    type: number
    sql: ${an} ;;
    hidden: yes
  }

  dimension: departement_corentin {
    type: string
    map_layer_name: departement_france
    sql: ${dep} ;;
  }

  measure: count2020 {
    filters: [an: "2020"]
    type: count
    drill_fields: [dep, adr, num_acc]
  }

  measure: count2021_corentin {
    filters: [an: "2021"]
    type: count
    drill_fields: [dep, adr, num_acc]
  }

  measure: count2019_corentin {
    filters: [an: "2019"]
    type: count
    drill_fields: [dep, adr, num_acc]
  }

  measure: count_corentin {
    type: count
  }

}
