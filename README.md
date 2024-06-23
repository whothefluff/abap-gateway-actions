# abap-gateway-actions

Helps modularize the non-entity stuff

## Use

Define a subclass of _ZCL_GATEWAY_ACTION_:
```abap
class function_import_something definition
                                create public "#EC CLAS_FINAL
                                inheriting from zcl_gateway_action.

  public section.

    types t_return_data type zcl_project_mpc=>somethingresponse.

    methods run redefinition.

endclass.
class function_import_something implementation.

  method run.

    types rfc_return.

    data(rfc_dest) = /iwbep/cl_sb_gen_dpc_rt_util=>get_rfc_destination( me->runtime( )->get_dp_facade( ) ).

    data(parameters) = me->request( )->get_parameters( ).

    data(rfc_return) = value rfc_return( ).

    call function 'Z_SOMETHING'
      destination rfc_dest
      exporting
        i_param = parameters[ name = to_upper( `Param` ) ]-value
      importing
        e_val   = rfc_return.

    r_val = new me->t_return_data( corresponding #( rfc_return ) ).

  endmethod.

endclass.
```
Create an instance and call the method
```abap
method /iwbep/if_mgw_appl_srv_runtime~execute_action.

    types: begin of action,
             name type string,
             impl type ref to zif_gateway_action,
           end of action,
           actions type sorted table of action with unique key name.

    data(tech_request) = io_tech_request_context. "just to make the code a bit shorter

    data(actions) = value actions( ( name = `DoSomething`
                                     impl = new function_import_something( i_request = tech_request
                                                                           i_runtime = me ) ) ).

    er_data = actions[ name = tech_request->get_function_import_name( ) ]-impl->run( ).

endmethod.
```