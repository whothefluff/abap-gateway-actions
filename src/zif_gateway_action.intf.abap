interface zif_gateway_action public.

  types t_request type ref to /iwbep/if_mgw_req_func_import.

  types t_runtime type ref to /iwbep/if_mgw_conv_srv_runtime.

  methods request
            returning
              value(r_request) type zif_gateway_action=>t_request.

  methods runtime
            returning
              value(r_runtime) type zif_gateway_action=>t_runtime.

  methods run
            returning
              value(r_val) type ref to data
            raising
              /iwbep/cx_mgw_tech_exception
              /iwbep/cx_mgw_busi_exception.

endinterface.
