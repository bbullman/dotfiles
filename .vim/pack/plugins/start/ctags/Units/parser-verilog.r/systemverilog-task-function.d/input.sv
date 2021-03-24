// LRM 13.5.2 Pass by Reference
module task_func;

  function automatic int crc( ref byte packet [1000:1] );
    for( int j= 1; j <= 1000; j++ ) begin
      crc ^= packet[j];
    end
  endfunction

  task automatic show ( const ref byte data [] );
    for ( int j = 0; j < data.size ; j++ )
      $display( data[j] ); // data can be read but not written
  endtask

  task automatic attr ( (* my_attr *) const ref foo, enum { s0, s1 } sel_e );
  endtask

endmodule

// disabled K_PROTOTYPE: don't use "--extras=+q" for coverage
class C;
  extern function ext_func ();
  pure virtual task ext_pure_virt_task (x);
  typedef class   fwd_type_class;
endclass

// from UVM-1.2
class func_test;
  // FIXME don't create context
  // import "DPI-C" context function int uvm_re_match(string re, string str);

  function void foo::bar(uvm_object element);
  endfunction

  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  endfunction

  function void do_pack(uvm_packer packer);
    always_comb
      for (int i = 0; i < m_length; i++)
        ;
  endfunction

  function uvm_port_base #(IF) get_if(int index=0);
  endfunction

  function void bind_vitf(virtual wb_if.master sigs);
    this.sigs = sigs;
  endfunction

  // paren
  function string get(string v);
      if (v[0] == "(")  // "(" in paired paren '( ... )'
        ;
  endfunction

  function string get_arg();
  endfunction
endclass
