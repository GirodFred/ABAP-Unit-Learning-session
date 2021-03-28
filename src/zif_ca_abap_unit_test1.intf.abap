INTERFACE zif_ca_abap_unit_test1

  PUBLIC .

  METHODS is_even_whole_number
    IMPORTING
      number        TYPE i
    RETURNING
      VALUE(result) TYPE abap_bool.

ENDINTERFACE.
