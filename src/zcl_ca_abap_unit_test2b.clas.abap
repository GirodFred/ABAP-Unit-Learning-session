CLASS zcl_ca_abap_unit_test2b DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_ca_abap_unit_test2b.

    METHODS constructor
      IMPORTING
        io_material_data TYPE REF TO zif_ca_abap_unit_test2a OPTIONAL.

    DATA o_material_data TYPE REF TO zif_ca_abap_unit_test2a.


ENDCLASS.


CLASS zcl_ca_abap_unit_test2b IMPLEMENTATION.


  METHOD constructor.
    o_material_data = cond #( when io_material_data is bound
                                then io_material_data
                                else NEW zcl_ca_abap_unit_test2a( ) ).
  ENDMETHOD.


  METHOD zif_ca_abap_unit_test2b~is_material_for_sales_type.

    TRY.
        DATA(material_type) = o_material_data->get_material_type( material_number ).
      CATCH zcx_ca_abap_unit_test2.
        RAISE EXCEPTION TYPE zcx_ca_abap_unit_test2
          EXPORTING
            textid = zcx_ca_abap_unit_test2=>material_does_not_exist.
    ENDTRY.

    result = COND #( WHEN material_type EQ 'M001' AND sales_type = 'ST01'
                       THEN abap_true
                     WHEN material_type EQ 'M001' AND sales_type = 'ST02'
                       THEN abap_true
                     ELSE abap_false ).

  ENDMETHOD.

ENDCLASS.
