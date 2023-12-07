
include: "/views/caracteristiques.view.lkml"
view: +caracteristiques {

  measure: accidents_2019 {
    type: count
    filters: [an: "2019"]
    drill_fields: [dep, adr, num_acc]
  }
  measure: accidents_2020 {
    type: count
    filters: [an: "2020"]
    drill_fields: [dep, adr, num_acc]
  }
  measure: accidents_2021 {
    type: count
    filters: [an: "2021"]
    drill_fields: [dep, adr, num_acc]
  }
 }
