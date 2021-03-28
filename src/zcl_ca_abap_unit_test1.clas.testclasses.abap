*"* use this source file for your ABAP unit test classes
CLASS ltc_ca_abap_unit_test1 DEFINITION
      FOR TESTING
      RISK LEVEL HARMLESS
      DURATION SHORT
      FINAL.

  PRIVATE SECTION.
    TYPES : BEGIN OF ts_even_test,
              number TYPE i,
              result TYPE abap_bool,
            END   OF ts_even_test,
            tt_even_tests TYPE STANDARD TABLE OF ts_even_test WITH NON-UNIQUE DEFAULT KEY.


    DATA o_cut TYPE REF TO zif_ca_abap_unit_test1.

    METHODS setup.

    METHODS it_finds_even_number_1    FOR TESTING.

    METHODS given_i_have_even_examples
      RETURNING
        VALUE(examples) TYPE tt_even_tests.



ENDCLASS.


CLASS ltc_ca_abap_unit_test1 IMPLEMENTATION.


  METHOD setup.
    o_cut = NEW zcl_ca_abap_unit_test1( ).
    cl_abap_unit_assert=>assert_bound( o_cut ).
  ENDMETHOD.



  METHOD it_finds_even_number_1.

    LOOP AT given_i_have_even_examples( )
         REFERENCE INTO DATA(o_example).
      " Then, it should give me positive result
      cl_abap_unit_assert=>assert_equals(
        act = o_cut->is_even_whole_number( o_example->number )
        exp = o_example->result
        ).
    ENDLOOP.

  ENDMETHOD.



  METHOD given_i_have_even_examples.
    examples = VALUE #( (  number = 1   result = abap_false )
                        (  number = 2   result = abap_true  )
                        (  number = 11  result = abap_false )
                        (  number = 12  result = abap_true  ) ).
  ENDMETHOD.



ENDCLASS.
