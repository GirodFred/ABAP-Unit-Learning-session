*"* use this source file for your ABAP unit test classes
CLASS ltc_ca_abap_unit_test1 DEFINITION
      FOR TESTING
      RISK LEVEL HARMLESS
      DURATION SHORT
      FINAL.

  PRIVATE SECTION.

    DATA o_cut TYPE REF TO zif_ca_abap_unit_test1.

    METHODS it_finds_even_number_1    FOR TESTING.

ENDCLASS.


CLASS ltc_ca_abap_unit_test1 IMPLEMENTATION.


  METHOD it_finds_even_number_1.

    " Given I have a number
    data my_number type i value 132.

    " When I call my method.
    o_cut = NEW zcl_ca_abap_unit_test1( ).
    data(result_of_test) = o_cut->is_even_whole_number( my_number ).

    " Then, it should give me positive result
    cl_abap_unit_assert=>assert_equals(
        act = result_of_test
        exp = abap_true ).

  ENDMETHOD.

ENDCLASS.
