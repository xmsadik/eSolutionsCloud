CLASS lhc_zetr_ddl_i_outgoing_delive DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zetr_ddl_i_outgoing_deliveries RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zetr_ddl_i_outgoing_deliveries RESULT result.

    METHODS archiveDeliveries FOR MODIFY
      IMPORTING keys FOR ACTION zetr_ddl_i_outgoing_deliveries~archiveDeliveries RESULT result.

    METHODS sendDeliveries FOR MODIFY
      IMPORTING keys FOR ACTION zetr_ddl_i_outgoing_deliveries~sendDeliveries RESULT result.

    METHODS setAsRejected FOR MODIFY
      IMPORTING keys FOR ACTION zetr_ddl_i_outgoing_deliveries~setAsRejected RESULT result.

    METHODS statusUpdate FOR MODIFY
      IMPORTING keys FOR ACTION zetr_ddl_i_outgoing_deliveries~statusUpdate RESULT result.

ENDCLASS.

CLASS lhc_zetr_ddl_i_outgoing_delive IMPLEMENTATION.

  METHOD get_instance_features.
    READ ENTITIES OF zetr_ddl_i_outgoing_deliveries IN LOCAL MODE
          ENTITY zetr_ddl_i_outgoing_deliveries
            ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_deliveries)
        FAILED failed.
    CHECK lt_deliveries IS NOT INITIAL.
    result = VALUE #( FOR ls_delivery IN lt_deliveries
                      ( %tky = ls_delivery-%tky
                        %action-sendDeliveries = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                   THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  )
                        %action-archiveDeliveries = COND #( WHEN ls_delivery-statuscode = '' OR ls_delivery-statuscode = '2'
                                                   THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  )
                        %action-setAsRejected = COND #( WHEN ls_delivery-statuscode = '' OR ls_delivery-statuscode = '2'
                                                   THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  )
                        %action-statusUpdate = COND #( WHEN ls_delivery-statuscode = '' OR ls_delivery-statuscode = '2'
                                                   THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  )
                        %features-%update = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                   THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  )
                        %features-%delete = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                   THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  )
                        %field-ProfileID = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-mandatory  )
                        %field-Aliass = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryNote = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryType = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-CollectItems = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-SerialPrefix = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-XSLTTemplate = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-ActualDeliveryDate = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-ActualDeliveryTime = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-VehiclePlate = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-TransportCompanyTaxID = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-TransportCompanyTitle = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressStreet = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressBuildingName = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressBuildingNumber = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressRegion = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressSubdivision = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressCity = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressCountry = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressPostalCode = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressTelephone = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressFax = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressEMail = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-DeliveryAddressWebsite = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-PrintedDocumentDate = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                        %field-PrintedDocumentNumber = COND #( WHEN ls_delivery-statuscode <> '' AND ls_delivery-statuscode <> '2'
                                                     THEN if_abap_behv=>fc-f-read_only
                                                   ELSE if_abap_behv=>fc-f-unrestricted  )
                      ) ).
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD archiveDeliveries.
  ENDMETHOD.

  METHOD sendDeliveries.
  ENDMETHOD.

  METHOD setAsRejected.
  ENDMETHOD.

  METHOD statusUpdate.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZETR_DDL_I_OUTGOING_DELIVE DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZETR_DDL_I_OUTGOING_DELIVE IMPLEMENTATION.

  METHOD save_modified.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.