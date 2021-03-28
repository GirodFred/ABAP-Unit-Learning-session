CLASS zcl_ca_abap_unit_test2a_mock DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ts_material_type,
             material_number TYPE char40,
             material_type   TYPE char4,
           END   OF ts_material_type,
           tt_material_types TYPE STANDARD TABLE OF ts_material_type WITH NON-UNIQUE DEFAULT KEY.

    INTERFACES zif_ca_abap_unit_test2a.

    METHODS set_material_type
      IMPORTING
        material_types TYPE tt_material_types.


  PRIVATE SECTION.
    DATA gt_material_types TYPE tt_material_types.

ENDCLASS.



CLASS zcl_ca_abap_unit_test2a_mock IMPLEMENTATION.

  METHOD set_material_type.
    gt_material_types = material_types.
  ENDMETHOD.

  METHOD zif_ca_abap_unit_test2a~get_material_type.
    READ TABLE gt_material_types
         REFERENCE INTO DATA(o_material_type)
         WITH KEY material_number = material_number.
    IF sy-subrc NE 0.
      RAISE EXCEPTION TYPE zcx_ca_abap_unit_test2
        EXPORTING
          textid = zcx_ca_abap_unit_test2=>material_does_not_exist.
    ELSE.
      material_type = o_material_type->material_type.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
