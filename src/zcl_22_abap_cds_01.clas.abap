CLASS zcl_22_abap_cds_01 DEFINITION
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



CLASS zcl_22_abap_cds_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /DMO/C_Booking_Approver_M
    FIELDS *
    WHERE CarrierID = @lv_carrierid AND ConnectionID = @lv_connectionid
    INTO TABLE @DATA(flights).

    out->write( flights ).

  ENDMETHOD.
ENDCLASS.
