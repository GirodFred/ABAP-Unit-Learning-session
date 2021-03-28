*"* use this source file for your ABAP unit test classes
CLASS ltc_ca_abap_unit_test2b DEFINITION
      FOR TESTING
      RISK LEVEL HARMLESS
      DURATION SHORT
      FINAL.

  PRIVATE SECTION.
    DATA o_cut           TYPE REF TO zif_ca_abap_unit_test2b.
    DATA o_material_data TYPE REF TO zcl_ca_abap_unit_test2a_mock.

    METHODS setup.

    METHODS it_finds_correct_material_type FOR TESTING.
    METHODS it_failes_material_number      FOR TESTING.


ENDCLASS.


CLASS ltc_ca_abap_unit_test2b IMPLEMENTATION.

  METHOD setup.
    o_material_data = NEW #( ).
    cl_abap_unit_assert=>assert_bound( o_material_data ).

    o_cut = NEW zcl_ca_abap_unit_test2b(  o_material_data ).
    cl_abap_unit_assert=>assert_bound( o_cut ).
  ENDMETHOD.


  METHOD it_finds_correct_material_type.

    " Given I have material number / material type
    o_material_data->set_material_type( VALUE #(
                       ( material_number = '0001' material_type = 'M001' )
                       ( material_number = '0002' material_type = 'M002' ) ) ).
    " When I call for material 0001 & Sales type T001 it should be true.
    cl_abap_unit_assert=>assert_equals(
      act = o_cut->is_material_for_sales_type( material_number = '0001'
                                               sales_type      = 'ST01' )
      exp = abap_true  ).

    " When I call for material 0002 & Sales type T001 it should be true.
    cl_abap_unit_assert=>assert_equals(
      act = o_cut->is_material_for_sales_type( material_number = '0002'
                                               sales_type      = 'ST01' )
      exp = abap_false  ).

  ENDMETHOD.


  METHOD it_failes_material_number.
    " Given I have material number / material type
    o_material_data->set_material_type( VALUE #(
                       ( material_number = '0003' material_type = 'M001' )
                       ( material_number = '0002' material_type = 'M002' ) ) ).
    TRY.
        " When I call for material 0001 & Sales type T001 it should be true.
        cl_abap_unit_assert=>assert_equals(
          act = o_cut->is_material_for_sales_type( material_number = '0001'
                                                   sales_type      = 'ST01' )
          exp = abap_true  ).
      CATCH zcx_ca_abap_unit_test2 INTO DATA(o_exception).
    ENDTRY.
    cl_abap_unit_assert=>assert_bound( o_exception ).
  ENDMETHOD.



ENDCLASS.
