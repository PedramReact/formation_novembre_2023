
  include: "/views/vin.view.lkml"
  view:  +vin {
    measure: distinct_engine{
    type:  count_distinct
    sql:  ${engine} ;;
    }
      measure: distinct_model{
        type:  count_distinct
        drill_fields: [source*, model]
        sql:  ${model};;
       }


        dimension:  Dealer_Name_Modified
        {
          drill_fields: [dealer_name, Dealer_Name_Modified]
          sql: REPLACE(${dealer_name}, " ", "_");;

         }
        set: source {
          fields: [brand, model,Dealer_Name_Modified]
         }
  }
