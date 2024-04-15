CLASS zcl_etr_delivery_operations DEFINITION
  PUBLIC
  CREATE PROTECTED .

  PUBLIC SECTION.
    TYPES:
      mty_incoming_list  TYPE STANDARD TABLE OF zetr_t_icdlv WITH DEFAULT KEY,
      mty_incoming_items TYPE STANDARD TABLE OF zetr_t_icdli WITH DEFAULT KEY,
      BEGIN OF mty_partner_register_data,
        businesspartner TYPE zetr_e_partner,
        bptaxnumber     TYPE c LENGTH 20,
        aliass          TYPE zetr_e_alias,
        registerdate    TYPE datum,
        title           TYPE zetr_e_title,
      END OF mty_partner_register_data.

    CLASS-METHODS factory
      IMPORTING
        !iv_company        TYPE bukrs
      RETURNING
        VALUE(ro_instance) TYPE REF TO zcl_etr_delivery_operations
      RAISING
        zcx_etr_regulative_exception .

    METHODS update_edelivery_users
      IMPORTING
        iv_db_write    TYPE abap_boolean DEFAULT abap_true
      RETURNING
        VALUE(rt_list) TYPE zcl_etr_edelivery_ws=>mty_taxpayers_list
      RAISING
        zcx_etr_regulative_exception.

    METHODS get_incoming_deliveries
      IMPORTING
        !iv_date_from TYPE datum OPTIONAL
        !iv_date_to   TYPE datum OPTIONAL
      EXPORTING
        et_list       TYPE mty_incoming_list
        et_items      TYPE mty_incoming_items
      RAISING
        zcx_etr_regulative_exception .

    METHODS incoming_edelivery_download
      IMPORTING
        !iv_document_uid   TYPE sysuuid_c22
        !iv_content_type   TYPE zetr_e_dctyp
        !iv_create_log     TYPE abap_boolean DEFAULT 'X'
      RETURNING
        VALUE(rv_document) TYPE xstring
      RAISING
        zcx_etr_regulative_exception .

    METHODS incoming_edelivery_respdown
      IMPORTING
        !iv_document_uid   TYPE sysuuid_c22
        !iv_content_type   TYPE zetr_e_dctyp
        !iv_create_log     TYPE abap_boolean DEFAULT 'X'
      RETURNING
        VALUE(rv_document) TYPE xstring
      RAISING
        zcx_etr_regulative_exception .

    METHODS incoming_delivery_get_status
      IMPORTING
        !iv_document_uid TYPE sysuuid_c22
        !iv_commit_to_db TYPE abap_boolean OPTIONAL
      RETURNING
        VALUE(rs_status) TYPE zcl_etr_edelivery_ws=>mty_incoming_delivery_status
      RAISING
        zcx_etr_regulative_exception .

    METHODS incoming_delivery_response
      IMPORTING
        !iv_document_uid   TYPE sysuuid_c22
        !is_response_data  TYPE zetr_ddl_i_dlvresp_selection
        !it_response_items TYPE mty_incoming_items
        !iv_commit_to_db   TYPE abap_boolean OPTIONAL
      RAISING
        zcx_etr_regulative_exception .

    METHODS outgoing_delivery_save
      IMPORTING
        !iv_awtyp          TYPE zetr_e_awtyp
        !iv_bukrs          TYPE bukrs
        !iv_belnr          TYPE belnr_d
        !iv_gjahr          TYPE gjahr
      RETURNING
        VALUE(rs_document) TYPE zetr_t_ogdlv
      RAISING
        zcx_etr_regulative_exception .
