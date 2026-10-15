CLASS lhc_ZR_22_MovieTP DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      keys REQUEST requested_features FOR ZR_22_MovieTP RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR ZR_22_MovieTP RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR ZR_22_MovieTP RESULT result.

    METHODS rate_movie FOR MODIFY
       keys FOR ACTION ZR_22_MovieTP~rate_movie.

    METHODS validate_genre FOR VALIDATE ON SAVE
       keys FOR ZR_22_MovieTP~validate_genre.

ENDCLASS.

CLASS lhc_ZR_22_MovieTP IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD rate_movie.
  ENDMETHOD.

  METHOD validate_genre.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Rating DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS determine_rating_date FOR DETERMINE ON MODIFY
       keys FOR Rating~determine_rating_date.

    METHODS determine_user_name FOR DETERMINE ON MODIFY
       keys FOR Rating~determine_user_name.

ENDCLASS.

CLASS lhc_Rating IMPLEMENTATION.

  METHOD determine_rating_date.
  ENDMETHOD.

  METHOD determine_user_name.
  ENDMETHOD.

ENDCLASS.
