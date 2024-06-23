class zcl_gateway_action definition
                         public
                         create public
                         abstract.

  public section.

    interfaces: zif_gateway_action
                  abstract methods
                    run.

    aliases: request for zif_gateway_action~request,
             runtime for zif_gateway_action~runtime,
             run for zif_gateway_action~run.

    methods constructor
              importing
                i_request type zif_gateway_action=>t_request
                i_runtime type zif_gateway_action=>t_runtime.

  protected section.

    data a_request type zif_gateway_action=>t_request.

    data a_runtime type zif_gateway_action=>t_runtime.

endclass.
class zcl_gateway_action implementation.

  method constructor.

    me->a_request = i_request.

    me->a_runtime = i_runtime.

  endmethod.
  method zif_gateway_action~request.

    r_request = me->a_request.

  endmethod.
  method zif_gateway_action~runtime.

    r_runtime = me->a_runtime.

  endmethod.

endclass.
