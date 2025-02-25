(module
  (type $t0 (func))
  (type $t1 (func (param i32)))
  (type $t2 (func (param i32 i32)))
  (type $t3 (func (result i32)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $wasi_snapshot_preview1.proc_exit (type $t1)))
  (func $f1 (type $t0)
    (call $emscripten_stack_init))
  (func $f2 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) 
    (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) 
    (local $l12 i32) (local $l13 i32) (local $l14 i32) (local $l15 i32) (local $l16 i32) 
    (local $l17 i32) (local $l18 i32) (local $l19 i32) (local $l20 i32) (local $l21 i32) 
    (local $l22 i32) (local $l23 i32) (local $l24 i32) (local $l25 i32) (local $l26 i32) 
    (local $l27 i32) (local $l28 i32) (local $l29 i32) (local $l30 i32) (local $l31 i32) (local $l32 i32) (local $l33 i32) (local $l34 i32) (local $l35 i32) (local $l36 i32) (local $l37 i32) (local $l38 i32) (local $l39 i32) (local $l40 i32) (local $l41 i32) (local $l42 i32) (local $l43 i32) (local $l44 i32) (local $l45 i32) (local $l46 i32) (local $l47 i32) (local $l48 i32) (local $l49 i32) (local $l50 i32) (local $l51 i32) (local $l52 i32) (local $l53 i32) (local $l54 i32) (local $l55 i32) (local $l56 i32) (local $l57 i32) (local $l58 i32) (local $l59 i32) (local $l60 i32) (local $l61 i32) (local $l62 i32) (local $l63 i32) (local $l64 i32) (local $l65 i32) (local $l66 i32) (local $l67 i32) (local $l68 i32) (local $l69 i32) (local $l70 i32) (local $l71 i32) (local $l72 i32)
    (local.set $l2
      (global.get $g0))
    (local.set $l3
      (i32.const 32))
    (local.set $l4
      (i32.sub
        (local.get $l2)
        (local.get $l3)))
    (i32.store offset=28
      (local.get $l4)
      (local.get $p0))
    (i32.store offset=24
      (local.get $l4)
      (local.get $p1))
    (local.set $l5
      (i32.const 0))
    (i32.store offset=20
      (local.get $l4)
      (local.get $l5))
    (block $B0
      (loop $L1
        (local.set $l6
          (i32.load offset=20
            (local.get $l4)))
        (local.set $l7
          (i32.load offset=24
            (local.get $l4)))
        (local.set $l8
          (i32.const 1))
        (local.set $l9
          (i32.sub
            (local.get $l7)
            (local.get $l8)))
        (local.set $l10
          (i32.lt_s
            (local.get $l6)
            (local.get $l9)))
        (local.set $l11
          (i32.const 1))
        (local.set $l12
          (i32.and
            (local.get $l10)
            (local.get $l11)))
        (br_if $B0
          (i32.eqz
            (local.get $l12)))
        (local.set $l13
          (i32.const 0))
        (i32.store offset=16
          (local.get $l4)
          (local.get $l13))
        (block $B2
          (loop $L3
            (local.set $l14
              (i32.load offset=16
                (local.get $l4)))
            (local.set $l15
              (i32.load offset=24
                (local.get $l4)))
            (local.set $l16
              (i32.load offset=20
                (local.get $l4)))
            (local.set $l17
              (i32.sub
                (local.get $l15)
                (local.get $l16)))
            (local.set $l18
              (i32.const 1))
            (local.set $l19
              (i32.sub
                (local.get $l17)
                (local.get $l18)))
            (local.set $l20
              (i32.lt_s
                (local.get $l14)
                (local.get $l19)))
            (local.set $l21
              (i32.const 1))
            (local.set $l22
              (i32.and
                (local.get $l20)
                (local.get $l21)))
            (br_if $B2
              (i32.eqz
                (local.get $l22)))
            (local.set $l23
              (i32.load offset=28
                (local.get $l4)))
            (local.set $l24
              (i32.load offset=16
                (local.get $l4)))
            (local.set $l25
              (i32.const 2))
            (local.set $l26
              (i32.shl
                (local.get $l24)
                (local.get $l25)))
            (local.set $l27
              (i32.add
                (local.get $l23)
                (local.get $l26)))
            (local.set $l28
              (i32.load
                (local.get $l27)))
            (local.set $l29
              (i32.load offset=28
                (local.get $l4)))
            (local.set $l30
              (i32.load offset=16
                (local.get $l4)))
            (local.set $l31
              (i32.const 1))
            (local.set $l32
              (i32.add
                (local.get $l30)
                (local.get $l31)))
            (local.set $l33
              (i32.const 2))
            (local.set $l34
              (i32.shl
                (local.get $l32)
                (local.get $l33)))
            (local.set $l35
              (i32.add
                (local.get $l29)
                (local.get $l34)))
            (local.set $l36
              (i32.load
                (local.get $l35)))
            (local.set $l37
              (i32.gt_s
                (local.get $l28)
                (local.get $l36)))
            (local.set $l38
              (i32.const 1))
            (local.set $l39
              (i32.and
                (local.get $l37)
                (local.get $l38)))
            (block $B4
              (br_if $B4
                (i32.eqz
                  (local.get $l39)))
              (local.set $l40
                (i32.load offset=28
                  (local.get $l4)))
              (local.set $l41
                (i32.load offset=16
                  (local.get $l4)))
              (local.set $l42
                (i32.const 2))
              (local.set $l43
                (i32.shl
                  (local.get $l41)
                  (local.get $l42)))
              (local.set $l44
                (i32.add
                  (local.get $l40)
                  (local.get $l43)))
              (local.set $l45
                (i32.load
                  (local.get $l44)))
              (i32.store offset=12
                (local.get $l4)
                (local.get $l45))
              (local.set $l46
                (i32.load offset=28
                  (local.get $l4)))
              (local.set $l47
                (i32.load offset=16
                  (local.get $l4)))
              (local.set $l48
                (i32.const 1))
              (local.set $l49
                (i32.add
                  (local.get $l47)
                  (local.get $l48)))
              (local.set $l50
                (i32.const 2))
              (local.set $l51
                (i32.shl
                  (local.get $l49)
                  (local.get $l50)))
              (local.set $l52
                (i32.add
                  (local.get $l46)
                  (local.get $l51)))
              (local.set $l53
                (i32.load
                  (local.get $l52)))
              (local.set $l54
                (i32.load offset=28
                  (local.get $l4)))
              (local.set $l55
                (i32.load offset=16
                  (local.get $l4)))
              (local.set $l56
                (i32.const 2))
              (local.set $l57
                (i32.shl
                  (local.get $l55)
                  (local.get $l56)))
              (local.set $l58
                (i32.add
                  (local.get $l54)
                  (local.get $l57)))
              (i32.store
                (local.get $l58)
                (local.get $l53))
              (local.set $l59
                (i32.load offset=12
                  (local.get $l4)))
              (local.set $l60
                (i32.load offset=28
                  (local.get $l4)))
              (local.set $l61
                (i32.load offset=16
                  (local.get $l4)))
              (local.set $l62
                (i32.const 1))
              (local.set $l63
                (i32.add
                  (local.get $l61)
                  (local.get $l62)))
              (local.set $l64
                (i32.const 2))
              (local.set $l65
                (i32.shl
                  (local.get $l63)
                  (local.get $l64)))
              (local.set $l66
                (i32.add
                  (local.get $l60)
                  (local.get $l65)))
              (i32.store
                (local.get $l66)
                (local.get $l59)))
            (local.set $l67
              (i32.load offset=16
                (local.get $l4)))
            (local.set $l68
              (i32.const 1))
            (local.set $l69
              (i32.add
                (local.get $l67)
                (local.get $l68)))
            (i32.store offset=16
              (local.get $l4)
              (local.get $l69))
            (br $L3)))
        (local.set $l70
          (i32.load offset=20
            (local.get $l4)))
        (local.set $l71
          (i32.const 1))
        (local.set $l72
          (i32.add
            (local.get $l70)
            (local.get $l71)))
        (i32.store offset=20
          (local.get $l4)
          (local.get $l72))
        (br $L1)))
    (return))
  (func $f3 (type $t3) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i64) (local $l9 i32) (local $l10 i32) (local $l11 i64) (local $l12 i64) (local $l13 i32) (local $l14 i32) (local $l15 i32) (local $l16 i32) (local $l17 i32) (local $l18 i32) (local $l19 i32) (local $l20 i32)
    (local.set $l0
      (global.get $g0))
    (local.set $l1
      (i32.const 48))
    (local.set $l2
      (i32.sub
        (local.get $l0)
        (local.get $l1)))
    (global.set $g0
      (local.get $l2))
    (local.set $l3
      (i32.const 0))
    (i32.store offset=44
      (local.get $l2)
      (local.get $l3))
    (local.set $l4
      (i32.const 0))
    (local.set $l5
      (i32.load offset=65560
        (local.get $l4)))
    (local.set $l6
      (i32.const 40))
    (local.set $l7
      (i32.add
        (local.get $l2)
        (local.get $l6)))
    (i32.store
      (local.get $l7)
      (local.get $l5))
    (local.set $l8
      (i64.load offset=65552
        (local.get $l4)))
    (local.set $l9
      (i32.const 32))
    (local.set $l10
      (i32.add
        (local.get $l2)
        (local.get $l9)))
    (i64.store
      (local.get $l10)
      (local.get $l8))
    (local.set $l11
      (i64.load offset=65544
        (local.get $l4)))
    (i64.store offset=24
      (local.get $l2)
      (local.get $l11))
    (local.set $l12
      (i64.load offset=65536
        (local.get $l4)))
    (i64.store offset=16
      (local.get $l2)
      (local.get $l12))
    (local.set $l13
      (i32.const 7))
    (i32.store offset=12
      (local.get $l2)
      (local.get $l13))
    (local.set $l14
      (i32.const 16))
    (local.set $l15
      (i32.add
        (local.get $l2)
        (local.get $l14)))
    (local.set $l16
      (local.get $l15))
    (local.set $l17
      (i32.load offset=12
        (local.get $l2)))
    (call $f2
      (local.get $l16)
      (local.get $l17))
    (local.set $l18
      (i32.const 0))
    (local.set $l19
      (i32.const 48))
    (local.set $l20
      (i32.add
        (local.get $l2)
        (local.get $l19)))
    (global.set $g0
      (local.get $l20))
    (return
      (local.get $l18)))
  (func $_start (export "_start") (type $t0)
    (block $B0
      (br_if $B0
        (i32.eqz
          (i32.const 1)))
      (call $f1))
    (call $f7
      (call $f3))
    (unreachable))
  (func $f5 (type $t0))
  (func $f6 (type $t0)
    (local $l0 i32)
    (local.set $l0
      (i32.const 0))
    (block $B0
      (br_if $B0
        (i32.le_u
          (i32.const 0)
          (i32.const 0)))
      (loop $L1
        (call_indirect $__indirect_function_table (type $t0)
          (i32.load
            (local.tee $l0
              (i32.add
                (local.get $l0)
                (i32.const -4)))))
        (br_if $L1
          (i32.gt_u
            (local.get $l0)
            (i32.const 0)))))
    (call $f5))
  (func $f7 (type $t1) (param $p0 i32)
    (call $f5)
    (call $f6)
    (call $f5)
    (call $f8
      (local.get $p0))
    (unreachable))
  (func $f8 (type $t1) (param $p0 i32)
    (call $wasi_snapshot_preview1.proc_exit
      (local.get $p0))
    (unreachable))
  (func $emscripten_stack_init (export "emscripten_stack_init") (type $t0)
    (global.set $g2
      (i32.const 65536))
    (global.set $g1
      (i32.and
        (i32.add
          (i32.const 0)
          (i32.const 15))
        (i32.const -16))))
  (func $emscripten_stack_get_free (export "emscripten_stack_get_free") (type $t3) (result i32)
    (i32.sub
      (global.get $g0)
      (global.get $g1)))
  (func $emscripten_stack_get_base (export "emscripten_stack_get_base") (type $t3) (result i32)
    (global.get $g2))
  (func $emscripten_stack_get_end (export "emscripten_stack_get_end") (type $t3) (result i32)
    (global.get $g1))
  (func $_emscripten_stack_restore (export "_emscripten_stack_restore") (type $t1) (param $p0 i32)
    (global.set $g0
      (local.get $p0)))
  (func $emscripten_stack_get_current (export "emscripten_stack_get_current") (type $t3) (result i32)
    (global.get $g0))
  (table $__indirect_function_table (export "__indirect_function_table") 2 2 funcref)
  (memory $memory (export "memory") 258 258)
  (global $g0 (mut i32) (i32.const 65536))
  (global $g1 (mut i32) (i32.const 0))
  (global $g2 (mut i32) (i32.const 0))
  (elem $e0 (i32.const 1) func $f1)
  (data $d0 (i32.const 65536) "@\00\00\00\22\00\00\00\19\00\00\00\0c\00\00\00\16\00\00\00\0b\00\00\00Z\00\00\00"))

-------------

