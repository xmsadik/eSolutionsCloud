  PROTECTED SECTION.
    DATA mo_delivery_operations TYPE REF TO zCL_ETR_DELIVERY_OPERATIONS .
    DATA ms_document TYPE zetr_t_OGDLV .
    DATA ms_company_parameters TYPE zetr_t_edpar .
    DATA mv_preview TYPE abap_boolean .
    DATA mv_company_taxid TYPE zetr_e_taxid .
    DATA mv_add_signature TYPE zetr_E_VALUE .
    DATA mv_shipto_address TYPE c LENGTH 10 .
    DATA ms_delivery_ubl TYPE zif_etr_delivery_ubl21=>despatchadvicetype .
    DATA mv_delivery_hash TYPE string .
    DATA mv_delivery_ubl TYPE xstring .
    DATA mt_custom_parameters TYPE mty_custom_parameters_t .
    DATA mt_delivery_items TYPE mty_item_collect_t .
    DATA ms_outdel_data TYPE mty_outdel_data .
    DATA ms_goodsmvmt_data TYPE mty_goodsmvmt_data .

    METHODS build_delivery_data_likp
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_mkpf
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_bkpf
      RAISING
        zcx_etr_regulative_exception .
    METHODS delivery_abap_to_ubl
      RAISING
        zcx_etr_regulative_exception .
    METHODS get_edelivery_rule
      IMPORTING
        !iv_rule_type         TYPE zetr_E_RULET
        !is_rule_input        TYPE zetr_s_delivery_rules_in
      RETURNING
        VALUE(rt_rule_output) TYPE mty_delivery_rules_out .
    METHODS ubl_fill_company_data
      IMPORTING
        !iv_bukrs      TYPE bukrs
      RETURNING
        VALUE(rs_data) TYPE zif_etr_common_ubl21=>partytype
      RAISING
        zcx_etr_regulative_exception .
    METHODS ubl_fill_other_party_data
      IMPORTING
        !iv_taxid      TYPE zetr_e_taxid OPTIONAL
        !iv_prtty      TYPE zetr_E_PRTTY OPTIONAL
      RETURNING
        VALUE(rs_data) TYPE zif_etr_common_ubl21=>partytype
      RAISING
        zcx_etr_regulative_exception .
    METHODS collect_items_likp .
    METHODS collect_items_bkpf .
    METHODS collect_items_mkpf .
    METHODS get_data_likp
      IMPORTING
        !iv_vbeln      TYPE vbeln_vl
      RETURNING
        VALUE(rs_data) TYPE mty_outdel_data .
    METHODS get_data_mkpf
      IMPORTING
        !iv_mblnr      TYPE mblnr
        !iv_mjahr      TYPE mjahr
      RETURNING
        VALUE(rs_data) TYPE mty_goodsmvmt_data .
    METHODS build_delivery_data_common_itm
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_common_trn
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_common_hdr
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_likp_head
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_likp_ref
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_likp_party
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_likp_item
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_likp_notes
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_likp_trans
      RAISING
        zcx_etr_regulative_exception .
    METHODS fill_common_delivery_data
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_mkpf_head
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_mkpf_ref
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_mkpf_party
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_mkpf_item
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_mkpf_notes
      RAISING
        zcx_etr_regulative_exception .
    METHODS build_delivery_data_mkpf_trans
      RAISING
        zcx_etr_regulative_exception .
