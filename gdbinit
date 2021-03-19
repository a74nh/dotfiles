
# Ignore hotspot interested signals
define jdk_on
  handle SIGSEGV noprint nostop pass
  handle SIGILL noprint nostop pass
end
 
# Switch back to normal non jdk debugging, i.e. let gdb to catch default interested signals.
define jdk_off
  handle SIGSEGV print stop nopass
  handle SIGILL print stop nopass
end
 
# Set current code pointed by PC to AArch64 NOP insn
define nop_pc
 set *(int*)$pc=0xd503201f
 set code-cache off
 set code-cache on
end
 
# Set current code pointed by PC to Arm32 NOP insn
define nop_pc_arm
  set *(int*)$pc=0xe320f000
  set code-cache off
  set code-cache on
end
 
# Disassemble current context
define xxx
  x /30i $pc-40
end

define jstack
  call pns($sp, $fp, $pc)
end

# Run jdk, stopping at after global state has been initialised. Also prevents other threads running when stepping code.
define jdk_start
 jdk_on
 set breakpoint pending on
 b init_globals
 run
 set scheduler-locking step
 fin
end

# Run jdk without stopping
define jdk_run_to_exit
  jdk_on
  run
  quit
end

# Print the current bytecode from the top of the rbcp
define bc
  printf "Bytecode 0x%x: %s\n",(*(char*)$x22),Bytecodes::name((*(char*)$x22))
end

# Show the interpreter state when gdb stops
define showi
  display Bytecodes::name(*(char*)$x22)
  display/5i $pc
end

define pn
  if $argc == 1
    call $arg0->dump()
  end
  if $argc == 2
    call $arg0->dump($arg1)
  end
end

define flow
  display /i $pc
  display /x $sp
  display /x $lr
end
