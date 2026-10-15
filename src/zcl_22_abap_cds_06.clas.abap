CLASS zcl_22_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA lv_carrierid TYPE string VALUE 'LH'.
    DATA lv_connectionid TYPE string VALUE '0400'.
ENDCLASS.



CLASS zcl_22_abap_cds_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM Z22_CustomerKPIs( p_city = 'Berlin' )
    FIELDS *
    INTO TABLE @DATA(customers).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( customers ).

  ENDMETHOD.
ENDCLASS.
