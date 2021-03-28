CLASS zcl_ca_abap_unit_test1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_ca_abap_unit_test1.

  PRIVATE SECTION.
    METHODS get_unit_of_integer_number
      IMPORTING
        number        TYPE i
      RETURNING
        VALUE(result) TYPE char1.

ENDCLASS.



CLASS zcl_ca_abap_unit_test1 IMPLEMENTATION.

  METHOD zif_ca_abap_unit_test1~is_even_whole_number.
    result = switch #( get_unit_of_integer_number( number )
                         when 0 or 2 or 4 or 6 or 8
                           then abap_true
                           else abap_false ).
  ENDMETHOD.


  METHOD get_unit_of_integer_number.
    data(string_number) = conv string( number ).
    DATA(number_size)   = strlen( string_number ).
    DATA(unit_position) = number_size - 2.
    result = string_number+unit_position(1).
  ENDMETHOD.


ENDCLASS.
