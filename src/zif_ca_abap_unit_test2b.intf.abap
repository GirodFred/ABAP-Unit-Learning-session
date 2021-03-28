INTERFACE zif_ca_abap_unit_test2b

  PUBLIC .
  METHODS is_material_for_sales_type
    IMPORTING
      material_number TYPE char40
      sales_type      TYPE char4
    RETURNING
      VALUE(result)   TYPE abap_bool
    RAISING
      zcx_ca_abap_unit_test2.


ENDINTERFACE.
