# If necessary, uncomment the line below to include explore_source.


# include: "formation_novembre_2023.model.lkml"

view: native_derivated_view {
  derived_table: {
    explore_source: vehicules {
      column: count2019 { field: caracteristiques.count2019 }
      column: count2020 { field: caracteristiques.count2020 }
      column: count2021 { field: caracteristiques.count2021 }
    }
  }
  dimension: count2019 {
    description: ""
    type: number
  }
  dimension: count2020 {
    description: ""
    type: number
  }
  dimension: count2021 {
    description: ""
    type: number
  }
}
