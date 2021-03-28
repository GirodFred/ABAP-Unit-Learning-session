CLASS zcl_ca_abap_unit_test2a DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_ca_abap_unit_test2a.

ENDCLASS.



CLASS zcl_ca_abap_unit_test2a IMPLEMENTATION.

  METHOD zif_ca_abap_unit_test2a~get_material_type.
    " Select blabla

    " If nothing found -> bigboumbadaboum
    RAISE EXCEPTION TYPE zcx_ca_abap_unit_test2
      EXPORTING
        textid = zcx_ca_abap_unit_test2=>material_does_not_exist.
  ENDMETHOD.

ENDCLASS.

