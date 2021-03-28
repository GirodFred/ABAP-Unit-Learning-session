INTERFACE zif_ca_abap_unit_test2a
  PUBLIC .
  METHODS get_material_type
    IMPORTING
      material_number      TYPE char40
    RETURNING
      VALUE(material_type) TYPE char4
    RAISING
      zcx_ca_abap_unit_test2.

ENDINTERFACE.
