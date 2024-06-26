.. _ctags_lang-verilog(7):

======================================================================
ctags-lang-verilog
======================================================================

:Version: 5.9.0
:Manual group: Universal-ctags
:Manual section: 7

SYNOPSIS
--------
|	**ctags** ... [--fields-Verilog=+{parameter}] ...
|	**ctags** ... [--kinds-systemverilog=+Q] [--fields-SystemVerilog=+{parameter}] ...
|	**ctags** --list-kinds-full={Verilog|SystemVerilog}
|	**ctags** --list-fields={Verilog|SystemVerilog}

    +---------------+---------------+-------------------+
    | Language      | Language ID   | File Mapping      |
    +===============+===============+===================+
    | Verilog       | Verilog       | .v                |
    +---------------+---------------+-------------------+
    | SystemVerilog | SystemVerilog | .sv, .svh, svi    |
    +---------------+---------------+-------------------+

DESCRIPTION
-----------
This man page describes about the Verilog/SystemVerilog parser for Universal-ctags.

It assumes the input file is written in the correct grammer.  Otherwise output of
ctags is undefined.

``parameter`` field
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If the field ``parameter`` is enabled, a tagfield ``parameter:`` is added on a parameter whose
value can be overridden on an instantiated module, interface, or program.
This is useful for a editor plugin or extension to enable auto-instatiation of modules with
parameters which can be overridden.

.. code-block:: console

    $ ctags ... --fields-Verilog=+{parameter} ...
    $ ctags ... --fields-SystemVerilog=+{parameter} ...

On the following source code tagfields ``parameter:`` are added on
parameter ``P*``, not on ``L*``.  Note that ``L4`` and ``L6`` is declared by
``parameter`` statement, but tagfields ``parameter:`` are not added,
because they cannot be overridden.

"input.sv"

.. code-block:: systemverilog

	// compilation unit scope
	parameter L1 = "synonym for the localparam";

	module with_parameter_port_list #(
		P1,
		localparam L2 = P1+1,
		parameter P2)
		( /*port list...*/ );
		parameter  L3 = "synonym for the localparam";
		localparam L4 = "localparam";
		// ...
	endmodule

	module with_empty_parameter_port_list #()
		( /*port list...*/ );
		parameter  L5 = "synonym for the localparam";
		localparam L6 = "localparam";
		// ...
	endmodule

	module no_parameter_port_list
		( /*port list...*/ );
		parameter  P3 = "parameter";
		localparam L7 = "localparam";
		// ...
	endmodule

"output.tags"
with "--options=NONE --sort=no -o - --fields-SystemVerilog=+{parameter} input.sv"

.. code-block:: tags

	L1      foo.sv  /^parameter L1 = "synonym for the localparam";$/;"      c       parameter:
	with_parameter_port_list foo.sv  /^module with_parameter_port_list #($/;" m
	P1      foo.sv  /^    P1, $/;"  c       module:with_parameter_port_list  parameter:
	L2      foo.sv  /^    localparam L2 = P1+1,$/;" c       module:with_parameter_port_list
	P2      foo.sv  /^    parameter P2)$/;" c       module:with_parameter_port_list  parameter:
	L3      foo.sv  /^    parameter  L3 = "synonym for the localparam";$/;" c       module:with_parameter_port_list
	L4      foo.sv  /^    localparam L4 = "localparam";$/;" c       module:with_parameter_port_list
	with_empty_parameter_port_list   foo.sv  /^module with_empty_parameter_port_list #()$/;"  m
	L5      foo.sv  /^    parameter  L5 = "synonym for the localparam";$/;" c       module:with_empty_parameter_port_list
	L6      foo.sv  /^    localparam L6 = "localparam";$/;" c       module:with_empty_parameter_port_list
	no_parameter_port_list   foo.sv  /^module no_parameter_port_list$/;"      m
	P3      foo.sv  /^    parameter  P3 = "parameter";$/;"  c       module:no_parameter_port_list    parameter:
	L7      foo.sv  /^    localparam L7 = "localparam";$/;" c       module:no_parameter_port_list

Known Issues
---------------------------------------------------------------------

See https://github.com/universal-ctags/ctags/issues/TBD.


SEE ALSO
--------
ctags(1), ctags-client-tools(7)
