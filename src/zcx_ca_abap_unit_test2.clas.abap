CLASS zcx_ca_abap_unit_test2 DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    constants:
       begin of material_does_not_exist,
         msgid type symsgid value 'Z_ABAP_UNIT_TEST',
         msgno type symsgno value '001',
         attr1 type scx_attrname value '',
         attr2 type scx_attrname value '',
         attr3 type scx_attrname value '',
         attr4 type scx_attrname value '',
       end   of material_does_not_exist.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_ca_abap_unit_test2 IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
