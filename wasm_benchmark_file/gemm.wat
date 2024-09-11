(module
  (type $t0 (func (param i32) (result i32)))
  (type $t1 (func (param i32 i32 i32) (result i32)))
  (type $t2 (func (param i32)))
  (type $t3 (func (param i32 i32 i32)))
  (type $t4 (func (param i32 i32) (result i32)))
  (type $t5 (func (param i32 i64 i32) (result i64)))
  (type $t6 (func))
  (type $t7 (func (result i32)))
  (type $t8 (func (param i32 f64 i32 i32 i32 i32) (result i32)))
  (type $t9 (func (param i32 i32 i32 i32) (result i32)))
  (type $t10 (func (param i32 i64 i32 i32) (result i32)))
  (type $t11 (func (param i64) (result i32)))
  (type $t12 (func (param f64 i32) (result f64)))
  (type $t13 (func (param i32 i32 i32 i32)))
  (type $t14 (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type $t15 (func (param i64 i32) (result i32)))
  (type $t16 (func (param i32 i32 i32 i32 i32)))
  (type $t17 (func (param i32 i32)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $wasi_snapshot_preview1.args_sizes_get (type $t4)))
  (import "wasi_snapshot_preview1" "args_get" (func $wasi_snapshot_preview1.args_get (type $t4)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $wasi_snapshot_preview1.proc_exit (type $t2)))
  (import "wasi_snapshot_preview1" "fd_close" (func $wasi_snapshot_preview1.fd_close (type $t0)))
  (import "wasi_snapshot_preview1" "fd_write" (func $wasi_snapshot_preview1.fd_write (type $t9)))
  (import "wasi_snapshot_preview1" "fd_seek" (func $wasi_snapshot_preview1.fd_seek (type $t10)))
  (func $f6 (type $t6)
    (i32.store
      (i32.const 2184)
      (i32.const 2064))
    (i32.store
      (i32.const 2112)
      (i32.const 42)))
  (func $f7 (type $t11) (param $p0 i64) (result i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32) (local $l14 i32)
    (global.set $g0
      (local.tee $l11
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get $l11)
      (i32.const 0))
    (local.set $l1
      (if $I0 (result i32)
        (i32.gt_u
          (local.tee $l1
            (i32.shl
              (i32.wrap_i64
                (local.get $p0))
              (i32.const 3)))
          (i32.const -4160))
        (then
          (i32.const 48))
        (else
          (if $I133 (result i32)
            (local.tee $l1
              (block $B1 (result i32)
                (if $I2
                  (i32.ge_u
                    (local.get $l1)
                    (i32.const -4160))
                  (then
                    (i32.store
                      (i32.const 2016)
                      (i32.const 48))
                    (br $B1
                      (i32.const 0))))
                (global.set $g0
                  (local.tee $l13
                    (i32.sub
                      (global.get $g0)
                      (i32.const 16))))
                (block $B3
                  (block $B4
                    (block $B5
                      (block $B6
                        (block $B7
                          (block $B8
                            (block $B9
                              (block $B10
                                (block $B11
                                  (block $B12
                                    (block $B13
                                      (block $B14
                                        (block $B15
                                          (block $B16
                                            (if $I17
                                              (i32.le_u
                                                (local.tee $l1
                                                  (i32.add
                                                    (local.tee $l12
                                                      (select
                                                        (i32.const 16)
                                                        (i32.and
                                                          (i32.add
                                                            (local.get $l1)
                                                            (i32.const 11))
                                                          (i32.const -8))
                                                        (i32.lt_u
                                                          (local.get $l1)
                                                          (i32.const 11))))
                                                    (i32.const 4108)))
                                                (i32.const 244))
                                              (then
                                                (if $I18
                                                  (i32.and
                                                    (local.tee $l2
                                                      (i32.shr_u
                                                        (local.tee $l6
                                                          (i32.load
                                                            (i32.const 3272)))
                                                        (local.tee $l1
                                                          (i32.shr_u
                                                            (local.tee $l7
                                                              (select
                                                                (i32.const 16)
                                                                (i32.and
                                                                  (i32.add
                                                                    (local.get $l1)
                                                                    (i32.const 11))
                                                                  (i32.const -8))
                                                                (i32.lt_u
                                                                  (local.get $l1)
                                                                  (i32.const 11))))
                                                            (i32.const 3)))))
                                                    (i32.const 3))
                                                  (then
                                                    (block $B19
                                                      (if $I20
                                                        (i32.eq
                                                          (local.tee $l2
                                                            (i32.add
                                                              (local.tee $l1
                                                                (i32.shl
                                                                  (local.tee $l3
                                                                    (i32.add
                                                                      (i32.and
                                                                        (i32.xor
                                                                          (local.get $l2)
                                                                          (i32.const -1))
                                                                        (i32.const 1))
                                                                      (local.get $l1)))
                                                                  (i32.const 3)))
                                                              (i32.const 3312)))
                                                          (local.tee $l4
                                                            (i32.load offset=8
                                                              (local.tee $l1
                                                                (i32.load
                                                                  (i32.add
                                                                    (local.get $l1)
                                                                    (i32.const 3320)))))))
                                                        (then
                                                          (i32.store
                                                            (i32.const 3272)
                                                            (i32.and
                                                              (local.get $l6)
                                                              (i32.rotl
                                                                (i32.const -2)
                                                                (local.get $l3))))
                                                          (br $B19)))
                                                      (i32.store offset=12
                                                        (local.get $l4)
                                                        (local.get $l2))
                                                      (i32.store offset=8
                                                        (local.get $l2)
                                                        (local.get $l4)))
                                                    (local.set $l2
                                                      (i32.add
                                                        (local.get $l1)
                                                        (i32.const 8)))
                                                    (i32.store offset=4
                                                      (local.get $l1)
                                                      (i32.or
                                                        (local.tee $l3
                                                          (i32.shl
                                                            (local.get $l3)
                                                            (i32.const 3)))
                                                        (i32.const 3)))
                                                    (i32.store offset=4
                                                      (local.tee $l1
                                                        (i32.add
                                                          (local.get $l1)
                                                          (local.get $l3)))
                                                      (i32.or
                                                        (i32.load offset=4
                                                          (local.get $l1))
                                                        (i32.const 1)))
                                                    (br $B3)))
                                                (br_if $B16
                                                  (i32.le_u
                                                    (local.get $l7)
                                                    (local.tee $l8
                                                      (i32.load
                                                        (i32.const 3280)))))
                                                (if $I21
                                                  (local.get $l2)
                                                  (then
                                                    (block $B22
                                                      (if $I23
                                                        (i32.eq
                                                          (local.tee $l3
                                                            (i32.add
                                                              (local.tee $l1
                                                                (i32.shl
                                                                  (local.tee $l2
                                                                    (i32.ctz
                                                                      (i32.and
                                                                        (i32.or
                                                                          (local.tee $l3
                                                                            (i32.shl
                                                                              (i32.const 2)
                                                                              (local.get $l1)))
                                                                          (i32.sub
                                                                            (i32.const 0)
                                                                            (local.get $l3)))
                                                                        (i32.shl
                                                                          (local.get $l2)
                                                                          (local.get $l1)))))
                                                                  (i32.const 3)))
                                                              (i32.const 3312)))
                                                          (local.tee $l4
                                                            (i32.load offset=8
                                                              (local.tee $l1
                                                                (i32.load
                                                                  (i32.add
                                                                    (local.get $l1)
                                                                    (i32.const 3320)))))))
                                                        (then
                                                          (i32.store
                                                            (i32.const 3272)
                                                            (local.tee $l6
                                                              (i32.and
                                                                (local.get $l6)
                                                                (i32.rotl
                                                                  (i32.const -2)
                                                                  (local.get $l2)))))
                                                          (br $B22)))
                                                      (i32.store offset=12
                                                        (local.get $l4)
                                                        (local.get $l3))
                                                      (i32.store offset=8
                                                        (local.get $l3)
                                                        (local.get $l4)))
                                                    (i32.store offset=4
                                                      (local.get $l1)
                                                      (i32.or
                                                        (local.get $l7)
                                                        (i32.const 3)))
                                                    (i32.store offset=4
                                                      (local.tee $l9
                                                        (i32.add
                                                          (local.get $l1)
                                                          (local.get $l7)))
                                                      (i32.or
                                                        (local.tee $l4
                                                          (i32.sub
                                                            (local.tee $l2
                                                              (i32.shl
                                                                (local.get $l2)
                                                                (i32.const 3)))
                                                            (local.get $l7)))
                                                        (i32.const 1)))
                                                    (i32.store
                                                      (i32.add
                                                        (local.get $l1)
                                                        (local.get $l2))
                                                      (local.get $l4))
                                                    (if $I24
                                                      (local.get $l8)
                                                      (then
                                                        (local.set $l2
                                                          (i32.add
                                                            (i32.and
                                                              (local.get $l8)
                                                              (i32.const -8))
                                                            (i32.const 3312)))
                                                        (local.set $l3
                                                          (i32.load
                                                            (i32.const 3292)))
                                                        (local.set $l5
                                                          (block $B25 (result i32)
                                                            (if $I26
                                                              (i32.eqz
                                                                (i32.and
                                                                  (local.get $l6)
                                                                  (local.tee $l5
                                                                    (i32.shl
                                                                      (i32.const 1)
                                                                      (i32.shr_u
                                                                        (local.get $l8)
                                                                        (i32.const 3))))))
                                                              (then
                                                                (i32.store
                                                                  (i32.const 3272)
                                                                  (i32.or
                                                                    (local.get $l5)
                                                                    (local.get $l6)))
                                                                (br $B25
                                                                  (local.get $l2))))
                                                            (i32.load offset=8
                                                              (local.get $l2))))
                                                        (i32.store offset=8
                                                          (local.get $l2)
                                                          (local.get $l3))
                                                        (i32.store offset=12
                                                          (local.get $l5)
                                                          (local.get $l3))
                                                        (i32.store offset=12
                                                          (local.get $l3)
                                                          (local.get $l2))
                                                        (i32.store offset=8
                                                          (local.get $l3)
                                                          (local.get $l5))))
                                                    (local.set $l2
                                                      (i32.add
                                                        (local.get $l1)
                                                        (i32.const 8)))
                                                    (i32.store
                                                      (i32.const 3292)
                                                      (local.get $l9))
                                                    (i32.store
                                                      (i32.const 3280)
                                                      (local.get $l4))
                                                    (br $B3)))
                                                (br_if $B16
                                                  (i32.eqz
                                                    (local.tee $l14
                                                      (i32.load
                                                        (i32.const 3276)))))
                                                (local.set $l5
                                                  (i32.sub
                                                    (i32.and
                                                      (i32.load offset=4
                                                        (local.tee $l3
                                                          (i32.load
                                                            (i32.add
                                                              (i32.shl
                                                                (i32.ctz
                                                                  (local.get $l14))
                                                                (i32.const 2))
                                                              (i32.const 3576)))))
                                                      (i32.const -8))
                                                    (local.get $l7)))
                                                (local.set $l1
                                                  (local.get $l3))
                                                (loop $L27
                                                  (block $B28
                                                    (if $I29
                                                      (i32.eqz
                                                        (local.tee $l2
                                                          (i32.load offset=16
                                                            (local.get $l1))))
                                                      (then
                                                        (br_if $B28
                                                          (i32.eqz
                                                            (local.tee $l2
                                                              (i32.load offset=20
                                                                (local.get $l1)))))))
                                                    (local.set $l5
                                                      (select
                                                        (local.tee $l1
                                                          (i32.sub
                                                            (i32.and
                                                              (i32.load offset=4
                                                                (local.get $l2))
                                                              (i32.const -8))
                                                            (local.get $l7)))
                                                        (local.get $l5)
                                                        (local.tee $l1
                                                          (i32.lt_u
                                                            (local.get $l1)
                                                            (local.get $l5)))))
                                                    (local.set $l3
                                                      (select
                                                        (local.get $l2)
                                                        (local.get $l3)
                                                        (local.get $l1)))
                                                    (local.set $l1
                                                      (local.get $l2))
                                                    (br $L27)))
                                                (local.set $l10
                                                  (i32.load offset=24
                                                    (local.get $l3)))
                                                (if $I30
                                                  (i32.ne
                                                    (local.get $l3)
                                                    (local.tee $l4
                                                      (i32.load offset=12
                                                        (local.get $l3))))
                                                  (then
                                                    (drop
                                                      (i32.load
                                                        (i32.const 3288)))
                                                    (i32.store offset=12
                                                      (local.tee $l1
                                                        (i32.load offset=8
                                                          (local.get $l3)))
                                                      (local.get $l4))
                                                    (i32.store offset=8
                                                      (local.get $l4)
                                                      (local.get $l1))
                                                    (br $B4)))
                                                (if $I31
                                                  (i32.eqz
                                                    (local.tee $l2
                                                      (i32.load
                                                        (local.tee $l1
                                                          (i32.add
                                                            (local.get $l3)
                                                            (i32.const 20))))))
                                                  (then
                                                    (br_if $B15
                                                      (i32.eqz
                                                        (local.tee $l2
                                                          (i32.load offset=16
                                                            (local.get $l3)))))
                                                    (local.set $l1
                                                      (i32.add
                                                        (local.get $l3)
                                                        (i32.const 16)))))
                                                (loop $L32
                                                  (local.set $l9
                                                    (local.get $l1))
                                                  (br_if $L32
                                                    (local.tee $l2
                                                      (i32.load
                                                        (local.tee $l1
                                                          (i32.add
                                                            (local.tee $l4
                                                              (local.get $l2))
                                                            (i32.const 20))))))
                                                  (local.set $l1
                                                    (i32.add
                                                      (local.get $l4)
                                                      (i32.const 16)))
                                                  (br_if $L32
                                                    (local.tee $l2
                                                      (i32.load offset=16
                                                        (local.get $l4)))))
                                                (i32.store
                                                  (local.get $l9)
                                                  (i32.const 0))
                                                (br $B4)))
                                            (local.set $l7
                                              (i32.const -1))
                                            (br_if $B16
                                              (i32.gt_u
                                                (local.get $l1)
                                                (i32.const -65)))
                                            (local.set $l7
                                              (i32.and
                                                (local.tee $l1
                                                  (i32.add
                                                    (local.get $l1)
                                                    (i32.const 11)))
                                                (i32.const -8)))
                                            (br_if $B16
                                              (i32.eqz
                                                (local.tee $l9
                                                  (i32.load
                                                    (i32.const 3276)))))
                                            (local.set $l5
                                              (i32.sub
                                                (i32.const 0)
                                                (local.get $l7)))
                                            (block $B33
                                              (block $B34
                                                (block $B35
                                                  (if $I37
                                                    (i32.eqz
                                                      (local.tee $l1
                                                        (i32.load
                                                          (i32.add
                                                            (i32.shl
                                                              (local.tee $l8
                                                                (block $B36 (result i32)
                                                                  (drop
                                                                    (br_if $B36
                                                                      (i32.const 0)
                                                                      (i32.lt_u
                                                                        (local.get $l7)
                                                                        (i32.const 256))))
                                                                  (drop
                                                                    (br_if $B36
                                                                      (i32.const 31)
                                                                      (i32.gt_u
                                                                        (local.get $l7)
                                                                        (i32.const 16777215))))
                                                                  (i32.add
                                                                    (i32.sub
                                                                      (i32.and
                                                                        (i32.shr_u
                                                                          (local.get $l7)
                                                                          (i32.sub
                                                                            (i32.const 38)
                                                                            (local.tee $l1
                                                                              (i32.clz
                                                                                (i32.shr_u
                                                                                  (local.get $l1)
                                                                                  (i32.const 8))))))
                                                                        (i32.const 1))
                                                                      (i32.shl
                                                                        (local.get $l1)
                                                                        (i32.const 1)))
                                                                    (i32.const 62))))
                                                              (i32.const 2))
                                                            (i32.const 3576)))))
                                                    (then
                                                      (br $B35)))
                                                  (local.set $l3
                                                    (i32.shl
                                                      (local.get $l7)
                                                      (select
                                                        (i32.sub
                                                          (i32.const 25)
                                                          (i32.shr_u
                                                            (local.get $l8)
                                                            (i32.const 1)))
                                                        (i32.const 0)
                                                        (i32.ne
                                                          (local.get $l8)
                                                          (i32.const 31)))))
                                                  (loop $L38
                                                    (block $B39
                                                      (br_if $B39
                                                        (i32.ge_u
                                                          (local.tee $l6
                                                            (i32.sub
                                                              (i32.and
                                                                (i32.load offset=4
                                                                  (local.get $l1))
                                                                (i32.const -8))
                                                              (local.get $l7)))
                                                          (local.get $l5)))
                                                      (local.set $l4
                                                        (local.get $l1))
                                                      (br_if $B39
                                                        (local.tee $l5
                                                          (local.get $l6)))
                                                      (local.set $l5
                                                        (i32.const 0))
                                                      (local.set $l2
                                                        (local.get $l1))
                                                      (br $B34))
                                                    (local.set $l2
                                                      (select
                                                        (select
                                                          (local.get $l2)
                                                          (local.tee $l6
                                                            (i32.load offset=20
                                                              (local.get $l1)))
                                                          (i32.eq
                                                            (local.get $l6)
                                                            (local.tee $l1
                                                              (i32.load offset=16
                                                                (i32.add
                                                                  (local.get $l1)
                                                                  (i32.and
                                                                    (i32.shr_u
                                                                      (local.get $l3)
                                                                      (i32.const 29))
                                                                    (i32.const 4)))))))
                                                        (local.get $l2)
                                                        (local.get $l6)))
                                                    (local.set $l3
                                                      (i32.shl
                                                        (local.get $l3)
                                                        (i32.const 1)))
                                                    (br_if $L38
                                                      (local.get $l1))))
                                                (if $I40
                                                  (i32.eqz
                                                    (i32.or
                                                      (local.get $l2)
                                                      (local.get $l4)))
                                                  (then
                                                    (local.set $l4
                                                      (i32.const 0))
                                                    (br_if $B16
                                                      (i32.eqz
                                                        (local.tee $l1
                                                          (i32.and
                                                            (i32.or
                                                              (local.tee $l1
                                                                (i32.shl
                                                                  (i32.const 2)
                                                                  (local.get $l8)))
                                                              (i32.sub
                                                                (i32.const 0)
                                                                (local.get $l1)))
                                                            (local.get $l9)))))
                                                    (local.set $l2
                                                      (i32.load
                                                        (i32.add
                                                          (i32.shl
                                                            (i32.ctz
                                                              (local.get $l1))
                                                            (i32.const 2))
                                                          (i32.const 3576))))))
                                                (br_if $B33
                                                  (i32.eqz
                                                    (local.get $l2))))
                                              (loop $L41
                                                (local.set $l1
                                                  (i32.lt_u
                                                    (local.tee $l3
                                                      (i32.sub
                                                        (i32.and
                                                          (i32.load offset=4
                                                            (local.get $l2))
                                                          (i32.const -8))
                                                        (local.get $l7)))
                                                    (local.get $l5)))
                                                (local.set $l5
                                                  (select
                                                    (local.get $l3)
                                                    (local.get $l5)
                                                    (local.get $l1)))
                                                (local.set $l4
                                                  (select
                                                    (local.get $l2)
                                                    (local.get $l4)
                                                    (local.get $l1)))
                                                (br_if $L41
                                                  (local.tee $l2
                                                    (if $I42 (result i32)
                                                      (local.tee $l1
                                                        (i32.load offset=16
                                                          (local.get $l2)))
                                                      (then
                                                        (local.get $l1))
                                                      (else
                                                        (i32.load offset=20
                                                          (local.get $l2))))))))
                                            (br_if $B16
                                              (i32.eqz
                                                (local.get $l4)))
                                            (br_if $B16
                                              (i32.ge_u
                                                (local.get $l5)
                                                (i32.sub
                                                  (i32.load
                                                    (i32.const 3280))
                                                  (local.get $l7))))
                                            (local.set $l8
                                              (i32.load offset=24
                                                (local.get $l4)))
                                            (if $I43
                                              (i32.ne
                                                (local.get $l4)
                                                (local.tee $l3
                                                  (i32.load offset=12
                                                    (local.get $l4))))
                                              (then
                                                (drop
                                                  (i32.load
                                                    (i32.const 3288)))
                                                (i32.store offset=12
                                                  (local.tee $l1
                                                    (i32.load offset=8
                                                      (local.get $l4)))
                                                  (local.get $l3))
                                                (i32.store offset=8
                                                  (local.get $l3)
                                                  (local.get $l1))
                                                (br $B5)))
                                            (if $I44
                                              (i32.eqz
                                                (local.tee $l2
                                                  (i32.load
                                                    (local.tee $l1
                                                      (i32.add
                                                        (local.get $l4)
                                                        (i32.const 20))))))
                                              (then
                                                (br_if $B14
                                                  (i32.eqz
                                                    (local.tee $l2
                                                      (i32.load offset=16
                                                        (local.get $l4)))))
                                                (local.set $l1
                                                  (i32.add
                                                    (local.get $l4)
                                                    (i32.const 16)))))
                                            (loop $L45
                                              (local.set $l6
                                                (local.get $l1))
                                              (br_if $L45
                                                (local.tee $l2
                                                  (i32.load
                                                    (local.tee $l1
                                                      (i32.add
                                                        (local.tee $l3
                                                          (local.get $l2))
                                                        (i32.const 20))))))
                                              (local.set $l1
                                                (i32.add
                                                  (local.get $l3)
                                                  (i32.const 16)))
                                              (br_if $L45
                                                (local.tee $l2
                                                  (i32.load offset=16
                                                    (local.get $l3)))))
                                            (i32.store
                                              (local.get $l6)
                                              (i32.const 0))
                                            (br $B5))
                                          (if $I46
                                            (i32.le_u
                                              (local.get $l7)
                                              (local.tee $l4
                                                (i32.load
                                                  (i32.const 3280))))
                                            (then
                                              (local.set $l2
                                                (i32.load
                                                  (i32.const 3292)))
                                              (block $B47
                                                (if $I48
                                                  (i32.ge_u
                                                    (local.tee $l1
                                                      (i32.sub
                                                        (local.get $l4)
                                                        (local.get $l7)))
                                                    (i32.const 16))
                                                  (then
                                                    (i32.store offset=4
                                                      (local.tee $l3
                                                        (i32.add
                                                          (local.get $l2)
                                                          (local.get $l7)))
                                                      (i32.or
                                                        (local.get $l1)
                                                        (i32.const 1)))
                                                    (i32.store
                                                      (i32.add
                                                        (local.get $l2)
                                                        (local.get $l4))
                                                      (local.get $l1))
                                                    (i32.store offset=4
                                                      (local.get $l2)
                                                      (i32.or
                                                        (local.get $l7)
                                                        (i32.const 3)))
                                                    (br $B47)))
                                                (i32.store offset=4
                                                  (local.get $l2)
                                                  (i32.or
                                                    (local.get $l4)
                                                    (i32.const 3)))
                                                (i32.store offset=4
                                                  (local.tee $l1
                                                    (i32.add
                                                      (local.get $l2)
                                                      (local.get $l4)))
                                                  (i32.or
                                                    (i32.load offset=4
                                                      (local.get $l1))
                                                    (i32.const 1)))
                                                (local.set $l3
                                                  (i32.const 0))
                                                (local.set $l1
                                                  (i32.const 0)))
                                              (i32.store
                                                (i32.const 3280)
                                                (local.get $l1))
                                              (i32.store
                                                (i32.const 3292)
                                                (local.get $l3))
                                              (local.set $l2
                                                (i32.add
                                                  (local.get $l2)
                                                  (i32.const 8)))
                                              (br $B3)))
                                          (if $I49
                                            (i32.lt_u
                                              (local.get $l7)
                                              (local.tee $l3
                                                (i32.load
                                                  (i32.const 3284))))
                                            (then
                                              (i32.store
                                                (i32.const 3284)
                                                (local.tee $l2
                                                  (i32.sub
                                                    (local.get $l3)
                                                    (local.get $l7))))
                                              (i32.store
                                                (i32.const 3296)
                                                (local.tee $l3
                                                  (i32.add
                                                    (local.tee $l1
                                                      (i32.load
                                                        (i32.const 3296)))
                                                    (local.get $l7))))
                                              (i32.store offset=4
                                                (local.get $l3)
                                                (i32.or
                                                  (local.get $l2)
                                                  (i32.const 1)))
                                              (i32.store offset=4
                                                (local.get $l1)
                                                (i32.or
                                                  (local.get $l7)
                                                  (i32.const 3)))
                                              (local.set $l2
                                                (i32.add
                                                  (local.get $l1)
                                                  (i32.const 8)))
                                              (br $B3)))
                                          (local.set $l2
                                            (i32.const 0))
                                          (br_if $B3
                                            (i32.le_u
                                              (local.tee $l1
                                                (i32.and
                                                  (local.tee $l6
                                                    (i32.add
                                                      (local.tee $l5
                                                        (i32.add
                                                          (local.get $l7)
                                                          (i32.const 47)))
                                                      (local.tee $l1
                                                        (block $B50 (result i32)
                                                          (if $I51
                                                            (i32.load
                                                              (i32.const 3744))
                                                            (then
                                                              (br $B50
                                                                (i32.load
                                                                  (i32.const 3752)))))
                                                          (i64.store align=4
                                                            (i32.const 3756)
                                                            (i64.const -1))
                                                          (i64.store align=4
                                                            (i32.const 3748)
                                                            (i64.const 17592186048512))
                                                          (i32.store
                                                            (i32.const 3744)
                                                            (i32.xor
                                                              (i32.and
                                                                (i32.add
                                                                  (local.get $l13)
                                                                  (i32.const 12))
                                                                (i32.const -16))
                                                              (i32.const 1431655768)))
                                                          (i32.store
                                                            (i32.const 3764)
                                                            (i32.const 0))
                                                          (i32.store
                                                            (i32.const 3716)
                                                            (i32.const 0))
                                                          (i32.const 4096)))))
                                                  (local.tee $l9
                                                    (i32.sub
                                                      (i32.const 0)
                                                      (local.get $l1)))))
                                              (local.get $l7)))
                                          (if $I52
                                            (local.tee $l4
                                              (i32.load
                                                (i32.const 3712)))
                                            (then
                                              (br_if $B3
                                                (i32.le_u
                                                  (local.tee $l10
                                                    (i32.add
                                                      (local.tee $l8
                                                        (i32.load
                                                          (i32.const 3704)))
                                                      (local.get $l1)))
                                                  (local.get $l8)))
                                              (br_if $B3
                                                (i32.lt_u
                                                  (local.get $l4)
                                                  (local.get $l10)))))
                                          (block $B53
                                            (if $I54
                                              (i32.eqz
                                                (i32.and
                                                  (i32.load8_u
                                                    (i32.const 3716))
                                                  (i32.const 4)))
                                              (then
                                                (block $B55
                                                  (block $B56
                                                    (block $B57
                                                      (block $B58
                                                        (if $I59
                                                          (local.tee $l4
                                                            (i32.load
                                                              (i32.const 3296)))
                                                          (then
                                                            (local.set $l2
                                                              (i32.const 3720))
                                                            (loop $L60
                                                              (if $I61
                                                                (i32.ge_u
                                                                  (local.get $l4)
                                                                  (local.tee $l8
                                                                    (i32.load
                                                                      (local.get $l2))))
                                                                (then
                                                                  (br_if $B58
                                                                    (i32.gt_u
                                                                      (i32.add
                                                                        (local.get $l8)
                                                                        (i32.load offset=4
                                                                          (local.get $l2)))
                                                                      (local.get $l4)))))
                                                              (br_if $L60
                                                                (local.tee $l2
                                                                  (i32.load offset=8
                                                                    (local.get $l2)))))))
                                                        (br_if $B55
                                                          (i32.eq
                                                            (local.tee $l3
                                                              (call $f33
                                                                (i32.const 0)))
                                                            (i32.const -1)))
                                                        (local.set $l6
                                                          (local.get $l1))
                                                        (if $I62
                                                          (i32.and
                                                            (local.tee $l4
                                                              (i32.sub
                                                                (local.tee $l2
                                                                  (i32.load
                                                                    (i32.const 3748)))
                                                                (i32.const 1)))
                                                            (local.get $l3))
                                                          (then
                                                            (local.set $l6
                                                              (i32.add
                                                                (i32.sub
                                                                  (local.get $l1)
                                                                  (local.get $l3))
                                                                (i32.and
                                                                  (i32.add
                                                                    (local.get $l3)
                                                                    (local.get $l4))
                                                                  (i32.sub
                                                                    (i32.const 0)
                                                                    (local.get $l2)))))))
                                                        (br_if $B55
                                                          (i32.le_u
                                                            (local.get $l6)
                                                            (local.get $l7)))
                                                        (if $I63
                                                          (local.tee $l2
                                                            (i32.load
                                                              (i32.const 3712)))
                                                          (then
                                                            (br_if $B55
                                                              (i32.le_u
                                                                (local.tee $l9
                                                                  (i32.add
                                                                    (local.tee $l4
                                                                      (i32.load
                                                                        (i32.const 3704)))
                                                                    (local.get $l6)))
                                                                (local.get $l4)))
                                                            (br_if $B55
                                                              (i32.lt_u
                                                                (local.get $l2)
                                                                (local.get $l9)))))
                                                        (br_if $B57
                                                          (i32.ne
                                                            (local.tee $l2
                                                              (call $f33
                                                                (local.get $l6)))
                                                            (local.get $l3)))
                                                        (br $B53))
                                                      (br_if $B56
                                                        (i32.eq
                                                          (local.tee $l3
                                                            (call $f33
                                                              (local.tee $l6
                                                                (i32.and
                                                                  (i32.sub
                                                                    (local.get $l6)
                                                                    (local.get $l3))
                                                                  (local.get $l9)))))
                                                          (i32.add
                                                            (i32.load
                                                              (local.get $l2))
                                                            (i32.load offset=4
                                                              (local.get $l2)))))
                                                      (local.set $l2
                                                        (local.get $l3)))
                                                    (br_if $B55
                                                      (i32.eq
                                                        (local.get $l2)
                                                        (i32.const -1)))
                                                    (if $I64
                                                      (i32.le_u
                                                        (i32.add
                                                          (local.get $l7)
                                                          (i32.const 48))
                                                        (local.get $l6))
                                                      (then
                                                        (local.set $l3
                                                          (local.get $l2))
                                                        (br $B53)))
                                                    (br_if $B55
                                                      (i32.eq
                                                        (call $f33
                                                          (local.tee $l3
                                                            (i32.and
                                                              (i32.add
                                                                (local.tee $l3
                                                                  (i32.load
                                                                    (i32.const 3752)))
                                                                (i32.sub
                                                                  (local.get $l5)
                                                                  (local.get $l6)))
                                                              (i32.sub
                                                                (i32.const 0)
                                                                (local.get $l3)))))
                                                        (i32.const -1)))
                                                    (local.set $l6
                                                      (i32.add
                                                        (local.get $l3)
                                                        (local.get $l6)))
                                                    (local.set $l3
                                                      (local.get $l2))
                                                    (br $B53))
                                                  (br_if $B53
                                                    (i32.ne
                                                      (local.get $l3)
                                                      (i32.const -1))))
                                                (i32.store
                                                  (i32.const 3716)
                                                  (i32.or
                                                    (i32.load
                                                      (i32.const 3716))
                                                    (i32.const 4)))))
                                            (local.set $l3
                                              (call $f33
                                                (local.get $l1)))
                                            (local.set $l1
                                              (call $f33
                                                (i32.const 0)))
                                            (br_if $B11
                                              (i32.eq
                                                (local.get $l3)
                                                (i32.const -1)))
                                            (br_if $B11
                                              (i32.eq
                                                (local.get $l1)
                                                (i32.const -1)))
                                            (br_if $B11
                                              (i32.le_u
                                                (local.get $l1)
                                                (local.get $l3)))
                                            (br_if $B11
                                              (i32.le_u
                                                (local.tee $l6
                                                  (i32.sub
                                                    (local.get $l1)
                                                    (local.get $l3)))
                                                (i32.add
                                                  (local.get $l7)
                                                  (i32.const 40)))))
                                          (i32.store
                                            (i32.const 3704)
                                            (local.tee $l1
                                              (i32.add
                                                (i32.load
                                                  (i32.const 3704))
                                                (local.get $l6))))
                                          (if $I65
                                            (i32.lt_u
                                              (i32.load
                                                (i32.const 3708))
                                              (local.get $l1))
                                            (then
                                              (i32.store
                                                (i32.const 3708)
                                                (local.get $l1))))
                                          (block $B66
                                            (if $I67
                                              (local.tee $l5
                                                (i32.load
                                                  (i32.const 3296)))
                                              (then
                                                (local.set $l2
                                                  (i32.const 3720))
                                                (loop $L68
                                                  (br_if $B66
                                                    (i32.eq
                                                      (local.get $l3)
                                                      (i32.add
                                                        (local.tee $l1
                                                          (i32.load
                                                            (local.get $l2)))
                                                        (local.tee $l4
                                                          (i32.load offset=4
                                                            (local.get $l2))))))
                                                  (br_if $L68
                                                    (local.tee $l2
                                                      (i32.load offset=8
                                                        (local.get $l2)))))
                                                (br $B13)))
                                            (if $I69
                                              (i32.eqz
                                                (select
                                                  (local.tee $l1
                                                    (i32.load
                                                      (i32.const 3288)))
                                                  (i32.const 0)
                                                  (i32.le_u
                                                    (local.get $l1)
                                                    (local.get $l3))))
                                              (then
                                                (i32.store
                                                  (i32.const 3288)
                                                  (local.get $l3))))
                                            (local.set $l2
                                              (i32.const 0))
                                            (i32.store
                                              (i32.const 3724)
                                              (local.get $l6))
                                            (i32.store
                                              (i32.const 3720)
                                              (local.get $l3))
                                            (i32.store
                                              (i32.const 3304)
                                              (i32.const -1))
                                            (i32.store
                                              (i32.const 3308)
                                              (i32.load
                                                (i32.const 3744)))
                                            (i32.store
                                              (i32.const 3732)
                                              (i32.const 0))
                                            (loop $L70
                                              (i32.store
                                                (i32.add
                                                  (local.tee $l1
                                                    (i32.shl
                                                      (local.get $l2)
                                                      (i32.const 3)))
                                                  (i32.const 3320))
                                                (local.tee $l4
                                                  (i32.add
                                                    (local.get $l1)
                                                    (i32.const 3312))))
                                              (i32.store
                                                (i32.add
                                                  (local.get $l1)
                                                  (i32.const 3324))
                                                (local.get $l4))
                                              (br_if $L70
                                                (i32.ne
                                                  (local.tee $l2
                                                    (i32.add
                                                      (local.get $l2)
                                                      (i32.const 1)))
                                                  (i32.const 32))))
                                            (i32.store
                                              (i32.const 3284)
                                              (local.tee $l4
                                                (i32.sub
                                                  (local.tee $l1
                                                    (i32.sub
                                                      (local.get $l6)
                                                      (i32.const 40)))
                                                  (local.tee $l2
                                                    (i32.and
                                                      (i32.sub
                                                        (i32.const -8)
                                                        (local.get $l3))
                                                      (i32.const 7))))))
                                            (i32.store
                                              (i32.const 3296)
                                              (local.tee $l2
                                                (i32.add
                                                  (local.get $l2)
                                                  (local.get $l3))))
                                            (i32.store offset=4
                                              (local.get $l2)
                                              (i32.or
                                                (local.get $l4)
                                                (i32.const 1)))
                                            (i32.store offset=4
                                              (i32.add
                                                (local.get $l1)
                                                (local.get $l3))
                                              (i32.const 40))
                                            (i32.store
                                              (i32.const 3300)
                                              (i32.load
                                                (i32.const 3760)))
                                            (br $B12))
                                          (br_if $B13
                                            (i32.le_u
                                              (local.get $l3)
                                              (local.get $l5)))
                                          (br_if $B13
                                            (i32.gt_u
                                              (local.get $l1)
                                              (local.get $l5)))
                                          (br_if $B13
                                            (i32.and
                                              (i32.load offset=12
                                                (local.get $l2))
                                              (i32.const 8)))
                                          (i32.store offset=4
                                            (local.get $l2)
                                            (i32.add
                                              (local.get $l4)
                                              (local.get $l6)))
                                          (i32.store
                                            (i32.const 3296)
                                            (local.tee $l2
                                              (i32.add
                                                (local.get $l5)
                                                (local.tee $l1
                                                  (i32.and
                                                    (i32.sub
                                                      (i32.const -8)
                                                      (local.get $l5))
                                                    (i32.const 7))))))
                                          (i32.store
                                            (i32.const 3284)
                                            (local.tee $l1
                                              (i32.sub
                                                (local.tee $l3
                                                  (i32.add
                                                    (i32.load
                                                      (i32.const 3284))
                                                    (local.get $l6)))
                                                (local.get $l1))))
                                          (i32.store offset=4
                                            (local.get $l2)
                                            (i32.or
                                              (local.get $l1)
                                              (i32.const 1)))
                                          (i32.store offset=4
                                            (i32.add
                                              (local.get $l3)
                                              (local.get $l5))
                                            (i32.const 40))
                                          (i32.store
                                            (i32.const 3300)
                                            (i32.load
                                              (i32.const 3760)))
                                          (br $B12))
                                        (local.set $l4
                                          (i32.const 0))
                                        (br $B4))
                                      (local.set $l3
                                        (i32.const 0))
                                      (br $B5))
                                    (if $I71
                                      (i32.gt_u
                                        (i32.load
                                          (i32.const 3288))
                                        (local.get $l3))
                                      (then
                                        (i32.store
                                          (i32.const 3288)
                                          (local.get $l3))))
                                    (local.set $l1
                                      (i32.add
                                        (local.get $l3)
                                        (local.get $l6)))
                                    (local.set $l2
                                      (i32.const 3720))
                                    (block $B72
                                      (block $B73
                                        (block $B74
                                          (loop $L75
                                            (if $I76
                                              (i32.ne
                                                (local.get $l1)
                                                (i32.load
                                                  (local.get $l2)))
                                              (then
                                                (br_if $L75
                                                  (local.tee $l2
                                                    (i32.load offset=8
                                                      (local.get $l2))))
                                                (br $B74))))
                                          (br_if $B73
                                            (i32.eqz
                                              (i32.and
                                                (i32.load8_u offset=12
                                                  (local.get $l2))
                                                (i32.const 8)))))
                                        (local.set $l2
                                          (i32.const 3720))
                                        (loop $L77
                                          (if $I78
                                            (i32.ge_u
                                              (local.get $l5)
                                              (local.tee $l1
                                                (i32.load
                                                  (local.get $l2))))
                                            (then
                                              (br_if $B72
                                                (i32.gt_u
                                                  (local.tee $l4
                                                    (i32.add
                                                      (local.get $l1)
                                                      (i32.load offset=4
                                                        (local.get $l2))))
                                                  (local.get $l5)))))
                                          (local.set $l2
                                            (i32.load offset=8
                                              (local.get $l2)))
                                          (br $L77))
                                        (unreachable))
                                      (i32.store
                                        (local.get $l2)
                                        (local.get $l3))
                                      (i32.store offset=4
                                        (local.get $l2)
                                        (i32.add
                                          (i32.load offset=4
                                            (local.get $l2))
                                          (local.get $l6)))
                                      (i32.store offset=4
                                        (local.tee $l8
                                          (i32.add
                                            (local.get $l3)
                                            (i32.and
                                              (i32.sub
                                                (i32.const -8)
                                                (local.get $l3))
                                              (i32.const 7))))
                                        (i32.or
                                          (local.get $l7)
                                          (i32.const 3)))
                                      (local.set $l2
                                        (i32.sub
                                          (local.tee $l6
                                            (i32.add
                                              (local.get $l1)
                                              (i32.and
                                                (i32.sub
                                                  (i32.const -8)
                                                  (local.get $l1))
                                                (i32.const 7))))
                                          (local.tee $l7
                                            (i32.add
                                              (local.get $l7)
                                              (local.get $l8)))))
                                      (if $I79
                                        (i32.eq
                                          (local.get $l5)
                                          (local.get $l6))
                                        (then
                                          (i32.store
                                            (i32.const 3296)
                                            (local.get $l7))
                                          (i32.store
                                            (i32.const 3284)
                                            (local.tee $l1
                                              (i32.add
                                                (i32.load
                                                  (i32.const 3284))
                                                (local.get $l2))))
                                          (i32.store offset=4
                                            (local.get $l7)
                                            (i32.or
                                              (local.get $l1)
                                              (i32.const 1)))
                                          (br $B6)))
                                      (if $I80
                                        (i32.eq
                                          (i32.load
                                            (i32.const 3292))
                                          (local.get $l6))
                                        (then
                                          (i32.store
                                            (i32.const 3292)
                                            (local.get $l7))
                                          (i32.store
                                            (i32.const 3280)
                                            (local.tee $l1
                                              (i32.add
                                                (i32.load
                                                  (i32.const 3280))
                                                (local.get $l2))))
                                          (i32.store offset=4
                                            (local.get $l7)
                                            (i32.or
                                              (local.get $l1)
                                              (i32.const 1)))
                                          (i32.store
                                            (i32.add
                                              (local.get $l1)
                                              (local.get $l7))
                                            (local.get $l1))
                                          (br $B6)))
                                      (br_if $B7
                                        (i32.ne
                                          (i32.and
                                            (local.tee $l5
                                              (i32.load offset=4
                                                (local.get $l6)))
                                            (i32.const 3))
                                          (i32.const 1)))
                                      (local.set $l10
                                        (i32.and
                                          (local.get $l5)
                                          (i32.const -8)))
                                      (if $I81
                                        (i32.le_u
                                          (local.get $l5)
                                          (i32.const 255))
                                        (then
                                          (if $I82
                                            (i32.eq
                                              (local.tee $l1
                                                (i32.load offset=12
                                                  (local.get $l6)))
                                              (local.tee $l3
                                                (i32.load offset=8
                                                  (local.get $l6))))
                                            (then
                                              (i32.store
                                                (i32.const 3272)
                                                (i32.and
                                                  (i32.load
                                                    (i32.const 3272))
                                                  (i32.rotl
                                                    (i32.const -2)
                                                    (i32.shr_u
                                                      (local.get $l5)
                                                      (i32.const 3)))))
                                              (br $B8)))
                                          (i32.store offset=12
                                            (local.get $l3)
                                            (local.get $l1))
                                          (i32.store offset=8
                                            (local.get $l1)
                                            (local.get $l3))
                                          (br $B8)))
                                      (local.set $l9
                                        (i32.load offset=24
                                          (local.get $l6)))
                                      (if $I83
                                        (i32.ne
                                          (local.get $l6)
                                          (local.tee $l3
                                            (i32.load offset=12
                                              (local.get $l6))))
                                        (then
                                          (i32.store offset=12
                                            (local.tee $l1
                                              (i32.load offset=8
                                                (local.get $l6)))
                                            (local.get $l3))
                                          (i32.store offset=8
                                            (local.get $l3)
                                            (local.get $l1))
                                          (br $B9)))
                                      (if $I84
                                        (i32.eqz
                                          (local.tee $l5
                                            (i32.load
                                              (local.tee $l1
                                                (i32.add
                                                  (local.get $l6)
                                                  (i32.const 20))))))
                                        (then
                                          (br_if $B10
                                            (i32.eqz
                                              (local.tee $l5
                                                (i32.load offset=16
                                                  (local.get $l6)))))
                                          (local.set $l1
                                            (i32.add
                                              (local.get $l6)
                                              (i32.const 16)))))
                                      (loop $L85
                                        (local.set $l4
                                          (local.get $l1))
                                        (br_if $L85
                                          (local.tee $l5
                                            (i32.load
                                              (local.tee $l1
                                                (i32.add
                                                  (local.tee $l3
                                                    (local.get $l5))
                                                  (i32.const 20))))))
                                        (local.set $l1
                                          (i32.add
                                            (local.get $l3)
                                            (i32.const 16)))
                                        (br_if $L85
                                          (local.tee $l5
                                            (i32.load offset=16
                                              (local.get $l3)))))
                                      (i32.store
                                        (local.get $l4)
                                        (i32.const 0))
                                      (br $B9))
                                    (i32.store
                                      (i32.const 3284)
                                      (local.tee $l9
                                        (i32.sub
                                          (local.tee $l1
                                            (i32.sub
                                              (local.get $l6)
                                              (i32.const 40)))
                                          (local.tee $l2
                                            (i32.and
                                              (i32.sub
                                                (i32.const -8)
                                                (local.get $l3))
                                              (i32.const 7))))))
                                    (i32.store
                                      (i32.const 3296)
                                      (local.tee $l2
                                        (i32.add
                                          (local.get $l2)
                                          (local.get $l3))))
                                    (i32.store offset=4
                                      (local.get $l2)
                                      (i32.or
                                        (local.get $l9)
                                        (i32.const 1)))
                                    (i32.store offset=4
                                      (i32.add
                                        (local.get $l1)
                                        (local.get $l3))
                                      (i32.const 40))
                                    (i32.store
                                      (i32.const 3300)
                                      (i32.load
                                        (i32.const 3760)))
                                    (i32.store offset=4
                                      (local.tee $l1
                                        (select
                                          (local.get $l5)
                                          (local.tee $l1
                                            (i32.sub
                                              (i32.add
                                                (local.get $l4)
                                                (i32.and
                                                  (i32.sub
                                                    (i32.const 39)
                                                    (local.get $l4))
                                                  (i32.const 7)))
                                              (i32.const 47)))
                                          (i32.lt_u
                                            (local.get $l1)
                                            (i32.add
                                              (local.get $l5)
                                              (i32.const 16)))))
                                      (i32.const 27))
                                    (i64.store offset=16 align=4
                                      (local.get $l1)
                                      (i64.load align=4
                                        (i32.const 3728)))
                                    (i64.store offset=8 align=4
                                      (local.get $l1)
                                      (i64.load align=4
                                        (i32.const 3720)))
                                    (i32.store
                                      (i32.const 3728)
                                      (i32.add
                                        (local.get $l1)
                                        (i32.const 8)))
                                    (i32.store
                                      (i32.const 3724)
                                      (local.get $l6))
                                    (i32.store
                                      (i32.const 3720)
                                      (local.get $l3))
                                    (i32.store
                                      (i32.const 3732)
                                      (i32.const 0))
                                    (local.set $l2
                                      (i32.add
                                        (local.get $l1)
                                        (i32.const 24)))
                                    (loop $L86
                                      (i32.store offset=4
                                        (local.get $l2)
                                        (i32.const 7))
                                      (local.set $l3
                                        (i32.add
                                          (local.get $l2)
                                          (i32.const 8)))
                                      (local.set $l2
                                        (i32.add
                                          (local.get $l2)
                                          (i32.const 4)))
                                      (br_if $L86
                                        (i32.lt_u
                                          (local.get $l3)
                                          (local.get $l4))))
                                    (br_if $B12
                                      (i32.eq
                                        (local.get $l1)
                                        (local.get $l5)))
                                    (i32.store offset=4
                                      (local.get $l1)
                                      (i32.and
                                        (i32.load offset=4
                                          (local.get $l1))
                                        (i32.const -2)))
                                    (i32.store offset=4
                                      (local.get $l5)
                                      (i32.or
                                        (local.tee $l3
                                          (i32.sub
                                            (local.get $l1)
                                            (local.get $l5)))
                                        (i32.const 1)))
                                    (i32.store
                                      (local.get $l1)
                                      (local.get $l3))
                                    (if $I87
                                      (i32.le_u
                                        (local.get $l3)
                                        (i32.const 255))
                                      (then
                                        (local.set $l1
                                          (i32.add
                                            (i32.and
                                              (local.get $l3)
                                              (i32.const -8))
                                            (i32.const 3312)))
                                        (local.set $l2
                                          (block $B88 (result i32)
                                            (if $I89
                                              (i32.eqz
                                                (i32.and
                                                  (local.tee $l2
                                                    (i32.load
                                                      (i32.const 3272)))
                                                  (local.tee $l3
                                                    (i32.shl
                                                      (i32.const 1)
                                                      (i32.shr_u
                                                        (local.get $l3)
                                                        (i32.const 3))))))
                                              (then
                                                (i32.store
                                                  (i32.const 3272)
                                                  (i32.or
                                                    (local.get $l2)
                                                    (local.get $l3)))
                                                (br $B88
                                                  (local.get $l1))))
                                            (i32.load offset=8
                                              (local.get $l1))))
                                        (i32.store offset=8
                                          (local.get $l1)
                                          (local.get $l5))
                                        (i32.store offset=12
                                          (local.get $l2)
                                          (local.get $l5))
                                        (i32.store offset=12
                                          (local.get $l5)
                                          (local.get $l1))
                                        (i32.store offset=8
                                          (local.get $l5)
                                          (local.get $l2))
                                        (br $B12)))
                                    (local.set $l2
                                      (i32.const 31))
                                    (if $I90
                                      (i32.le_u
                                        (local.get $l3)
                                        (i32.const 16777215))
                                      (then
                                        (local.set $l2
                                          (i32.add
                                            (i32.sub
                                              (i32.and
                                                (i32.shr_u
                                                  (local.get $l3)
                                                  (i32.sub
                                                    (i32.const 38)
                                                    (local.tee $l1
                                                      (i32.clz
                                                        (i32.shr_u
                                                          (local.get $l3)
                                                          (i32.const 8))))))
                                                (i32.const 1))
                                              (i32.shl
                                                (local.get $l1)
                                                (i32.const 1)))
                                            (i32.const 62)))))
                                    (i32.store offset=28
                                      (local.get $l5)
                                      (local.get $l2))
                                    (i64.store offset=16 align=4
                                      (local.get $l5)
                                      (i64.const 0))
                                    (local.set $l1
                                      (i32.add
                                        (i32.shl
                                          (local.get $l2)
                                          (i32.const 2))
                                        (i32.const 3576)))
                                    (block $B91
                                      (block $B92
                                        (if $I93
                                          (i32.eqz
                                            (i32.and
                                              (local.tee $l4
                                                (i32.load
                                                  (i32.const 3276)))
                                              (local.tee $l6
                                                (i32.shl
                                                  (i32.const 1)
                                                  (local.get $l2)))))
                                          (then
                                            (i32.store
                                              (i32.const 3276)
                                              (i32.or
                                                (local.get $l4)
                                                (local.get $l6)))
                                            (i32.store
                                              (local.get $l1)
                                              (local.get $l5))
                                            (br $B92)))
                                        (local.set $l2
                                          (i32.shl
                                            (local.get $l3)
                                            (select
                                              (i32.sub
                                                (i32.const 25)
                                                (i32.shr_u
                                                  (local.get $l2)
                                                  (i32.const 1)))
                                              (i32.const 0)
                                              (i32.ne
                                                (local.get $l2)
                                                (i32.const 31)))))
                                        (local.set $l4
                                          (i32.load
                                            (local.get $l1)))
                                        (loop $L94
                                          (br_if $B91
                                            (i32.eq
                                              (i32.and
                                                (i32.load offset=4
                                                  (local.tee $l1
                                                    (local.get $l4)))
                                                (i32.const -8))
                                              (local.get $l3)))
                                          (local.set $l4
                                            (i32.shr_u
                                              (local.get $l2)
                                              (i32.const 29)))
                                          (local.set $l2
                                            (i32.shl
                                              (local.get $l2)
                                              (i32.const 1)))
                                          (br_if $L94
                                            (local.tee $l4
                                              (i32.load offset=16
                                                (local.tee $l6
                                                  (i32.add
                                                    (local.get $l1)
                                                    (i32.and
                                                      (local.get $l4)
                                                      (i32.const 4))))))))
                                        (i32.store offset=16
                                          (local.get $l6)
                                          (local.get $l5)))
                                      (i32.store offset=24
                                        (local.get $l5)
                                        (local.get $l1))
                                      (i32.store offset=12
                                        (local.get $l5)
                                        (local.get $l5))
                                      (i32.store offset=8
                                        (local.get $l5)
                                        (local.get $l5))
                                      (br $B12))
                                    (i32.store offset=12
                                      (local.tee $l2
                                        (i32.load offset=8
                                          (local.get $l1)))
                                      (local.get $l5))
                                    (i32.store offset=8
                                      (local.get $l1)
                                      (local.get $l5))
                                    (i32.store offset=24
                                      (local.get $l5)
                                      (i32.const 0))
                                    (i32.store offset=12
                                      (local.get $l5)
                                      (local.get $l1))
                                    (i32.store offset=8
                                      (local.get $l5)
                                      (local.get $l2)))
                                  (br_if $B11
                                    (i32.le_u
                                      (local.tee $l1
                                        (i32.load
                                          (i32.const 3284)))
                                      (local.get $l7)))
                                  (i32.store
                                    (i32.const 3284)
                                    (local.tee $l2
                                      (i32.sub
                                        (local.get $l1)
                                        (local.get $l7))))
                                  (i32.store
                                    (i32.const 3296)
                                    (local.tee $l3
                                      (i32.add
                                        (local.tee $l1
                                          (i32.load
                                            (i32.const 3296)))
                                        (local.get $l7))))
                                  (i32.store offset=4
                                    (local.get $l3)
                                    (i32.or
                                      (local.get $l2)
                                      (i32.const 1)))
                                  (i32.store offset=4
                                    (local.get $l1)
                                    (i32.or
                                      (local.get $l7)
                                      (i32.const 3)))
                                  (local.set $l2
                                    (i32.add
                                      (local.get $l1)
                                      (i32.const 8)))
                                  (br $B3))
                                (i32.store
                                  (i32.const 2016)
                                  (i32.const 48))
                                (local.set $l2
                                  (i32.const 0))
                                (br $B3))
                              (local.set $l3
                                (i32.const 0)))
                            (br_if $B8
                              (i32.eqz
                                (local.get $l9)))
                            (block $B95
                              (if $I96
                                (i32.eq
                                  (i32.load
                                    (local.tee $l4
                                      (i32.add
                                        (i32.shl
                                          (local.tee $l1
                                            (i32.load offset=28
                                              (local.get $l6)))
                                          (i32.const 2))
                                        (i32.const 3576))))
                                  (local.get $l6))
                                (then
                                  (i32.store
                                    (local.get $l4)
                                    (local.get $l3))
                                  (br_if $B95
                                    (local.get $l3))
                                  (i32.store
                                    (i32.const 3276)
                                    (i32.and
                                      (i32.load
                                        (i32.const 3276))
                                      (i32.rotl
                                        (i32.const -2)
                                        (local.get $l1))))
                                  (br $B8)))
                              (i32.store
                                (i32.add
                                  (local.get $l9)
                                  (select
                                    (i32.const 16)
                                    (i32.const 20)
                                    (i32.eq
                                      (i32.load offset=16
                                        (local.get $l9))
                                      (local.get $l6))))
                                (local.get $l3))
                              (br_if $B8
                                (i32.eqz
                                  (local.get $l3))))
                            (i32.store offset=24
                              (local.get $l3)
                              (local.get $l9))
                            (if $I97
                              (local.tee $l1
                                (i32.load offset=16
                                  (local.get $l6)))
                              (then
                                (i32.store offset=16
                                  (local.get $l3)
                                  (local.get $l1))
                                (i32.store offset=24
                                  (local.get $l1)
                                  (local.get $l3))))
                            (br_if $B8
                              (i32.eqz
                                (local.tee $l1
                                  (i32.load offset=20
                                    (local.get $l6)))))
                            (i32.store offset=20
                              (local.get $l3)
                              (local.get $l1))
                            (i32.store offset=24
                              (local.get $l1)
                              (local.get $l3)))
                          (local.set $l2
                            (i32.add
                              (local.get $l2)
                              (local.get $l10)))
                          (local.set $l5
                            (i32.load offset=4
                              (local.tee $l6
                                (i32.add
                                  (local.get $l6)
                                  (local.get $l10))))))
                        (i32.store offset=4
                          (local.get $l6)
                          (i32.and
                            (local.get $l5)
                            (i32.const -2)))
                        (i32.store offset=4
                          (local.get $l7)
                          (i32.or
                            (local.get $l2)
                            (i32.const 1)))
                        (i32.store
                          (i32.add
                            (local.get $l2)
                            (local.get $l7))
                          (local.get $l2))
                        (if $I98
                          (i32.le_u
                            (local.get $l2)
                            (i32.const 255))
                          (then
                            (local.set $l1
                              (i32.add
                                (i32.and
                                  (local.get $l2)
                                  (i32.const -8))
                                (i32.const 3312)))
                            (local.set $l2
                              (block $B99 (result i32)
                                (if $I100
                                  (i32.eqz
                                    (i32.and
                                      (local.tee $l3
                                        (i32.load
                                          (i32.const 3272)))
                                      (local.tee $l2
                                        (i32.shl
                                          (i32.const 1)
                                          (i32.shr_u
                                            (local.get $l2)
                                            (i32.const 3))))))
                                  (then
                                    (i32.store
                                      (i32.const 3272)
                                      (i32.or
                                        (local.get $l2)
                                        (local.get $l3)))
                                    (br $B99
                                      (local.get $l1))))
                                (i32.load offset=8
                                  (local.get $l1))))
                            (i32.store offset=8
                              (local.get $l1)
                              (local.get $l7))
                            (i32.store offset=12
                              (local.get $l2)
                              (local.get $l7))
                            (i32.store offset=12
                              (local.get $l7)
                              (local.get $l1))
                            (i32.store offset=8
                              (local.get $l7)
                              (local.get $l2))
                            (br $B6)))
                        (local.set $l5
                          (i32.const 31))
                        (if $I101
                          (i32.le_u
                            (local.get $l2)
                            (i32.const 16777215))
                          (then
                            (local.set $l5
                              (i32.add
                                (i32.sub
                                  (i32.and
                                    (i32.shr_u
                                      (local.get $l2)
                                      (i32.sub
                                        (i32.const 38)
                                        (local.tee $l1
                                          (i32.clz
                                            (i32.shr_u
                                              (local.get $l2)
                                              (i32.const 8))))))
                                    (i32.const 1))
                                  (i32.shl
                                    (local.get $l1)
                                    (i32.const 1)))
                                (i32.const 62)))))
                        (i32.store offset=28
                          (local.get $l7)
                          (local.get $l5))
                        (i64.store offset=16 align=4
                          (local.get $l7)
                          (i64.const 0))
                        (local.set $l1
                          (i32.add
                            (i32.shl
                              (local.get $l5)
                              (i32.const 2))
                            (i32.const 3576)))
                        (block $B102
                          (block $B103
                            (if $I104
                              (i32.eqz
                                (i32.and
                                  (local.tee $l3
                                    (i32.load
                                      (i32.const 3276)))
                                  (local.tee $l4
                                    (i32.shl
                                      (i32.const 1)
                                      (local.get $l5)))))
                              (then
                                (i32.store
                                  (i32.const 3276)
                                  (i32.or
                                    (local.get $l3)
                                    (local.get $l4)))
                                (i32.store
                                  (local.get $l1)
                                  (local.get $l7))
                                (br $B103)))
                            (local.set $l5
                              (i32.shl
                                (local.get $l2)
                                (select
                                  (i32.sub
                                    (i32.const 25)
                                    (i32.shr_u
                                      (local.get $l5)
                                      (i32.const 1)))
                                  (i32.const 0)
                                  (i32.ne
                                    (local.get $l5)
                                    (i32.const 31)))))
                            (local.set $l3
                              (i32.load
                                (local.get $l1)))
                            (loop $L105
                              (br_if $B102
                                (i32.eq
                                  (i32.and
                                    (i32.load offset=4
                                      (local.tee $l1
                                        (local.get $l3)))
                                    (i32.const -8))
                                  (local.get $l2)))
                              (local.set $l3
                                (i32.shr_u
                                  (local.get $l5)
                                  (i32.const 29)))
                              (local.set $l5
                                (i32.shl
                                  (local.get $l5)
                                  (i32.const 1)))
                              (br_if $L105
                                (local.tee $l3
                                  (i32.load offset=16
                                    (local.tee $l4
                                      (i32.add
                                        (local.get $l1)
                                        (i32.and
                                          (local.get $l3)
                                          (i32.const 4))))))))
                            (i32.store offset=16
                              (local.get $l4)
                              (local.get $l7)))
                          (i32.store offset=24
                            (local.get $l7)
                            (local.get $l1))
                          (i32.store offset=12
                            (local.get $l7)
                            (local.get $l7))
                          (i32.store offset=8
                            (local.get $l7)
                            (local.get $l7))
                          (br $B6))
                        (i32.store offset=12
                          (local.tee $l2
                            (i32.load offset=8
                              (local.get $l1)))
                          (local.get $l7))
                        (i32.store offset=8
                          (local.get $l1)
                          (local.get $l7))
                        (i32.store offset=24
                          (local.get $l7)
                          (i32.const 0))
                        (i32.store offset=12
                          (local.get $l7)
                          (local.get $l1))
                        (i32.store offset=8
                          (local.get $l7)
                          (local.get $l2)))
                      (local.set $l2
                        (i32.add
                          (local.get $l8)
                          (i32.const 8)))
                      (br $B3))
                    (block $B106
                      (br_if $B106
                        (i32.eqz
                          (local.get $l8)))
                      (block $B107
                        (if $I108
                          (i32.eq
                            (i32.load
                              (local.tee $l2
                                (i32.add
                                  (i32.shl
                                    (local.tee $l1
                                      (i32.load offset=28
                                        (local.get $l4)))
                                    (i32.const 2))
                                  (i32.const 3576))))
                            (local.get $l4))
                          (then
                            (i32.store
                              (local.get $l2)
                              (local.get $l3))
                            (br_if $B107
                              (local.get $l3))
                            (i32.store
                              (i32.const 3276)
                              (local.tee $l9
                                (i32.and
                                  (local.get $l9)
                                  (i32.rotl
                                    (i32.const -2)
                                    (local.get $l1)))))
                            (br $B106)))
                        (i32.store
                          (i32.add
                            (local.get $l8)
                            (select
                              (i32.const 16)
                              (i32.const 20)
                              (i32.eq
                                (i32.load offset=16
                                  (local.get $l8))
                                (local.get $l4))))
                          (local.get $l3))
                        (br_if $B106
                          (i32.eqz
                            (local.get $l3))))
                      (i32.store offset=24
                        (local.get $l3)
                        (local.get $l8))
                      (if $I109
                        (local.tee $l1
                          (i32.load offset=16
                            (local.get $l4)))
                        (then
                          (i32.store offset=16
                            (local.get $l3)
                            (local.get $l1))
                          (i32.store offset=24
                            (local.get $l1)
                            (local.get $l3))))
                      (br_if $B106
                        (i32.eqz
                          (local.tee $l1
                            (i32.load offset=20
                              (local.get $l4)))))
                      (i32.store offset=20
                        (local.get $l3)
                        (local.get $l1))
                      (i32.store offset=24
                        (local.get $l1)
                        (local.get $l3)))
                    (block $B110
                      (if $I111
                        (i32.le_u
                          (local.get $l5)
                          (i32.const 15))
                        (then
                          (i32.store offset=4
                            (local.get $l4)
                            (i32.or
                              (local.tee $l1
                                (i32.add
                                  (local.get $l5)
                                  (local.get $l7)))
                              (i32.const 3)))
                          (i32.store offset=4
                            (local.tee $l1
                              (i32.add
                                (local.get $l1)
                                (local.get $l4)))
                            (i32.or
                              (i32.load offset=4
                                (local.get $l1))
                              (i32.const 1)))
                          (br $B110)))
                      (i32.store offset=4
                        (local.get $l4)
                        (i32.or
                          (local.get $l7)
                          (i32.const 3)))
                      (i32.store offset=4
                        (local.tee $l3
                          (i32.add
                            (local.get $l4)
                            (local.get $l7)))
                        (i32.or
                          (local.get $l5)
                          (i32.const 1)))
                      (i32.store
                        (i32.add
                          (local.get $l3)
                          (local.get $l5))
                        (local.get $l5))
                      (if $I112
                        (i32.le_u
                          (local.get $l5)
                          (i32.const 255))
                        (then
                          (local.set $l1
                            (i32.add
                              (i32.and
                                (local.get $l5)
                                (i32.const -8))
                              (i32.const 3312)))
                          (local.set $l2
                            (block $B113 (result i32)
                              (if $I114
                                (i32.eqz
                                  (i32.and
                                    (local.tee $l2
                                      (i32.load
                                        (i32.const 3272)))
                                    (local.tee $l5
                                      (i32.shl
                                        (i32.const 1)
                                        (i32.shr_u
                                          (local.get $l5)
                                          (i32.const 3))))))
                                (then
                                  (i32.store
                                    (i32.const 3272)
                                    (i32.or
                                      (local.get $l2)
                                      (local.get $l5)))
                                  (br $B113
                                    (local.get $l1))))
                              (i32.load offset=8
                                (local.get $l1))))
                          (i32.store offset=8
                            (local.get $l1)
                            (local.get $l3))
                          (i32.store offset=12
                            (local.get $l2)
                            (local.get $l3))
                          (i32.store offset=12
                            (local.get $l3)
                            (local.get $l1))
                          (i32.store offset=8
                            (local.get $l3)
                            (local.get $l2))
                          (br $B110)))
                      (local.set $l2
                        (i32.const 31))
                      (if $I115
                        (i32.le_u
                          (local.get $l5)
                          (i32.const 16777215))
                        (then
                          (local.set $l2
                            (i32.add
                              (i32.sub
                                (i32.and
                                  (i32.shr_u
                                    (local.get $l5)
                                    (i32.sub
                                      (i32.const 38)
                                      (local.tee $l1
                                        (i32.clz
                                          (i32.shr_u
                                            (local.get $l5)
                                            (i32.const 8))))))
                                  (i32.const 1))
                                (i32.shl
                                  (local.get $l1)
                                  (i32.const 1)))
                              (i32.const 62)))))
                      (i32.store offset=28
                        (local.get $l3)
                        (local.get $l2))
                      (i64.store offset=16 align=4
                        (local.get $l3)
                        (i64.const 0))
                      (local.set $l1
                        (i32.add
                          (i32.shl
                            (local.get $l2)
                            (i32.const 2))
                          (i32.const 3576)))
                      (block $B116
                        (block $B117
                          (if $I118
                            (i32.eqz
                              (i32.and
                                (local.get $l9)
                                (local.tee $l6
                                  (i32.shl
                                    (i32.const 1)
                                    (local.get $l2)))))
                            (then
                              (i32.store
                                (i32.const 3276)
                                (i32.or
                                  (local.get $l6)
                                  (local.get $l9)))
                              (i32.store
                                (local.get $l1)
                                (local.get $l3))
                              (br $B117)))
                          (local.set $l2
                            (i32.shl
                              (local.get $l5)
                              (select
                                (i32.sub
                                  (i32.const 25)
                                  (i32.shr_u
                                    (local.get $l2)
                                    (i32.const 1)))
                                (i32.const 0)
                                (i32.ne
                                  (local.get $l2)
                                  (i32.const 31)))))
                          (local.set $l7
                            (i32.load
                              (local.get $l1)))
                          (loop $L119
                            (br_if $B116
                              (i32.eq
                                (i32.and
                                  (i32.load offset=4
                                    (local.tee $l1
                                      (local.get $l7)))
                                  (i32.const -8))
                                (local.get $l5)))
                            (local.set $l6
                              (i32.shr_u
                                (local.get $l2)
                                (i32.const 29)))
                            (local.set $l2
                              (i32.shl
                                (local.get $l2)
                                (i32.const 1)))
                            (br_if $L119
                              (local.tee $l7
                                (i32.load offset=16
                                  (local.tee $l6
                                    (i32.add
                                      (local.get $l1)
                                      (i32.and
                                        (local.get $l6)
                                        (i32.const 4))))))))
                          (i32.store offset=16
                            (local.get $l6)
                            (local.get $l3)))
                        (i32.store offset=24
                          (local.get $l3)
                          (local.get $l1))
                        (i32.store offset=12
                          (local.get $l3)
                          (local.get $l3))
                        (i32.store offset=8
                          (local.get $l3)
                          (local.get $l3))
                        (br $B110))
                      (i32.store offset=12
                        (local.tee $l2
                          (i32.load offset=8
                            (local.get $l1)))
                        (local.get $l3))
                      (i32.store offset=8
                        (local.get $l1)
                        (local.get $l3))
                      (i32.store offset=24
                        (local.get $l3)
                        (i32.const 0))
                      (i32.store offset=12
                        (local.get $l3)
                        (local.get $l1))
                      (i32.store offset=8
                        (local.get $l3)
                        (local.get $l2)))
                    (local.set $l2
                      (i32.add
                        (local.get $l4)
                        (i32.const 8)))
                    (br $B3))
                  (block $B120
                    (br_if $B120
                      (i32.eqz
                        (local.get $l10)))
                    (block $B121
                      (if $I122
                        (i32.eq
                          (i32.load
                            (local.tee $l2
                              (i32.add
                                (i32.shl
                                  (local.tee $l1
                                    (i32.load offset=28
                                      (local.get $l3)))
                                  (i32.const 2))
                                (i32.const 3576))))
                          (local.get $l3))
                        (then
                          (i32.store
                            (local.get $l2)
                            (local.get $l4))
                          (br_if $B121
                            (local.get $l4))
                          (i32.store
                            (i32.const 3276)
                            (i32.and
                              (local.get $l14)
                              (i32.rotl
                                (i32.const -2)
                                (local.get $l1))))
                          (br $B120)))
                      (i32.store
                        (i32.add
                          (local.get $l10)
                          (select
                            (i32.const 16)
                            (i32.const 20)
                            (i32.eq
                              (i32.load offset=16
                                (local.get $l10))
                              (local.get $l3))))
                        (local.get $l4))
                      (br_if $B120
                        (i32.eqz
                          (local.get $l4))))
                    (i32.store offset=24
                      (local.get $l4)
                      (local.get $l10))
                    (if $I123
                      (local.tee $l1
                        (i32.load offset=16
                          (local.get $l3)))
                      (then
                        (i32.store offset=16
                          (local.get $l4)
                          (local.get $l1))
                        (i32.store offset=24
                          (local.get $l1)
                          (local.get $l4))))
                    (br_if $B120
                      (i32.eqz
                        (local.tee $l1
                          (i32.load offset=20
                            (local.get $l3)))))
                    (i32.store offset=20
                      (local.get $l4)
                      (local.get $l1))
                    (i32.store offset=24
                      (local.get $l1)
                      (local.get $l4)))
                  (block $B124
                    (if $I125
                      (i32.le_u
                        (local.get $l5)
                        (i32.const 15))
                      (then
                        (i32.store offset=4
                          (local.get $l3)
                          (i32.or
                            (local.tee $l1
                              (i32.add
                                (local.get $l5)
                                (local.get $l7)))
                            (i32.const 3)))
                        (i32.store offset=4
                          (local.tee $l1
                            (i32.add
                              (local.get $l1)
                              (local.get $l3)))
                          (i32.or
                            (i32.load offset=4
                              (local.get $l1))
                            (i32.const 1)))
                        (br $B124)))
                    (i32.store offset=4
                      (local.get $l3)
                      (i32.or
                        (local.get $l7)
                        (i32.const 3)))
                    (i32.store offset=4
                      (local.tee $l4
                        (i32.add
                          (local.get $l3)
                          (local.get $l7)))
                      (i32.or
                        (local.get $l5)
                        (i32.const 1)))
                    (i32.store
                      (i32.add
                        (local.get $l4)
                        (local.get $l5))
                      (local.get $l5))
                    (if $I126
                      (local.get $l8)
                      (then
                        (local.set $l1
                          (i32.add
                            (i32.and
                              (local.get $l8)
                              (i32.const -8))
                            (i32.const 3312)))
                        (local.set $l2
                          (i32.load
                            (i32.const 3292)))
                        (local.set $l6
                          (block $B127 (result i32)
                            (if $I128
                              (i32.eqz
                                (i32.and
                                  (local.tee $l7
                                    (i32.shl
                                      (i32.const 1)
                                      (i32.shr_u
                                        (local.get $l8)
                                        (i32.const 3))))
                                  (local.get $l6)))
                              (then
                                (i32.store
                                  (i32.const 3272)
                                  (i32.or
                                    (local.get $l6)
                                    (local.get $l7)))
                                (br $B127
                                  (local.get $l1))))
                            (i32.load offset=8
                              (local.get $l1))))
                        (i32.store offset=8
                          (local.get $l1)
                          (local.get $l2))
                        (i32.store offset=12
                          (local.get $l6)
                          (local.get $l2))
                        (i32.store offset=12
                          (local.get $l2)
                          (local.get $l1))
                        (i32.store offset=8
                          (local.get $l2)
                          (local.get $l6))))
                    (i32.store
                      (i32.const 3292)
                      (local.get $l4))
                    (i32.store
                      (i32.const 3280)
                      (local.get $l5)))
                  (local.set $l2
                    (i32.add
                      (local.get $l3)
                      (i32.const 8))))
                (global.set $g0
                  (i32.add
                    (local.get $l13)
                    (i32.const 16)))
                (drop
                  (br_if $B1
                    (i32.const 0)
                    (i32.eqz
                      (local.tee $l1
                        (local.get $l2)))))
                (local.set $l2
                  (i32.sub
                    (local.get $l1)
                    (i32.const 8)))
                (block $B129
                  (if $I130
                    (i32.eqz
                      (i32.and
                        (local.get $l1)
                        (i32.const 4095)))
                    (then
                      (local.set $l1
                        (local.get $l2))
                      (br $B129)))
                  (local.set $l4
                    (i32.sub
                      (i32.and
                        (local.tee $l6
                          (i32.load
                            (local.tee $l5
                              (i32.sub
                                (local.get $l1)
                                (i32.const 4)))))
                        (i32.const -8))
                      (local.tee $l3
                        (i32.sub
                          (local.tee $l1
                            (i32.add
                              (local.tee $l1
                                (i32.sub
                                  (i32.and
                                    (i32.add
                                      (local.get $l1)
                                      (i32.const 4095))
                                    (i32.const -4096))
                                  (i32.const 8)))
                              (select
                                (i32.const 4096)
                                (i32.const 0)
                                (i32.le_u
                                  (i32.sub
                                    (local.get $l1)
                                    (local.get $l2))
                                  (i32.const 15)))))
                          (local.get $l2)))))
                  (if $I131
                    (i32.eqz
                      (i32.and
                        (local.get $l6)
                        (i32.const 3)))
                    (then
                      (local.set $l2
                        (i32.load
                          (local.get $l2)))
                      (i32.store offset=4
                        (local.get $l1)
                        (local.get $l4))
                      (i32.store
                        (local.get $l1)
                        (i32.add
                          (local.get $l2)
                          (local.get $l3)))
                      (br $B129)))
                  (i32.store offset=4
                    (local.get $l1)
                    (i32.or
                      (i32.or
                        (local.get $l4)
                        (i32.and
                          (i32.load offset=4
                            (local.get $l1))
                          (i32.const 1)))
                      (i32.const 2)))
                  (i32.store offset=4
                    (local.tee $l4
                      (i32.add
                        (local.get $l1)
                        (local.get $l4)))
                    (i32.or
                      (i32.load offset=4
                        (local.get $l4))
                      (i32.const 1)))
                  (i32.store
                    (local.get $l5)
                    (i32.or
                      (i32.or
                        (local.get $l3)
                        (i32.and
                          (i32.load
                            (local.get $l5))
                          (i32.const 1)))
                      (i32.const 2)))
                  (i32.store offset=4
                    (local.tee $l4
                      (i32.add
                        (local.get $l2)
                        (local.get $l3)))
                    (i32.or
                      (i32.load offset=4
                        (local.get $l4))
                      (i32.const 1)))
                  (call $f35
                    (local.get $l2)
                    (local.get $l3)))
                (block $B132
                  (br_if $B132
                    (i32.eqz
                      (i32.and
                        (local.tee $l2
                          (i32.load offset=4
                            (local.get $l1)))
                        (i32.const 3))))
                  (br_if $B132
                    (i32.le_u
                      (local.tee $l3
                        (i32.and
                          (local.get $l2)
                          (i32.const -8)))
                      (i32.add
                        (local.get $l12)
                        (i32.const 16))))
                  (i32.store offset=4
                    (local.get $l1)
                    (i32.or
                      (i32.or
                        (local.get $l12)
                        (i32.and
                          (local.get $l2)
                          (i32.const 1)))
                      (i32.const 2)))
                  (i32.store offset=4
                    (local.tee $l2
                      (i32.add
                        (local.get $l1)
                        (local.get $l12)))
                    (i32.or
                      (local.tee $l4
                        (i32.sub
                          (local.get $l3)
                          (local.get $l12)))
                      (i32.const 3)))
                  (i32.store offset=4
                    (local.tee $l3
                      (i32.add
                        (local.get $l1)
                        (local.get $l3)))
                    (i32.or
                      (i32.load offset=4
                        (local.get $l3))
                      (i32.const 1)))
                  (call $f35
                    (local.get $l2)
                    (local.get $l4)))
                (i32.add
                  (local.get $l1)
                  (i32.const 8))))
            (then
              (i32.store offset=12
                (local.get $l11)
                (local.get $l1))
              (i32.const 0))
            (else
              (i32.const 48))))))
    (if $I134
      (i32.eqz
        (select
          (i32.const 0)
          (local.tee $l2
            (i32.load offset=12
              (local.get $l11)))
          (local.get $l1)))
      (then
        (call $f17
          (i32.const 1024)
          (i32.const 50)
          (i32.load
            (i32.const 1220)))
        (call $f9
          (i32.const 1))
        (unreachable)))
    (global.set $g0
      (i32.add
        (local.get $l11)
        (i32.const 16)))
    (local.get $l2))
  (func $_start (export "_start") (type $t6)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32) (local $l14 i32)
    (i32.store
      (i32.const 2184)
      (i32.const 2064))
    (i32.store
      (i32.const 2112)
      (i32.const 42))
    (call $f9
      (block $B0 (result i32)
        (global.set $g0
          (local.tee $l5
            (i32.sub
              (global.get $g0)
              (i32.const 16))))
        (block $B1
          (if $I2
            (i32.eqz
              (call $wasi_snapshot_preview1.args_sizes_get
                (i32.add
                  (local.get $l5)
                  (i32.const 12))
                (i32.add
                  (local.get $l5)
                  (i32.const 8))))
            (then
              (local.set $l14
                (if $I3 (result i32)
                  (local.tee $l0
                    (i32.load offset=12
                      (local.get $l5)))
                  (then
                    (global.set $g0
                      (local.tee $l7
                        (i32.sub
                          (local.get $l5)
                          (i32.and
                            (i32.add
                              (local.tee $l2
                                (i32.shl
                                  (local.get $l0)
                                  (i32.const 2)))
                              (i32.const 19))
                            (i32.const -16)))))
                    (global.set $g0
                      (local.tee $l0
                        (i32.sub
                          (local.get $l7)
                          (i32.and
                            (i32.add
                              (i32.load offset=8
                                (local.get $l5))
                              (i32.const 15))
                            (i32.const -16)))))
                    (i32.store
                      (i32.add
                        (local.get $l2)
                        (local.get $l7))
                      (i32.const 0))
                    (br_if $B1
                      (call $wasi_snapshot_preview1.args_get
                        (local.get $l7)
                        (local.get $l0)))
                    (i32.load offset=12
                      (local.get $l5)))
                  (else
                    (i32.const 0))))
              (global.set $g0
                (local.tee $l6
                  (i32.sub
                    (global.get $g0)
                    (i32.const 48))))
              (local.set $l9
                (call $f7
                  (i64.const 1100000)))
              (local.set $l11
                (call $f7
                  (i64.const 1200000)))
              (local.set $l12
                (call $f7
                  (i64.const 1320000)))
              (loop $L4
                (local.set $l2
                  (i32.const 0))
                (loop $L5
                  (f64.store
                    (i32.add
                      (local.tee $l4
                        (i32.add
                          (local.get $l9)
                          (i32.mul
                            (local.get $l1)
                            (i32.const 8800))))
                      (i32.shl
                        (local.get $l2)
                        (i32.const 3)))
                    (f64.div
                      (f64.convert_i32_s
                        (i32.rem_u
                          (i32.or
                            (i32.mul
                              (local.get $l1)
                              (local.get $l2))
                            (i32.const 1))
                          (i32.const 1000)))
                      (f64.const 0x1.f4p+9 (;=1000;))))
                  (f64.store
                    (i32.add
                      (local.get $l4)
                      (i32.shl
                        (local.tee $l0
                          (i32.or
                            (local.get $l2)
                            (i32.const 1)))
                        (i32.const 3)))
                    (f64.div
                      (f64.convert_i32_s
                        (i32.rem_u
                          (i32.add
                            (i32.mul
                              (local.get $l0)
                              (local.get $l1))
                            (i32.const 1))
                          (i32.const 1000)))
                      (f64.const 0x1.f4p+9 (;=1000;))))
                  (br_if $L5
                    (i32.ne
                      (local.tee $l2
                        (i32.add
                          (local.get $l2)
                          (i32.const 2)))
                      (i32.const 1100))))
                (br_if $L4
                  (i32.ne
                    (local.tee $l1
                      (i32.add
                        (local.get $l1)
                        (i32.const 1)))
                    (i32.const 1000))))
              (local.set $l1
                (i32.const 0))
              (loop $L6
                (local.set $l2
                  (i32.const 0))
                (loop $L7
                  (f64.store
                    (i32.add
                      (local.tee $l4
                        (i32.add
                          (local.get $l11)
                          (i32.mul
                            (local.get $l1)
                            (i32.const 9600))))
                      (i32.shl
                        (local.get $l2)
                        (i32.const 3)))
                    (f64.div
                      (f64.convert_i32_s
                        (i32.rem_u
                          (i32.mul
                            (local.tee $l0
                              (i32.or
                                (local.get $l2)
                                (i32.const 1)))
                            (local.get $l1))
                          (i32.const 1200)))
                      (f64.const 0x1.2cp+10 (;=1200;))))
                  (f64.store
                    (i32.add
                      (local.get $l4)
                      (i32.shl
                        (local.get $l0)
                        (i32.const 3)))
                    (f64.div
                      (f64.convert_i32_s
                        (i32.rem_u
                          (i32.mul
                            (local.tee $l2
                              (i32.add
                                (local.get $l2)
                                (i32.const 2)))
                            (local.get $l1))
                          (i32.const 1200)))
                      (f64.const 0x1.2cp+10 (;=1200;))))
                  (br_if $L7
                    (i32.ne
                      (local.get $l2)
                      (i32.const 1200))))
                (br_if $L6
                  (i32.ne
                    (local.tee $l1
                      (i32.add
                        (local.get $l1)
                        (i32.const 1)))
                    (i32.const 1000))))
              (local.set $l1
                (i32.const 0))
              (loop $L8
                (local.set $l2
                  (i32.const 0))
                (loop $L9
                  (f64.store
                    (i32.add
                      (local.tee $l3
                        (i32.add
                          (local.get $l12)
                          (i32.mul
                            (local.get $l1)
                            (i32.const 8800))))
                      (local.tee $l4
                        (i32.shl
                          (local.get $l2)
                          (i32.const 3))))
                    (f64.div
                      (f64.convert_i32_s
                        (i32.rem_u
                          (i32.mul
                            (local.tee $l0
                              (i32.add
                                (local.get $l2)
                                (i32.const 2)))
                            (local.get $l1))
                          (i32.const 1100)))
                      (f64.const 0x1.13p+10 (;=1100;))))
                  (f64.store
                    (i32.add
                      (local.get $l3)
                      (i32.or
                        (local.get $l4)
                        (i32.const 8)))
                    (f64.div
                      (f64.convert_i32_s
                        (i32.rem_u
                          (i32.mul
                            (i32.add
                              (local.get $l2)
                              (i32.const 3))
                            (local.get $l1))
                          (i32.const 1100)))
                      (f64.const 0x1.13p+10 (;=1100;))))
                  (br_if $L9
                    (i32.ne
                      (local.tee $l2
                        (local.get $l0))
                      (i32.const 1100))))
                (br_if $L8
                  (i32.ne
                    (local.tee $l1
                      (i32.add
                        (local.get $l1)
                        (i32.const 1)))
                    (i32.const 1200))))
              (loop $L10
                (local.set $l10
                  (i32.const 0))
                (local.set $l1
                  (i32.const 0))
                (loop $L11
                  (f64.store
                    (local.tee $l0
                      (i32.add
                        (local.tee $l13
                          (i32.add
                            (local.get $l9)
                            (i32.mul
                              (local.get $l8)
                              (i32.const 8800))))
                        (i32.shl
                          (local.get $l1)
                          (i32.const 3))))
                    (f64.mul
                      (f64.load
                        (local.get $l0))
                      (f64.const 0x1.3333333333333p+0 (;=1.2;))))
                  (f64.store offset=8
                    (local.get $l0)
                    (f64.mul
                      (f64.load offset=8
                        (local.get $l0))
                      (f64.const 0x1.3333333333333p+0 (;=1.2;))))
                  (f64.store offset=16
                    (local.get $l0)
                    (f64.mul
                      (f64.load offset=16
                        (local.get $l0))
                      (f64.const 0x1.3333333333333p+0 (;=1.2;))))
                  (f64.store offset=24
                    (local.get $l0)
                    (f64.mul
                      (f64.load offset=24
                        (local.get $l0))
                      (f64.const 0x1.3333333333333p+0 (;=1.2;))))
                  (f64.store offset=32
                    (local.get $l0)
                    (f64.mul
                      (f64.load offset=32
                        (local.get $l0))
                      (f64.const 0x1.3333333333333p+0 (;=1.2;))))
                  (br_if $L11
                    (i32.ne
                      (local.tee $l1
                        (i32.add
                          (local.get $l1)
                          (i32.const 5)))
                      (i32.const 1100))))
                (loop $L12
                  (local.set $l1
                    (i32.add
                      (i32.add
                        (local.get $l11)
                        (i32.mul
                          (local.get $l8)
                          (i32.const 9600)))
                      (i32.shl
                        (local.get $l10)
                        (i32.const 3))))
                  (local.set $l2
                    (i32.const 0))
                  (loop $L13
                    (f64.store
                      (local.tee $l0
                        (i32.add
                          (local.get $l13)
                          (local.tee $l4
                            (i32.shl
                              (local.get $l2)
                              (i32.const 3)))))
                      (f64.add
                        (f64.mul
                          (f64.mul
                            (f64.load
                              (local.get $l1))
                            (f64.const 0x1.8p+0 (;=1.5;)))
                          (f64.load
                            (i32.add
                              (local.tee $l3
                                (i32.add
                                  (local.get $l12)
                                  (i32.mul
                                    (local.get $l10)
                                    (i32.const 8800))))
                              (local.get $l4))))
                        (f64.load
                          (local.get $l0))))
                    (f64.store
                      (local.tee $l0
                        (i32.add
                          (local.get $l13)
                          (local.tee $l4
                            (i32.or
                              (local.get $l4)
                              (i32.const 8)))))
                      (f64.add
                        (f64.mul
                          (f64.mul
                            (f64.load
                              (local.get $l1))
                            (f64.const 0x1.8p+0 (;=1.5;)))
                          (f64.load
                            (i32.add
                              (local.get $l3)
                              (local.get $l4))))
                        (f64.load
                          (local.get $l0))))
                    (br_if $L13
                      (i32.ne
                        (local.tee $l2
                          (i32.add
                            (local.get $l2)
                            (i32.const 2)))
                        (i32.const 1100))))
                  (br_if $L12
                    (i32.ne
                      (local.tee $l10
                        (i32.add
                          (local.get $l10)
                          (i32.const 1)))
                      (i32.const 1200))))
                (br_if $L10
                  (i32.ne
                    (local.tee $l8
                      (i32.add
                        (local.get $l8)
                        (i32.const 1)))
                    (i32.const 1000))))
              (block $B14
                (br_if $B14
                  (i32.lt_s
                    (local.get $l14)
                    (i32.const 43)))
                (br_if $B14
                  (i32.load8_u
                    (i32.load
                      (local.get $l7))))
                (local.set $l1
                  (i32.const 0))
                (call $f17
                  (i32.const 1171)
                  (i32.const 22)
                  (local.tee $l3
                    (i32.load
                      (i32.const 1220))))
                (i32.store offset=32
                  (local.get $l6)
                  (i32.const 1135))
                (call $f12
                  (local.get $l3)
                  (i32.const 1104)
                  (i32.add
                    (local.get $l6)
                    (i32.const 32)))
                (loop $L15
                  (local.set $l7
                    (i32.mul
                      (local.get $l1)
                      (i32.const 1000)))
                  (local.set $l2
                    (i32.const 0))
                  (loop $L16
                    (if $I17
                      (i32.eqz
                        (i32.rem_u
                          (i32.add
                            (local.get $l2)
                            (local.get $l7))
                          (i32.const 20)))
                      (then
                        (block $B18
                          (block $B19
                            (if $I20
                              (i32.ge_s
                                (local.tee $l0
                                  (i32.load offset=76
                                    (local.get $l3)))
                                (i32.const 0))
                              (then
                                (br_if $B19
                                  (i32.eqz
                                    (local.get $l0)))
                                (br_if $B19
                                  (i32.ne
                                    (i32.load
                                      (i32.const 2112))
                                    (i32.and
                                      (local.get $l0)
                                      (i32.const -1073741825))))))
                            (block $B21
                              (br_if $B21
                                (i32.eq
                                  (i32.load offset=80
                                    (local.get $l3))
                                  (i32.const 10)))
                              (br_if $B21
                                (i32.eq
                                  (local.tee $l0
                                    (i32.load offset=20
                                      (local.get $l3)))
                                  (i32.load offset=16
                                    (local.get $l3))))
                              (i32.store offset=20
                                (local.get $l3)
                                (i32.add
                                  (local.get $l0)
                                  (i32.const 1)))
                              (i32.store8
                                (local.get $l0)
                                (i32.const 10))
                              (br $B18))
                            (call $f15
                              (local.get $l3))
                            (br $B18))
                          (i32.store offset=76
                            (local.get $l3)
                            (select
                              (local.tee $l0
                                (i32.load offset=76
                                  (local.get $l3)))
                              (i32.const 1073741823)
                              (local.get $l0)))
                          (block $B22
                            (block $B23
                              (br_if $B23
                                (i32.eq
                                  (i32.load offset=80
                                    (local.get $l3))
                                  (i32.const 10)))
                              (br_if $B23
                                (i32.eq
                                  (local.tee $l0
                                    (i32.load offset=20
                                      (local.get $l3)))
                                  (i32.load offset=16
                                    (local.get $l3))))
                              (i32.store offset=20
                                (local.get $l3)
                                (i32.add
                                  (local.get $l0)
                                  (i32.const 1)))
                              (i32.store8
                                (local.get $l0)
                                (i32.const 10))
                              (br $B22))
                            (call $f15
                              (local.get $l3)))
                          (drop
                            (i32.load offset=76
                              (local.get $l3)))
                          (i32.store offset=76
                            (local.get $l3)
                            (i32.const 0)))))
                    (f64.store offset=16
                      (local.get $l6)
                      (f64.load
                        (i32.add
                          (i32.add
                            (local.get $l9)
                            (i32.mul
                              (local.get $l1)
                              (i32.const 8800)))
                          (i32.shl
                            (local.get $l2)
                            (i32.const 3)))))
                    (global.set $g0
                      (local.tee $l4
                        (i32.sub
                          (global.get $g0)
                          (i32.const 16))))
                    (i32.store offset=12
                      (local.get $l4)
                      (local.tee $l0
                        (i32.add
                          (local.get $l6)
                          (i32.const 16))))
                    (call $f24
                      (local.get $l3)
                      (i32.const 1146)
                      (local.get $l0)
                      (i32.const 7))
                    (global.set $g0
                      (i32.add
                        (local.get $l4)
                        (i32.const 16)))
                    (br_if $L16
                      (i32.ne
                        (local.tee $l2
                          (i32.add
                            (local.get $l2)
                            (i32.const 1)))
                        (i32.const 1100))))
                  (br_if $L15
                    (i32.ne
                      (local.tee $l1
                        (i32.add
                          (local.get $l1)
                          (i32.const 1)))
                      (i32.const 1000))))
                (i32.store
                  (local.get $l6)
                  (i32.const 1135))
                (call $f12
                  (local.get $l3)
                  (i32.const 1154)
                  (local.get $l6))
                (call $f17
                  (i32.const 1194)
                  (i32.const 22)
                  (local.get $l3)))
              (call $f34
                (local.get $l9))
              (call $f34
                (local.get $l11))
              (call $f34
                (local.get $l12))
              (global.set $g0
                (i32.add
                  (local.get $l6)
                  (i32.const 48)))
              (global.set $g0
                (i32.add
                  (local.get $l5)
                  (i32.const 16)))
              (br $B0
                (i32.const 0))))
          (call $wasi_snapshot_preview1.proc_exit
            (i32.const 71))
          (unreachable))
        (call $wasi_snapshot_preview1.proc_exit
          (i32.const 71))
        (unreachable)))
    (unreachable))
  (func $f9 (type $t2) (param $p0 i32)
    (local $l1 i32)
    (if $I0
      (local.tee $l1
        (i32.load
          (i32.const 2028)))
      (then
        (loop $L1
          (call $f13
            (local.get $l1))
          (br_if $L1
            (local.tee $l1
              (i32.load offset=56
                (local.get $l1)))))))
    (call $f13
      (i32.load
        (i32.const 2020)))
    (call $f13
      (i32.load
        (i32.const 2008)))
    (call $f13
      (i32.load
        (i32.const 1856)))
    (call $wasi_snapshot_preview1.proc_exit
      (local.get $p0))
    (unreachable))
  (func $f10 (type $t0) (param $p0 i32) (result i32)
    (i32.const 0))
  (func $__errno_location (export "__errno_location") (type $t7) (result i32)
    (i32.const 2016))
  (func $f12 (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32)
    (global.set $g0
      (local.tee $l3
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get $l3)
      (local.get $p2))
    (call $f24
      (local.get $p0)
      (local.get $p1)
      (local.get $p2)
      (i32.const 0))
    (global.set $g0
      (i32.add
        (local.get $l3)
        (i32.const 16))))
  (func $f13 (type $t2) (param $p0 i32)
    (local $l1 i32) (local $l2 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.get $p0)))
      (drop
        (i32.load offset=76
          (local.get $p0)))
      (if $I1
        (i32.ne
          (i32.load offset=20
            (local.get $p0))
          (i32.load offset=28
            (local.get $p0)))
        (then
          (drop
            (call_indirect $__indirect_function_table (type $t1)
              (local.get $p0)
              (i32.const 0)
              (i32.const 0)
              (i32.load offset=36
                (local.get $p0))))))
      (br_if $B0
        (i32.eq
          (local.tee $l1
            (i32.load offset=4
              (local.get $p0)))
          (local.tee $l2
            (i32.load offset=8
              (local.get $p0)))))
      (drop
        (call_indirect $__indirect_function_table (type $t5)
          (local.get $p0)
          (i64.extend_i32_s
            (i32.sub
              (local.get $l1)
              (local.get $l2)))
          (i32.const 1)
          (i32.load offset=40
            (local.get $p0))))))
  (func $f14 (type $t0) (param $p0 i32) (result i32)
    (local $l1 i32)
    (i32.store offset=72
      (local.get $p0)
      (i32.or
        (i32.sub
          (local.tee $l1
            (i32.load offset=72
              (local.get $p0)))
          (i32.const 1))
        (local.get $l1)))
    (if $I0
      (i32.and
        (local.tee $l1
          (i32.load
            (local.get $p0)))
        (i32.const 8))
      (then
        (i32.store
          (local.get $p0)
          (i32.or
            (local.get $l1)
            (i32.const 32)))
        (return
          (i32.const -1))))
    (i64.store offset=4 align=4
      (local.get $p0)
      (i64.const 0))
    (i32.store offset=28
      (local.get $p0)
      (local.tee $l1
        (i32.load offset=44
          (local.get $p0))))
    (i32.store offset=20
      (local.get $p0)
      (local.get $l1))
    (i32.store offset=16
      (local.get $p0)
      (i32.add
        (local.get $l1)
        (i32.load offset=48
          (local.get $p0))))
    (i32.const 0))
  (func $f15 (type $t2) (param $p0 i32)
    (local $l1 i32) (local $l2 i32)
    (global.set $g0
      (local.tee $l1
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (i32.store8 offset=15
      (local.get $l1)
      (i32.const 10))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.eq
            (if $I2 (result i32)
              (local.tee $l2
                (i32.load offset=16
                  (local.get $p0)))
              (then
                (local.get $l2))
              (else
                (br_if $B0
                  (call $f14
                    (local.get $p0)))
                (i32.load offset=16
                  (local.get $p0))))
            (local.tee $l2
              (i32.load offset=20
                (local.get $p0)))))
        (br_if $B1
          (i32.eq
            (i32.load offset=80
              (local.get $p0))
            (i32.const 10)))
        (i32.store offset=20
          (local.get $p0)
          (i32.add
            (local.get $l2)
            (i32.const 1)))
        (i32.store8
          (local.get $l2)
          (i32.const 10))
        (br $B0))
      (br_if $B0
        (i32.ne
          (call_indirect $__indirect_function_table (type $t1)
            (local.get $p0)
            (i32.add
              (local.get $l1)
              (i32.const 15))
            (i32.const 1)
            (i32.load offset=36
              (local.get $p0)))
          (i32.const 1)))
      (drop
        (i32.load8_u offset=15
          (local.get $l1))))
    (global.set $g0
      (i32.add
        (local.get $l1)
        (i32.const 16))))
  (func $f16 (type $t1) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (block $B0
      (if $I2
        (i32.gt_u
          (local.get $p1)
          (i32.sub
            (if $I1 (result i32)
              (local.tee $l4
                (i32.load offset=16
                  (local.get $p2)))
              (then
                (local.get $l4))
              (else
                (br_if $B0
                  (call $f14
                    (local.get $p2)))
                (i32.load offset=16
                  (local.get $p2))))
            (local.tee $l5
              (i32.load offset=20
                (local.get $p2)))))
        (then
          (return
            (call_indirect $__indirect_function_table (type $t1)
              (local.get $p2)
              (local.get $p0)
              (local.get $p1)
              (i32.load offset=36
                (local.get $p2))))))
      (block $B3
        (if $I4
          (i32.lt_s
            (i32.load offset=80
              (local.get $p2))
            (i32.const 0))
          (then
            (local.set $l4
              (i32.const 0))
            (br $B3)))
        (local.set $l3
          (local.get $p1))
        (loop $L5
          (if $I6
            (i32.eqz
              (local.tee $l4
                (local.get $l3)))
            (then
              (local.set $l4
                (i32.const 0))
              (br $B3)))
          (br_if $L5
            (i32.ne
              (i32.load8_u
                (i32.add
                  (local.get $p0)
                  (local.tee $l3
                    (i32.sub
                      (local.get $l4)
                      (i32.const 1)))))
              (i32.const 10))))
        (br_if $B0
          (i32.lt_u
            (local.tee $l3
              (call_indirect $__indirect_function_table (type $t1)
                (local.get $p2)
                (local.get $p0)
                (local.get $l4)
                (i32.load offset=36
                  (local.get $p2))))
            (local.get $l4)))
        (local.set $p0
          (i32.add
            (local.get $p0)
            (local.get $l4)))
        (local.set $p1
          (i32.sub
            (local.get $p1)
            (local.get $l4)))
        (local.set $l5
          (i32.load offset=20
            (local.get $p2))))
      (local.set $l5
        (i32.add
          (local.get $p1)
          (local.tee $l3
            (local.get $l5))))
      (block $B7
        (block $B8
          (if $I9
            (i32.eqz
              (i32.and
                (i32.xor
                  (local.get $p0)
                  (local.get $l3))
                (i32.const 3)))
            (then
              (br_if $B8
                (i32.eqz
                  (i32.and
                    (local.get $l3)
                    (i32.const 3))))
              (br_if $B8
                (i32.le_s
                  (local.get $p1)
                  (i32.const 0)))
              (loop $L10
                (i32.store8
                  (local.get $l3)
                  (i32.load8_u
                    (local.get $p0)))
                (local.set $p0
                  (i32.add
                    (local.get $p0)
                    (i32.const 1)))
                (br_if $B8
                  (i32.eqz
                    (i32.and
                      (local.tee $l3
                        (i32.add
                          (local.get $l3)
                          (i32.const 1)))
                      (i32.const 3))))
                (br_if $L10
                  (i32.lt_u
                    (local.get $l3)
                    (local.get $l5))))
              (br $B8)))
          (block $B11
            (br_if $B11
              (i32.lt_u
                (local.get $l5)
                (i32.const 4)))
            (br_if $B11
              (i32.lt_u
                (local.tee $l6
                  (i32.sub
                    (local.get $l5)
                    (i32.const 4)))
                (local.get $l3)))
            (loop $L12
              (i32.store8
                (local.get $l3)
                (i32.load8_u
                  (local.get $p0)))
              (i32.store8 offset=1
                (local.get $l3)
                (i32.load8_u offset=1
                  (local.get $p0)))
              (i32.store8 offset=2
                (local.get $l3)
                (i32.load8_u offset=2
                  (local.get $p0)))
              (i32.store8 offset=3
                (local.get $l3)
                (i32.load8_u offset=3
                  (local.get $p0)))
              (local.set $p0
                (i32.add
                  (local.get $p0)
                  (i32.const 4)))
              (br_if $L12
                (i32.le_u
                  (local.tee $l3
                    (i32.add
                      (local.get $l3)
                      (i32.const 4)))
                  (local.get $l6))))
            (br $B7))
          (br $B7))
        (block $B13
          (br_if $B13
            (i32.lt_u
              (local.tee $l6
                (i32.and
                  (local.get $l5)
                  (i32.const -4)))
              (i32.const 64)))
          (br_if $B13
            (i32.gt_u
              (local.get $l3)
              (local.tee $l7
                (i32.add
                  (local.get $l6)
                  (i32.const -64)))))
          (loop $L14
            (i32.store
              (local.get $l3)
              (i32.load
                (local.get $p0)))
            (i32.store offset=4
              (local.get $l3)
              (i32.load offset=4
                (local.get $p0)))
            (i32.store offset=8
              (local.get $l3)
              (i32.load offset=8
                (local.get $p0)))
            (i32.store offset=12
              (local.get $l3)
              (i32.load offset=12
                (local.get $p0)))
            (i32.store offset=16
              (local.get $l3)
              (i32.load offset=16
                (local.get $p0)))
            (i32.store offset=20
              (local.get $l3)
              (i32.load offset=20
                (local.get $p0)))
            (i32.store offset=24
              (local.get $l3)
              (i32.load offset=24
                (local.get $p0)))
            (i32.store offset=28
              (local.get $l3)
              (i32.load offset=28
                (local.get $p0)))
            (i32.store offset=32
              (local.get $l3)
              (i32.load offset=32
                (local.get $p0)))
            (i32.store offset=36
              (local.get $l3)
              (i32.load offset=36
                (local.get $p0)))
            (i32.store offset=40
              (local.get $l3)
              (i32.load offset=40
                (local.get $p0)))
            (i32.store offset=44
              (local.get $l3)
              (i32.load offset=44
                (local.get $p0)))
            (i32.store offset=48
              (local.get $l3)
              (i32.load offset=48
                (local.get $p0)))
            (i32.store offset=52
              (local.get $l3)
              (i32.load offset=52
                (local.get $p0)))
            (i32.store offset=56
              (local.get $l3)
              (i32.load offset=56
                (local.get $p0)))
            (i32.store offset=60
              (local.get $l3)
              (i32.load offset=60
                (local.get $p0)))
            (local.set $p0
              (i32.sub
                (local.get $p0)
                (i32.const -64)))
            (br_if $L14
              (i32.le_u
                (local.tee $l3
                  (i32.sub
                    (local.get $l3)
                    (i32.const -64)))
                (local.get $l7)))))
        (br_if $B7
          (i32.ge_u
            (local.get $l3)
            (local.get $l6)))
        (loop $L15
          (i32.store
            (local.get $l3)
            (i32.load
              (local.get $p0)))
          (local.set $p0
            (i32.add
              (local.get $p0)
              (i32.const 4)))
          (br_if $L15
            (i32.lt_u
              (local.tee $l3
                (i32.add
                  (local.get $l3)
                  (i32.const 4)))
              (local.get $l6)))))
      (if $I16
        (i32.lt_u
          (local.get $l3)
          (local.get $l5))
        (then
          (loop $L17
            (i32.store8
              (local.get $l3)
              (i32.load8_u
                (local.get $p0)))
            (local.set $p0
              (i32.add
                (local.get $p0)
                (i32.const 1)))
            (br_if $L17
              (i32.ne
                (local.tee $l3
                  (i32.add
                    (local.get $l3)
                    (i32.const 1)))
                (local.get $l5))))))
      (i32.store offset=20
        (local.get $p2)
        (i32.add
          (i32.load offset=20
            (local.get $p2))
          (local.get $p1)))
      (local.set $l3
        (i32.add
          (local.get $p1)
          (local.get $l4))))
    (local.get $l3))
  (func $f17 (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (if $I2
      (i32.eq
        (local.get $p1)
        (local.tee $p0
          (block $B0 (result i32)
            (if $I1
              (i32.lt_s
                (i32.load offset=76
                  (local.get $p2))
                (i32.const 0))
              (then
                (br $B0
                  (call $f16
                    (local.get $p0)
                    (local.get $p1)
                    (local.get $p2)))))
            (call $f16
              (local.get $p0)
              (local.get $p1)
              (local.get $p2)))))
      (then
        (return)))
    (drop
      (i32.div_u
        (local.get $p0)
        (local.get $p1))))
  (func $f18 (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i64)
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.get $p2)))
      (i32.store8
        (local.get $p0)
        (local.get $p1))
      (i32.store8
        (i32.sub
          (local.tee $l3
            (i32.add
              (local.get $p0)
              (local.get $p2)))
          (i32.const 1))
        (local.get $p1))
      (br_if $B0
        (i32.lt_u
          (local.get $p2)
          (i32.const 3)))
      (i32.store8 offset=2
        (local.get $p0)
        (local.get $p1))
      (i32.store8 offset=1
        (local.get $p0)
        (local.get $p1))
      (i32.store8
        (i32.sub
          (local.get $l3)
          (i32.const 3))
        (local.get $p1))
      (i32.store8
        (i32.sub
          (local.get $l3)
          (i32.const 2))
        (local.get $p1))
      (br_if $B0
        (i32.lt_u
          (local.get $p2)
          (i32.const 7)))
      (i32.store8 offset=3
        (local.get $p0)
        (local.get $p1))
      (i32.store8
        (i32.sub
          (local.get $l3)
          (i32.const 4))
        (local.get $p1))
      (br_if $B0
        (i32.lt_u
          (local.get $p2)
          (i32.const 9)))
      (i32.store
        (local.tee $l3
          (i32.add
            (local.get $p0)
            (local.tee $l4
              (i32.and
                (i32.sub
                  (i32.const 0)
                  (local.get $p0))
                (i32.const 3)))))
        (local.tee $p0
          (i32.mul
            (i32.and
              (local.get $p1)
              (i32.const 255))
            (i32.const 16843009))))
      (i32.store
        (i32.sub
          (local.tee $p1
            (i32.add
              (local.get $l3)
              (local.tee $p2
                (i32.and
                  (i32.sub
                    (local.get $p2)
                    (local.get $l4))
                  (i32.const -4)))))
          (i32.const 4))
        (local.get $p0))
      (br_if $B0
        (i32.lt_u
          (local.get $p2)
          (i32.const 9)))
      (i32.store offset=8
        (local.get $l3)
        (local.get $p0))
      (i32.store offset=4
        (local.get $l3)
        (local.get $p0))
      (i32.store
        (i32.sub
          (local.get $p1)
          (i32.const 8))
        (local.get $p0))
      (i32.store
        (i32.sub
          (local.get $p1)
          (i32.const 12))
        (local.get $p0))
      (br_if $B0
        (i32.lt_u
          (local.get $p2)
          (i32.const 25)))
      (i32.store offset=24
        (local.get $l3)
        (local.get $p0))
      (i32.store offset=20
        (local.get $l3)
        (local.get $p0))
      (i32.store offset=16
        (local.get $l3)
        (local.get $p0))
      (i32.store offset=12
        (local.get $l3)
        (local.get $p0))
      (i32.store
        (i32.sub
          (local.get $p1)
          (i32.const 16))
        (local.get $p0))
      (i32.store
        (i32.sub
          (local.get $p1)
          (i32.const 20))
        (local.get $p0))
      (i32.store
        (i32.sub
          (local.get $p1)
          (i32.const 24))
        (local.get $p0))
      (i32.store
        (i32.sub
          (local.get $p1)
          (i32.const 28))
        (local.get $p0))
      (br_if $B0
        (i32.lt_u
          (local.tee $p2
            (i32.sub
              (local.get $p2)
              (local.tee $p1
                (i32.or
                  (i32.and
                    (local.get $l3)
                    (i32.const 4))
                  (i32.const 24)))))
          (i32.const 32)))
      (local.set $l5
        (i64.mul
          (i64.extend_i32_u
            (local.get $p0))
          (i64.const 4294967297)))
      (local.set $p1
        (i32.add
          (local.get $p1)
          (local.get $l3)))
      (loop $L1
        (i64.store offset=24
          (local.get $p1)
          (local.get $l5))
        (i64.store offset=16
          (local.get $p1)
          (local.get $l5))
        (i64.store offset=8
          (local.get $p1)
          (local.get $l5))
        (i64.store
          (local.get $p1)
          (local.get $l5))
        (local.set $p1
          (i32.add
            (local.get $p1)
            (i32.const 32)))
        (br_if $L1
          (i32.gt_u
            (local.tee $p2
              (i32.sub
                (local.get $p2)
                (i32.const 32)))
            (i32.const 31))))))
  (func $f19 (type $t0) (param $p0 i32) (result i32)
    (call $wasi_snapshot_preview1.fd_close
      (i32.load offset=60
        (local.get $p0))))
  (func $f20 (type $t1) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32)
    (global.set $g0
      (local.tee $l3
        (i32.sub
          (global.get $g0)
          (i32.const 32))))
    (i32.store offset=16
      (local.get $l3)
      (local.tee $l4
        (i32.load offset=28
          (local.get $p0))))
    (local.set $l5
      (i32.load offset=20
        (local.get $p0)))
    (i32.store offset=28
      (local.get $l3)
      (local.get $p2))
    (i32.store offset=24
      (local.get $l3)
      (local.get $p1))
    (i32.store offset=20
      (local.get $l3)
      (local.tee $p1
        (i32.sub
          (local.get $l5)
          (local.get $l4))))
    (local.set $l5
      (i32.add
        (local.get $p1)
        (local.get $p2)))
    (local.set $l7
      (i32.const 2))
    (local.set $p0
      (block $B0 (result i32)
        (block $B1
          (block $B2
            (block $B3
              (if $I5
                (if $I4 (result i32)
                  (local.tee $l4
                    (call $wasi_snapshot_preview1.fd_write
                      (i32.load offset=60
                        (local.get $p0))
                      (local.tee $p1
                        (i32.add
                          (local.get $l3)
                          (i32.const 16)))
                      (i32.const 2)
                      (i32.add
                        (local.get $l3)
                        (i32.const 12))))
                  (then
                    (i32.store
                      (i32.const 2016)
                      (local.get $l4))
                    (i32.const -1))
                  (else
                    (i32.const 0)))
                (then
                  (local.set $l4
                    (local.get $p1))
                  (br $B3)))
              (loop $L6
                (br_if $B2
                  (i32.eq
                    (local.get $l5)
                    (local.tee $l6
                      (i32.load offset=12
                        (local.get $l3)))))
                (if $I7
                  (i32.lt_s
                    (local.get $l6)
                    (i32.const 0))
                  (then
                    (local.set $l4
                      (local.get $p1))
                    (br $B1)))
                (i32.store
                  (local.tee $l4
                    (i32.add
                      (local.get $p1)
                      (i32.shl
                        (local.tee $l9
                          (i32.gt_u
                            (local.get $l6)
                            (local.tee $l8
                              (i32.load offset=4
                                (local.get $p1)))))
                        (i32.const 3))))
                  (i32.add
                    (local.tee $l8
                      (i32.sub
                        (local.get $l6)
                        (select
                          (local.get $l8)
                          (i32.const 0)
                          (local.get $l9))))
                    (i32.load
                      (local.get $l4))))
                (i32.store
                  (local.tee $p1
                    (i32.add
                      (local.get $p1)
                      (select
                        (i32.const 12)
                        (i32.const 4)
                        (local.get $l9))))
                  (i32.sub
                    (i32.load
                      (local.get $p1))
                    (local.get $l8)))
                (local.set $l5
                  (i32.sub
                    (local.get $l5)
                    (local.get $l6)))
                (br_if $L6
                  (i32.eqz
                    (if $I8 (result i32)
                      (local.tee $l6
                        (call $wasi_snapshot_preview1.fd_write
                          (i32.load offset=60
                            (local.get $p0))
                          (local.tee $p1
                            (local.get $l4))
                          (local.tee $l7
                            (i32.sub
                              (local.get $l7)
                              (local.get $l9)))
                          (i32.add
                            (local.get $l3)
                            (i32.const 12))))
                      (then
                        (i32.store
                          (i32.const 2016)
                          (local.get $l6))
                        (i32.const -1))
                      (else
                        (i32.const 0)))))))
            (br_if $B1
              (i32.ne
                (local.get $l5)
                (i32.const -1))))
          (i32.store offset=28
            (local.get $p0)
            (local.tee $p1
              (i32.load offset=44
                (local.get $p0))))
          (i32.store offset=20
            (local.get $p0)
            (local.get $p1))
          (i32.store offset=16
            (local.get $p0)
            (i32.add
              (local.get $p1)
              (i32.load offset=48
                (local.get $p0))))
          (br $B0
            (local.get $p2)))
        (i32.store offset=28
          (local.get $p0)
          (i32.const 0))
        (i64.store offset=16
          (local.get $p0)
          (i64.const 0))
        (i32.store
          (local.get $p0)
          (i32.or
            (i32.load
              (local.get $p0))
            (i32.const 32)))
        (drop
          (br_if $B0
            (i32.const 0)
            (i32.eq
              (local.get $l7)
              (i32.const 2))))
        (i32.sub
          (local.get $p2)
          (i32.load offset=4
            (local.get $l4)))))
    (global.set $g0
      (i32.add
        (local.get $l3)
        (i32.const 32)))
    (local.get $p0))
  (func $f21 (type $t5) (param $p0 i32) (param $p1 i64) (param $p2 i32) (result i64)
    (local $l3 i32)
    (local.set $l3
      (i32.load offset=60
        (local.get $p0)))
    (global.set $g0
      (local.tee $p0
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (local.set $p2
      (if $I0 (result i32)
        (local.tee $p2
          (call $wasi_snapshot_preview1.fd_seek
            (local.get $l3)
            (local.get $p1)
            (i32.and
              (local.get $p2)
              (i32.const 255))
            (i32.add
              (local.get $p0)
              (i32.const 8))))
        (then
          (i32.store
            (i32.const 2016)
            (local.get $p2))
          (i32.const -1))
        (else
          (i32.const 0))))
    (local.set $p1
      (i64.load offset=8
        (local.get $p0)))
    (global.set $g0
      (i32.add
        (local.get $p0)
        (i32.const 16)))
    (select
      (i64.const -1)
      (local.get $p1)
      (local.get $p2)))
  (func $f22 (type $t5) (param $p0 i32) (param $p1 i64) (param $p2 i32) (result i64)
    (i64.const 0))
  (func $f23 (type $t12) (param $p0 f64) (param $p1 i32) (result f64)
    (local $l2 i32) (local $l3 i64)
    (if $I0 (result f64)
      (i32.ne
        (local.tee $l2
          (i32.and
            (i32.wrap_i64
              (i64.shr_u
                (local.tee $l3
                  (i64.reinterpret_f64
                    (local.get $p0)))
                (i64.const 52)))
            (i32.const 2047)))
        (i32.const 2047))
      (then
        (if $I1
          (i32.eqz
            (local.get $l2))
          (then
            (i32.store
              (local.get $p1)
              (if $I2 (result i32)
                (f64.eq
                  (local.get $p0)
                  (f64.const 0x0p+0 (;=0;)))
                (then
                  (i32.const 0))
                (else
                  (local.set $p0
                    (call $f23
                      (f64.mul
                        (local.get $p0)
                        (f64.const 0x1p+64 (;=1.84467e+19;)))
                      (local.get $p1)))
                  (i32.add
                    (i32.load
                      (local.get $p1))
                    (i32.const -64)))))
            (return
              (local.get $p0))))
        (i32.store
          (local.get $p1)
          (i32.sub
            (local.get $l2)
            (i32.const 1022)))
        (f64.reinterpret_i64
          (i64.or
            (i64.and
              (local.get $l3)
              (i64.const -9218868437227405313))
            (i64.const 4602678819172646912))))
      (else
        (local.get $p0))))
  (func $f24 (type $t13) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    (local $l4 i32) (local $l5 i32) (local $l6 i32)
    (global.set $g0
      (local.tee $l4
        (i32.sub
          (global.get $g0)
          (i32.const 208))))
    (i32.store offset=204
      (local.get $l4)
      (local.get $p2))
    (call $f18
      (local.tee $p2
        (i32.add
          (local.get $l4)
          (i32.const 160)))
      (i32.const 0)
      (i32.const 40))
    (i32.store offset=200
      (local.get $l4)
      (i32.load offset=204
        (local.get $l4)))
    (block $B0
      (br_if $B0
        (i32.lt_s
          (call $f25
            (i32.const 0)
            (local.get $p1)
            (i32.add
              (local.get $l4)
              (i32.const 200))
            (i32.add
              (local.get $l4)
              (i32.const 80))
            (local.get $p2)
            (local.get $p3))
          (i32.const 0)))
      (local.set $l5
        (i32.ge_s
          (i32.load offset=76
            (local.get $p0))
          (i32.const 0)))
      (i32.store
        (local.get $p0)
        (i32.and
          (local.tee $p2
            (i32.load
              (local.get $p0)))
          (i32.const -33)))
      (local.set $p1
        (block $B1 (result i32)
          (block $B2
            (block $B3
              (if $I4
                (i32.eqz
                  (i32.load offset=48
                    (local.get $p0)))
                (then
                  (i32.store offset=48
                    (local.get $p0)
                    (i32.const 80))
                  (i32.store offset=28
                    (local.get $p0)
                    (i32.const 0))
                  (i64.store offset=16
                    (local.get $p0)
                    (i64.const 0))
                  (local.set $l6
                    (i32.load offset=44
                      (local.get $p0)))
                  (i32.store offset=44
                    (local.get $p0)
                    (local.get $l4))
                  (br $B3)))
              (br_if $B2
                (i32.load offset=16
                  (local.get $p0))))
            (drop
              (br_if $B1
                (i32.const -1)
                (call $f14
                  (local.get $p0)))))
          (call $f25
            (local.get $p0)
            (local.get $p1)
            (i32.add
              (local.get $l4)
              (i32.const 200))
            (i32.add
              (local.get $l4)
              (i32.const 80))
            (i32.add
              (local.get $l4)
              (i32.const 160))
            (local.get $p3))))
      (drop
        (if $I5 (result i32)
          (local.get $l6)
          (then
            (drop
              (call_indirect $__indirect_function_table (type $t1)
                (local.get $p0)
                (i32.const 0)
                (i32.const 0)
                (i32.load offset=36
                  (local.get $p0))))
            (i32.store offset=48
              (local.get $p0)
              (i32.const 0))
            (i32.store offset=44
              (local.get $p0)
              (local.get $l6))
            (i32.store offset=28
              (local.get $p0)
              (i32.const 0))
            (drop
              (i32.load offset=20
                (local.get $p0)))
            (i64.store offset=16
              (local.get $p0)
              (i64.const 0))
            (i32.const 0))
          (else
            (local.get $p1))))
      (i32.store
        (local.get $p0)
        (i32.or
          (i32.load
            (local.get $p0))
          (i32.and
            (local.get $p2)
            (i32.const 32))))
      (br_if $B0
        (i32.eqz
          (local.get $l5))))
    (global.set $g0
      (i32.add
        (local.get $l4)
        (i32.const 208))))
  (func $f25 (type $t14) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (param $p4 i32) (param $p5 i32) (result i32)
    (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32) (local $l14 i32) (local $l15 i32) (local $l16 i32) (local $l17 i32) (local $l18 i32) (local $l19 i32) (local $l20 i32) (local $l21 i32) (local $l22 i32) (local $l23 i32) (local $l24 i32) (local $l25 i64)
    (global.set $g0
      (local.tee $l7
        (i32.sub
          (global.get $g0)
          (i32.const 80))))
    (i32.store offset=76
      (local.get $l7)
      (local.get $p1))
    (local.set $l23
      (i32.add
        (local.get $l7)
        (i32.const 55)))
    (local.set $l19
      (i32.add
        (local.get $l7)
        (i32.const 56)))
    (block $B0
      (block $B1
        (block $B2
          (loop $L3
            (local.set $l6
              (i32.const 0))
            (loop $L4
              (local.set $l11
                (local.get $p1))
              (br_if $B2
                (i32.gt_s
                  (local.get $l6)
                  (i32.xor
                    (local.get $l18)
                    (i32.const 2147483647))))
              (local.set $l18
                (i32.add
                  (local.get $l6)
                  (local.get $l18)))
              (block $B5
                (block $B6
                  (block $B7
                    (if $I8
                      (local.tee $l8
                        (i32.load8_u
                          (local.tee $l6
                            (local.get $l11))))
                      (then
                        (loop $L9
                          (block $B10
                            (block $B11
                              (if $I12
                                (i32.eqz
                                  (local.tee $p1
                                    (i32.and
                                      (local.get $l8)
                                      (i32.const 255))))
                                (then
                                  (local.set $p1
                                    (local.get $l6))
                                  (br $B11)))
                              (br_if $B10
                                (i32.ne
                                  (local.get $p1)
                                  (i32.const 37)))
                              (local.set $l8
                                (local.get $l6))
                              (loop $L13
                                (if $I14
                                  (i32.ne
                                    (i32.load8_u offset=1
                                      (local.get $l8))
                                    (i32.const 37))
                                  (then
                                    (local.set $p1
                                      (local.get $l8))
                                    (br $B11)))
                                (local.set $l6
                                  (i32.add
                                    (local.get $l6)
                                    (i32.const 1)))
                                (local.set $l12
                                  (i32.load8_u offset=2
                                    (local.get $l8)))
                                (local.set $l8
                                  (local.tee $p1
                                    (i32.add
                                      (local.get $l8)
                                      (i32.const 2))))
                                (br_if $L13
                                  (i32.eq
                                    (local.get $l12)
                                    (i32.const 37)))))
                            (br_if $B2
                              (i32.gt_s
                                (local.tee $l6
                                  (i32.sub
                                    (local.get $l6)
                                    (local.get $l11)))
                                (local.tee $l24
                                  (i32.xor
                                    (local.get $l18)
                                    (i32.const 2147483647)))))
                            (if $I15
                              (local.get $p0)
                              (then
                                (call $f26
                                  (local.get $p0)
                                  (local.get $l11)
                                  (local.get $l6))))
                            (br_if $L4
                              (local.get $l6))
                            (i32.store offset=76
                              (local.get $l7)
                              (local.get $p1))
                            (local.set $l6
                              (i32.add
                                (local.get $p1)
                                (i32.const 1)))
                            (local.set $l15
                              (i32.const -1))
                            (block $B16
                              (br_if $B16
                                (i32.ge_u
                                  (i32.sub
                                    (i32.load8_s offset=1
                                      (local.get $p1))
                                    (i32.const 48))
                                  (i32.const 10)))
                              (br_if $B16
                                (i32.ne
                                  (i32.load8_u offset=2
                                    (local.get $p1))
                                  (i32.const 36)))
                              (local.set $l6
                                (i32.add
                                  (local.get $p1)
                                  (i32.const 3)))
                              (local.set $l15
                                (i32.sub
                                  (i32.load8_s offset=1
                                    (local.get $p1))
                                  (i32.const 48)))
                              (local.set $l20
                                (i32.const 1)))
                            (i32.store offset=76
                              (local.get $l7)
                              (local.get $l6))
                            (local.set $l10
                              (i32.const 0))
                            (block $B17
                              (if $I18
                                (i32.gt_u
                                  (local.tee $p1
                                    (i32.sub
                                      (local.tee $l8
                                        (i32.load8_s
                                          (local.get $l6)))
                                      (i32.const 32)))
                                  (i32.const 31))
                                (then
                                  (local.set $l12
                                    (local.get $l6))
                                  (br $B17)))
                              (local.set $l12
                                (local.get $l6))
                              (br_if $B17
                                (i32.eqz
                                  (i32.and
                                    (local.tee $p1
                                      (i32.shl
                                        (i32.const 1)
                                        (local.get $p1)))
                                    (i32.const 75913))))
                              (loop $L19
                                (i32.store offset=76
                                  (local.get $l7)
                                  (local.tee $l12
                                    (i32.add
                                      (local.get $l6)
                                      (i32.const 1))))
                                (local.set $l10
                                  (i32.or
                                    (local.get $p1)
                                    (local.get $l10)))
                                (br_if $B17
                                  (i32.ge_u
                                    (local.tee $p1
                                      (i32.sub
                                        (local.tee $l8
                                          (i32.load8_s offset=1
                                            (local.get $l6)))
                                        (i32.const 32)))
                                    (i32.const 32)))
                                (local.set $l6
                                  (local.get $l12))
                                (br_if $L19
                                  (i32.and
                                    (local.tee $p1
                                      (i32.shl
                                        (i32.const 1)
                                        (local.get $p1)))
                                    (i32.const 75913)))))
                            (block $B20
                              (if $I21
                                (i32.eq
                                  (local.get $l8)
                                  (i32.const 42))
                                (then
                                  (local.set $l8
                                    (i32.add
                                      (local.get $l12)
                                      (i32.const 1)))
                                  (local.set $l16
                                    (block $B22 (result i32)
                                      (block $B23
                                        (br_if $B23
                                          (i32.ge_u
                                            (i32.sub
                                              (i32.load8_s offset=1
                                                (local.get $l12))
                                              (i32.const 48))
                                            (i32.const 10)))
                                        (br_if $B23
                                          (i32.ne
                                            (i32.load8_u offset=2
                                              (local.get $l12))
                                            (i32.const 36)))
                                        (local.set $p1
                                          (i32.sub
                                            (i32.load8_s
                                              (local.get $l8))
                                            (i32.const 48)))
                                        (local.set $l8
                                          (i32.add
                                            (local.get $l12)
                                            (i32.const 3)))
                                        (local.set $l20
                                          (i32.const 1))
                                        (br $B22
                                          (block $B24 (result i32)
                                            (if $I25
                                              (i32.eqz
                                                (local.get $p0))
                                              (then
                                                (i32.store
                                                  (i32.add
                                                    (local.get $p4)
                                                    (i32.shl
                                                      (local.get $p1)
                                                      (i32.const 2)))
                                                  (i32.const 10))
                                                (br $B24
                                                  (i32.const 0))))
                                            (i32.load
                                              (i32.add
                                                (local.get $p3)
                                                (i32.shl
                                                  (local.get $p1)
                                                  (i32.const 3)))))))
                                      (br_if $B7
                                        (local.get $l20))
                                      (if $I26
                                        (i32.eqz
                                          (local.get $p0))
                                        (then
                                          (i32.store offset=76
                                            (local.get $l7)
                                            (local.get $l8))
                                          (local.set $l20
                                            (i32.const 0))
                                          (local.set $l16
                                            (i32.const 0))
                                          (br $B20)))
                                      (i32.store
                                        (local.get $p2)
                                        (i32.add
                                          (local.tee $p1
                                            (i32.load
                                              (local.get $p2)))
                                          (i32.const 4)))
                                      (local.set $l20
                                        (i32.const 0))
                                      (i32.load
                                        (local.get $p1))))
                                  (i32.store offset=76
                                    (local.get $l7)
                                    (local.get $l8))
                                  (br_if $B20
                                    (i32.ge_s
                                      (local.get $l16)
                                      (i32.const 0)))
                                  (local.set $l16
                                    (i32.sub
                                      (i32.const 0)
                                      (local.get $l16)))
                                  (local.set $l10
                                    (i32.or
                                      (local.get $l10)
                                      (i32.const 8192)))
                                  (br $B20)))
                              (br_if $B2
                                (i32.lt_s
                                  (local.tee $l16
                                    (call $f27
                                      (i32.add
                                        (local.get $l7)
                                        (i32.const 76))))
                                  (i32.const 0)))
                              (local.set $l8
                                (i32.load offset=76
                                  (local.get $l7))))
                            (local.set $l6
                              (i32.const 0))
                            (local.set $l9
                              (i32.const -1))
                            (local.set $l21
                              (block $B27 (result i32)
                                (if $I28
                                  (i32.ne
                                    (i32.load8_u
                                      (local.get $l8))
                                    (i32.const 46))
                                  (then
                                    (local.set $p1
                                      (local.get $l8))
                                    (br $B27
                                      (i32.const 0))))
                                (if $I29
                                  (i32.eq
                                    (i32.load8_u offset=1
                                      (local.get $l8))
                                    (i32.const 42))
                                  (then
                                    (local.set $p1
                                      (i32.add
                                        (local.get $l8)
                                        (i32.const 2)))
                                    (block $B30
                                      (block $B31
                                        (br_if $B31
                                          (i32.ge_u
                                            (i32.sub
                                              (i32.load8_s offset=2
                                                (local.get $l8))
                                              (i32.const 48))
                                            (i32.const 10)))
                                        (br_if $B31
                                          (i32.ne
                                            (i32.load8_u offset=3
                                              (local.get $l8))
                                            (i32.const 36)))
                                        (local.set $p1
                                          (i32.sub
                                            (i32.load8_s
                                              (local.get $p1))
                                            (i32.const 48)))
                                        (local.set $l9
                                          (block $B32 (result i32)
                                            (if $I33
                                              (i32.eqz
                                                (local.get $p0))
                                              (then
                                                (i32.store
                                                  (i32.add
                                                    (local.get $p4)
                                                    (i32.shl
                                                      (local.get $p1)
                                                      (i32.const 2)))
                                                  (i32.const 10))
                                                (br $B32
                                                  (i32.const 0))))
                                            (i32.load
                                              (i32.add
                                                (local.get $p3)
                                                (i32.shl
                                                  (local.get $p1)
                                                  (i32.const 3))))))
                                        (local.set $p1
                                          (i32.add
                                            (local.get $l8)
                                            (i32.const 4)))
                                        (br $B30))
                                      (br_if $B7
                                        (local.get $l20))
                                      (if $I34
                                        (i32.eqz
                                          (local.get $p0))
                                        (then
                                          (local.set $l9
                                            (i32.const 0))
                                          (br $B30)))
                                      (i32.store
                                        (local.get $p2)
                                        (i32.add
                                          (local.tee $l12
                                            (i32.load
                                              (local.get $p2)))
                                          (i32.const 4)))
                                      (local.set $l9
                                        (i32.load
                                          (local.get $l12))))
                                    (i32.store offset=76
                                      (local.get $l7)
                                      (local.get $p1))
                                    (br $B27
                                      (i32.shr_u
                                        (i32.xor
                                          (local.get $l9)
                                          (i32.const -1))
                                        (i32.const 31)))))
                                (i32.store offset=76
                                  (local.get $l7)
                                  (i32.add
                                    (local.get $l8)
                                    (i32.const 1)))
                                (local.set $l9
                                  (call $f27
                                    (i32.add
                                      (local.get $l7)
                                      (i32.const 76))))
                                (local.set $p1
                                  (i32.load offset=76
                                    (local.get $l7)))
                                (i32.const 1)))
                            (loop $L35
                              (local.set $l13
                                (local.get $l6))
                              (local.set $l17
                                (i32.const 28))
                              (br_if $B1
                                (i32.lt_u
                                  (i32.sub
                                    (local.tee $l6
                                      (i32.load8_s
                                        (local.tee $l14
                                          (local.get $p1))))
                                    (i32.const 123))
                                  (i32.const -58)))
                              (local.set $p1
                                (i32.add
                                  (local.get $l14)
                                  (i32.const 1)))
                              (br_if $L35
                                (i32.lt_u
                                  (i32.sub
                                    (local.tee $l6
                                      (i32.load8_u
                                        (i32.add
                                          (i32.add
                                            (local.get $l6)
                                            (i32.mul
                                              (local.get $l13)
                                              (i32.const 58)))
                                          (i32.const 1167))))
                                    (i32.const 1))
                                  (i32.const 8))))
                            (i32.store offset=76
                              (local.get $l7)
                              (local.get $p1))
                            (block $B36
                              (if $I37
                                (i32.ne
                                  (local.get $l6)
                                  (i32.const 27))
                                (then
                                  (br_if $B1
                                    (i32.eqz
                                      (local.get $l6)))
                                  (if $I38
                                    (i32.ge_s
                                      (local.get $l15)
                                      (i32.const 0))
                                    (then
                                      (if $I39
                                        (i32.eqz
                                          (local.get $p0))
                                        (then
                                          (i32.store
                                            (i32.add
                                              (local.get $p4)
                                              (i32.shl
                                                (local.get $l15)
                                                (i32.const 2)))
                                            (local.get $l6))
                                          (br $L3)))
                                      (i64.store offset=64
                                        (local.get $l7)
                                        (i64.load
                                          (i32.add
                                            (local.get $p3)
                                            (i32.shl
                                              (local.get $l15)
                                              (i32.const 3)))))
                                      (br $B36)))
                                  (br_if $B5
                                    (i32.eqz
                                      (local.get $p0)))
                                  (call $f28
                                    (i32.sub
                                      (local.get $l7)
                                      (i32.const -64))
                                    (local.get $l6)
                                    (local.get $p2))
                                  (br $B36)))
                              (br_if $B1
                                (i32.ge_s
                                  (local.get $l15)
                                  (i32.const 0)))
                              (local.set $l6
                                (i32.const 0))
                              (br_if $L4
                                (i32.eqz
                                  (local.get $p0))))
                            (local.set $l17
                              (i32.const -1))
                            (br_if $B0
                              (i32.and
                                (i32.load8_u
                                  (local.get $p0))
                                (i32.const 32)))
                            (local.set $l10
                              (select
                                (local.tee $l8
                                  (i32.and
                                    (local.get $l10)
                                    (i32.const -65537)))
                                (local.get $l10)
                                (i32.and
                                  (local.get $l10)
                                  (i32.const 8192))))
                            (local.set $l15
                              (i32.const 0))
                            (local.set $l22
                              (i32.const 1075))
                            (local.set $l12
                              (local.get $l19))
                            (block $B40
                              (block $B41
                                (block $B42
                                  (local.set $l8
                                    (block $B43 (result i32)
                                      (block $B44
                                        (block $B45
                                          (block $B46
                                            (block $B47
                                              (local.set $l22
                                                (block $B48 (result i32)
                                                  (block $B49
                                                    (block $B50
                                                      (block $B51
                                                        (block $B52
                                                          (block $B53
                                                            (block $B54
                                                              (block $B55
                                                                (br_table $B51 $B6 $B6 $B6 $B6 $B6 $B6 $B6 $B6 $B41 $B6 $B40 $B49 $B41 $B41 $B41 $B6 $B49 $B6 $B6 $B6 $B6 $B53 $B50 $B52 $B6 $B6 $B46 $B6 $B54 $B6 $B6 $B51 $B55
                                                                  (i32.sub
                                                                    (local.tee $l6
                                                                      (select
                                                                        (select
                                                                          (i32.and
                                                                            (local.tee $l6
                                                                              (i32.load8_s
                                                                                (local.get $l14)))
                                                                            (i32.const -33))
                                                                          (local.get $l6)
                                                                          (i32.eq
                                                                            (i32.and
                                                                              (local.get $l6)
                                                                              (i32.const 15))
                                                                            (i32.const 3)))
                                                                        (local.get $l6)
                                                                        (local.get $l13)))
                                                                    (i32.const 88))))
                                                              (block $B56
                                                                (br_table $B41 $B6 $B44 $B6 $B41 $B41 $B41 $B56
                                                                  (i32.sub
                                                                    (local.get $l6)
                                                                    (i32.const 65))))
                                                              (br_if $B45
                                                                (i32.eq
                                                                  (local.get $l6)
                                                                  (i32.const 83)))
                                                              (br $B6))
                                                            (local.set $l25
                                                              (i64.load offset=64
                                                                (local.get $l7)))
                                                            (br $B48
                                                              (i32.const 1075)))
                                                          (local.set $l6
                                                            (i32.const 0))
                                                          (block $B57
                                                            (block $B58
                                                              (block $B59
                                                                (block $B60
                                                                  (block $B61
                                                                    (block $B62
                                                                      (block $B63
                                                                        (br_table $B63 $B62 $B61 $B60 $B59 $L4 $B58 $B57 $L4
                                                                          (i32.and
                                                                            (local.get $l13)
                                                                            (i32.const 255))))
                                                                      (i32.store
                                                                        (i32.load offset=64
                                                                          (local.get $l7))
                                                                        (local.get $l18))
                                                                      (br $L4))
                                                                    (i32.store
                                                                      (i32.load offset=64
                                                                        (local.get $l7))
                                                                      (local.get $l18))
                                                                    (br $L4))
                                                                  (i64.store
                                                                    (i32.load offset=64
                                                                      (local.get $l7))
                                                                    (i64.extend_i32_s
                                                                      (local.get $l18)))
                                                                  (br $L4))
                                                                (i32.store16
                                                                  (i32.load offset=64
                                                                    (local.get $l7))
                                                                  (local.get $l18))
                                                                (br $L4))
                                                              (i32.store8
                                                                (i32.load offset=64
                                                                  (local.get $l7))
                                                                (local.get $l18))
                                                              (br $L4))
                                                            (i32.store
                                                              (i32.load offset=64
                                                                (local.get $l7))
                                                              (local.get $l18))
                                                            (br $L4))
                                                          (i64.store
                                                            (i32.load offset=64
                                                              (local.get $l7))
                                                            (i64.extend_i32_s
                                                              (local.get $l18)))
                                                          (br $L4))
                                                        (local.set $l9
                                                          (select
                                                            (i32.const 8)
                                                            (local.get $l9)
                                                            (i32.le_u
                                                              (local.get $l9)
                                                              (i32.const 8))))
                                                        (local.set $l10
                                                          (i32.or
                                                            (local.get $l10)
                                                            (i32.const 8)))
                                                        (local.set $l6
                                                          (i32.const 120)))
                                                      (local.set $l11
                                                        (local.get $l19))
                                                      (if $I64
                                                        (i64.ne
                                                          (local.tee $l25
                                                            (i64.load offset=64
                                                              (local.get $l7)))
                                                          (i64.const 0))
                                                        (then
                                                          (local.set $l14
                                                            (i32.and
                                                              (local.get $l6)
                                                              (i32.const 32)))
                                                          (loop $L65
                                                            (i32.store8
                                                              (local.tee $l11
                                                                (i32.sub
                                                                  (local.get $l11)
                                                                  (i32.const 1)))
                                                              (i32.or
                                                                (i32.load8_u
                                                                  (i32.add
                                                                    (i32.and
                                                                      (i32.wrap_i64
                                                                        (local.get $l25))
                                                                      (i32.const 15))
                                                                    (i32.const 1696)))
                                                                (local.get $l14)))
                                                            (local.set $l8
                                                              (i64.gt_u
                                                                (local.get $l25)
                                                                (i64.const 15)))
                                                            (local.set $l25
                                                              (i64.shr_u
                                                                (local.get $l25)
                                                                (i64.const 4)))
                                                            (br_if $L65
                                                              (local.get $l8)))))
                                                      (br_if $B47
                                                        (i64.eqz
                                                          (i64.load offset=64
                                                            (local.get $l7))))
                                                      (br_if $B47
                                                        (i32.eqz
                                                          (i32.and
                                                            (local.get $l10)
                                                            (i32.const 8))))
                                                      (local.set $l22
                                                        (i32.add
                                                          (i32.shr_u
                                                            (local.get $l6)
                                                            (i32.const 4))
                                                          (i32.const 1075)))
                                                      (local.set $l15
                                                        (i32.const 2))
                                                      (br $B47))
                                                    (local.set $l6
                                                      (local.get $l19))
                                                    (if $I66
                                                      (i64.ne
                                                        (local.tee $l25
                                                          (i64.load offset=64
                                                            (local.get $l7)))
                                                        (i64.const 0))
                                                      (then
                                                        (loop $L67
                                                          (i32.store8
                                                            (local.tee $l6
                                                              (i32.sub
                                                                (local.get $l6)
                                                                (i32.const 1)))
                                                            (i32.or
                                                              (i32.and
                                                                (i32.wrap_i64
                                                                  (local.get $l25))
                                                                (i32.const 7))
                                                              (i32.const 48)))
                                                          (local.set $l11
                                                            (i64.gt_u
                                                              (local.get $l25)
                                                              (i64.const 7)))
                                                          (local.set $l25
                                                            (i64.shr_u
                                                              (local.get $l25)
                                                              (i64.const 3)))
                                                          (br_if $L67
                                                            (local.get $l11)))))
                                                    (local.set $l11
                                                      (local.get $l6))
                                                    (br_if $B47
                                                      (i32.eqz
                                                        (i32.and
                                                          (local.get $l10)
                                                          (i32.const 8))))
                                                    (local.set $l9
                                                      (select
                                                        (local.get $l9)
                                                        (i32.add
                                                          (local.tee $l6
                                                            (i32.sub
                                                              (local.get $l19)
                                                              (local.get $l11)))
                                                          (i32.const 1))
                                                        (i32.lt_s
                                                          (local.get $l6)
                                                          (local.get $l9))))
                                                    (br $B47))
                                                  (if $I68
                                                    (i64.lt_s
                                                      (local.tee $l25
                                                        (i64.load offset=64
                                                          (local.get $l7)))
                                                      (i64.const 0))
                                                    (then
                                                      (i64.store offset=64
                                                        (local.get $l7)
                                                        (local.tee $l25
                                                          (i64.sub
                                                            (i64.const 0)
                                                            (local.get $l25))))
                                                      (local.set $l15
                                                        (i32.const 1))
                                                      (br $B48
                                                        (i32.const 1075))))
                                                  (if $I69
                                                    (i32.and
                                                      (local.get $l10)
                                                      (i32.const 2048))
                                                    (then
                                                      (local.set $l15
                                                        (i32.const 1))
                                                      (br $B48
                                                        (i32.const 1076))))
                                                  (select
                                                    (i32.const 1077)
                                                    (i32.const 1075)
                                                    (local.tee $l15
                                                      (i32.and
                                                        (local.get $l10)
                                                        (i32.const 1))))))
                                              (local.set $l11
                                                (call $f29
                                                  (local.get $l25)
                                                  (local.get $l19))))
                                            (br_if $B2
                                              (select
                                                (local.get $l21)
                                                (i32.const 0)
                                                (i32.lt_s
                                                  (local.get $l9)
                                                  (i32.const 0))))
                                            (local.set $l10
                                              (select
                                                (i32.and
                                                  (local.get $l10)
                                                  (i32.const -65537))
                                                (local.get $l10)
                                                (local.get $l21)))
                                            (block $B70
                                              (br_if $B70
                                                (i64.ne
                                                  (local.tee $l25
                                                    (i64.load offset=64
                                                      (local.get $l7)))
                                                  (i64.const 0)))
                                              (br_if $B70
                                                (local.get $l9))
                                              (local.set $l11
                                                (local.get $l19))
                                              (local.set $l9
                                                (i32.const 0))
                                              (br $B6))
                                            (local.set $l9
                                              (select
                                                (local.get $l9)
                                                (local.tee $l6
                                                  (i32.add
                                                    (i64.eqz
                                                      (local.get $l25))
                                                    (i32.sub
                                                      (local.get $l19)
                                                      (local.get $l11))))
                                                (i32.lt_s
                                                  (local.get $l6)
                                                  (local.get $l9))))
                                            (br $B6))
                                          (local.set $l12
                                            (i32.add
                                              (local.tee $l6
                                                (select
                                                  (i32.sub
                                                    (local.tee $l6
                                                      (block $B71 (result i32)
                                                        (local.set $l10
                                                          (i32.ne
                                                            (local.tee $l14
                                                              (local.tee $l12
                                                                (select
                                                                  (i32.const 2147483647)
                                                                  (local.get $l9)
                                                                  (i32.ge_u
                                                                    (local.get $l9)
                                                                    (i32.const 2147483647)))))
                                                            (i32.const 0)))
                                                        (block $B72
                                                          (block $B73
                                                            (block $B74
                                                              (br_if $B74
                                                                (i32.eqz
                                                                  (i32.and
                                                                    (local.tee $l13
                                                                      (local.tee $l11
                                                                        (select
                                                                          (local.tee $l6
                                                                            (i32.load offset=64
                                                                              (local.get $l7)))
                                                                          (i32.const 1139)
                                                                          (local.get $l6))))
                                                                    (i32.const 3))))
                                                              (br_if $B74
                                                                (i32.eqz
                                                                  (local.get $l14)))
                                                              (loop $L75
                                                                (br_if $B73
                                                                  (i32.eqz
                                                                    (i32.load8_u
                                                                      (local.get $l13))))
                                                                (local.set $l10
                                                                  (i32.ne
                                                                    (local.tee $l14
                                                                      (i32.sub
                                                                        (local.get $l14)
                                                                        (i32.const 1)))
                                                                    (i32.const 0)))
                                                                (br_if $B74
                                                                  (i32.eqz
                                                                    (i32.and
                                                                      (local.tee $l13
                                                                        (i32.add
                                                                          (local.get $l13)
                                                                          (i32.const 1)))
                                                                      (i32.const 3))))
                                                                (br_if $L75
                                                                  (local.get $l14))))
                                                            (br_if $B72
                                                              (i32.eqz
                                                                (local.get $l10)))
                                                            (block $B76
                                                              (br_if $B76
                                                                (i32.eqz
                                                                  (i32.load8_u
                                                                    (local.get $l13))))
                                                              (br_if $B76
                                                                (i32.lt_u
                                                                  (local.get $l14)
                                                                  (i32.const 4)))
                                                              (loop $L77
                                                                (br_if $B73
                                                                  (i32.and
                                                                    (i32.and
                                                                      (i32.xor
                                                                        (local.tee $l6
                                                                          (i32.load
                                                                            (local.get $l13)))
                                                                        (i32.const -1))
                                                                      (i32.sub
                                                                        (local.get $l6)
                                                                        (i32.const 16843009)))
                                                                    (i32.const -2139062144)))
                                                                (local.set $l13
                                                                  (i32.add
                                                                    (local.get $l13)
                                                                    (i32.const 4)))
                                                                (br_if $L77
                                                                  (i32.gt_u
                                                                    (local.tee $l14
                                                                      (i32.sub
                                                                        (local.get $l14)
                                                                        (i32.const 4)))
                                                                    (i32.const 3)))))
                                                            (br_if $B72
                                                              (i32.eqz
                                                                (local.get $l14))))
                                                          (loop $L78
                                                            (drop
                                                              (br_if $B71
                                                                (local.get $l13)
                                                                (i32.eqz
                                                                  (i32.load8_u
                                                                    (local.get $l13)))))
                                                            (local.set $l13
                                                              (i32.add
                                                                (local.get $l13)
                                                                (i32.const 1)))
                                                            (br_if $L78
                                                              (local.tee $l14
                                                                (i32.sub
                                                                  (local.get $l14)
                                                                  (i32.const 1))))))
                                                        (i32.const 0)))
                                                    (local.get $l11))
                                                  (local.get $l12)
                                                  (local.get $l6)))
                                              (local.get $l11)))
                                          (if $I79
                                            (i32.ge_s
                                              (local.get $l9)
                                              (i32.const 0))
                                            (then
                                              (local.set $l10
                                                (local.get $l8))
                                              (local.set $l9
                                                (local.get $l6))
                                              (br $B6)))
                                          (local.set $l10
                                            (local.get $l8))
                                          (local.set $l9
                                            (local.get $l6))
                                          (br_if $B2
                                            (i32.load8_u
                                              (local.get $l12)))
                                          (br $B6))
                                        (if $I80
                                          (local.get $l9)
                                          (then
                                            (br $B43
                                              (i32.load offset=64
                                                (local.get $l7)))))
                                        (local.set $l6
                                          (i32.const 0))
                                        (call $f30
                                          (local.get $p0)
                                          (i32.const 32)
                                          (local.get $l16)
                                          (i32.const 0)
                                          (local.get $l10))
                                        (br $B42))
                                      (i32.store offset=12
                                        (local.get $l7)
                                        (i32.const 0))
                                      (i64.store32 offset=8
                                        (local.get $l7)
                                        (i64.load offset=64
                                          (local.get $l7)))
                                      (i32.store offset=64
                                        (local.get $l7)
                                        (local.tee $l6
                                          (i32.add
                                            (local.get $l7)
                                            (i32.const 8))))
                                      (local.set $l9
                                        (i32.const -1))
                                      (local.get $l6)))
                                  (local.set $l6
                                    (i32.const 0))
                                  (block $B81
                                    (loop $L82
                                      (br_if $B81
                                        (i32.eqz
                                          (local.tee $l11
                                            (i32.load
                                              (local.get $l8)))))
                                      (block $B83
                                        (br_if $B83
                                          (local.tee $l11
                                            (i32.lt_s
                                              (local.tee $l12
                                                (call $f32
                                                  (i32.add
                                                    (local.get $l7)
                                                    (i32.const 4))
                                                  (local.get $l11)))
                                              (i32.const 0))))
                                        (br_if $B83
                                          (i32.gt_u
                                            (local.get $l12)
                                            (i32.sub
                                              (local.get $l9)
                                              (local.get $l6))))
                                        (local.set $l8
                                          (i32.add
                                            (local.get $l8)
                                            (i32.const 4)))
                                        (br_if $L82
                                          (i32.lt_u
                                            (local.tee $l6
                                              (i32.add
                                                (local.get $l6)
                                                (local.get $l12)))
                                            (local.get $l9)))
                                        (br $B81)))
                                    (br_if $B0
                                      (local.get $l11)))
                                  (local.set $l17
                                    (i32.const 61))
                                  (br_if $B1
                                    (i32.lt_s
                                      (local.get $l6)
                                      (i32.const 0)))
                                  (call $f30
                                    (local.get $p0)
                                    (i32.const 32)
                                    (local.get $l16)
                                    (local.get $l6)
                                    (local.get $l10))
                                  (if $I84
                                    (i32.eqz
                                      (local.get $l6))
                                    (then
                                      (local.set $l6
                                        (i32.const 0))
                                      (br $B42)))
                                  (local.set $l12
                                    (i32.const 0))
                                  (local.set $l8
                                    (i32.load offset=64
                                      (local.get $l7)))
                                  (loop $L85
                                    (br_if $B42
                                      (i32.eqz
                                        (local.tee $l11
                                          (i32.load
                                            (local.get $l8)))))
                                    (br_if $B42
                                      (i32.gt_u
                                        (local.tee $l12
                                          (i32.add
                                            (local.tee $l11
                                              (call $f32
                                                (i32.add
                                                  (local.get $l7)
                                                  (i32.const 4))
                                                (local.get $l11)))
                                            (local.get $l12)))
                                        (local.get $l6)))
                                    (call $f26
                                      (local.get $p0)
                                      (i32.add
                                        (local.get $l7)
                                        (i32.const 4))
                                      (local.get $l11))
                                    (local.set $l8
                                      (i32.add
                                        (local.get $l8)
                                        (i32.const 4)))
                                    (br_if $L85
                                      (i32.gt_u
                                        (local.get $l6)
                                        (local.get $l12)))))
                                (call $f30
                                  (local.get $p0)
                                  (i32.const 32)
                                  (local.get $l16)
                                  (local.get $l6)
                                  (i32.xor
                                    (local.get $l10)
                                    (i32.const 8192)))
                                (local.set $l6
                                  (select
                                    (local.get $l16)
                                    (local.get $l6)
                                    (i32.lt_s
                                      (local.get $l6)
                                      (local.get $l16))))
                                (br $L4))
                              (br_if $B2
                                (select
                                  (local.get $l21)
                                  (i32.const 0)
                                  (i32.lt_s
                                    (local.get $l9)
                                    (i32.const 0))))
                              (local.set $l17
                                (i32.const 61))
                              (br_if $L4
                                (i32.ge_s
                                  (local.tee $l6
                                    (call_indirect $__indirect_function_table (type $t8)
                                      (local.get $p0)
                                      (f64.load offset=64
                                        (local.get $l7))
                                      (local.get $l16)
                                      (local.get $l9)
                                      (local.get $l10)
                                      (local.get $l6)
                                      (local.get $p5)))
                                  (i32.const 0)))
                              (br $B1))
                            (i64.store8 offset=55
                              (local.get $l7)
                              (i64.load offset=64
                                (local.get $l7)))
                            (local.set $l9
                              (i32.const 1))
                            (local.set $l11
                              (local.get $l23))
                            (local.set $l10
                              (local.get $l8))
                            (br $B6))
                          (local.set $l8
                            (i32.load8_u offset=1
                              (local.get $l6)))
                          (local.set $l6
                            (i32.add
                              (local.get $l6)
                              (i32.const 1)))
                          (br $L9))
                        (unreachable)))
                    (local.set $l17
                      (local.get $l18))
                    (br_if $B0
                      (local.get $p0))
                    (br_if $B5
                      (i32.eqz
                        (local.get $l20)))
                    (local.set $l6
                      (i32.const 1))
                    (loop $L86
                      (if $I87
                        (local.tee $p0
                          (i32.load
                            (i32.add
                              (local.get $p4)
                              (i32.shl
                                (local.get $l6)
                                (i32.const 2)))))
                        (then
                          (call $f28
                            (i32.add
                              (local.get $p3)
                              (i32.shl
                                (local.get $l6)
                                (i32.const 3)))
                            (local.get $p0)
                            (local.get $p2))
                          (local.set $l17
                            (i32.const 1))
                          (br_if $L86
                            (i32.ne
                              (local.tee $l6
                                (i32.add
                                  (local.get $l6)
                                  (i32.const 1)))
                              (i32.const 10)))
                          (br $B0))))
                    (local.set $l17
                      (i32.const 1))
                    (br_if $B0
                      (i32.ge_u
                        (local.get $l6)
                        (i32.const 10)))
                    (loop $L88
                      (br_if $B7
                        (i32.load
                          (i32.add
                            (local.get $p4)
                            (i32.shl
                              (local.get $l6)
                              (i32.const 2)))))
                      (br_if $L88
                        (i32.ne
                          (local.tee $l6
                            (i32.add
                              (local.get $l6)
                              (i32.const 1)))
                          (i32.const 10))))
                    (br $B0))
                  (local.set $l17
                    (i32.const 28))
                  (br $B1))
                (br_if $B2
                  (i32.gt_s
                    (local.tee $l12
                      (select
                        (local.get $l9)
                        (local.tee $l8
                          (i32.sub
                            (local.get $l12)
                            (local.get $l11)))
                        (i32.lt_s
                          (local.get $l8)
                          (local.get $l9))))
                    (i32.xor
                      (local.get $l15)
                      (i32.const 2147483647))))
                (local.set $l17
                  (i32.const 61))
                (br_if $B1
                  (i32.gt_s
                    (local.tee $l6
                      (select
                        (local.get $l16)
                        (local.tee $l9
                          (i32.add
                            (local.get $l12)
                            (local.get $l15)))
                        (i32.lt_s
                          (local.get $l9)
                          (local.get $l16))))
                    (local.get $l24)))
                (call $f30
                  (local.get $p0)
                  (i32.const 32)
                  (local.get $l6)
                  (local.get $l9)
                  (local.get $l10))
                (call $f26
                  (local.get $p0)
                  (local.get $l22)
                  (local.get $l15))
                (call $f30
                  (local.get $p0)
                  (i32.const 48)
                  (local.get $l6)
                  (local.get $l9)
                  (i32.xor
                    (local.get $l10)
                    (i32.const 65536)))
                (call $f30
                  (local.get $p0)
                  (i32.const 48)
                  (local.get $l12)
                  (local.get $l8)
                  (i32.const 0))
                (call $f26
                  (local.get $p0)
                  (local.get $l11)
                  (local.get $l8))
                (call $f30
                  (local.get $p0)
                  (i32.const 32)
                  (local.get $l6)
                  (local.get $l9)
                  (i32.xor
                    (local.get $l10)
                    (i32.const 8192)))
                (br $L4))))
          (local.set $l17
            (i32.const 0))
          (br $B0))
        (local.set $l17
          (i32.const 61)))
      (i32.store
        (i32.const 2016)
        (local.get $l17))
      (local.set $l17
        (i32.const -1)))
    (global.set $g0
      (i32.add
        (local.get $l7)
        (i32.const 80)))
    (local.get $l17))
  (func $f26 (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (if $I0
      (i32.eqz
        (i32.and
          (i32.load8_u
            (local.get $p0))
          (i32.const 32)))
      (then
        (drop
          (call $f16
            (local.get $p1)
            (local.get $p2)
            (local.get $p0))))))
  (func $f27 (type $t0) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32)
    (if $I0
      (i32.ge_u
        (i32.sub
          (i32.load8_s
            (i32.load
              (local.get $p0)))
          (i32.const 48))
        (i32.const 10))
      (then
        (return
          (i32.const 0))))
    (loop $L1
      (local.set $l3
        (i32.load
          (local.get $p0)))
      (local.set $l1
        (i32.const -1))
      (if $I2
        (i32.le_u
          (local.get $l2)
          (i32.const 214748364))
        (then
          (local.set $l1
            (select
              (i32.const -1)
              (i32.add
                (local.tee $l1
                  (i32.sub
                    (i32.load8_s
                      (local.get $l3))
                    (i32.const 48)))
                (local.tee $l2
                  (i32.mul
                    (local.get $l2)
                    (i32.const 10))))
              (i32.gt_s
                (local.get $l1)
                (i32.xor
                  (local.get $l2)
                  (i32.const 2147483647)))))))
      (i32.store
        (local.get $p0)
        (i32.add
          (local.get $l3)
          (i32.const 1)))
      (local.set $l2
        (local.get $l1))
      (br_if $L1
        (i32.lt_u
          (i32.sub
            (i32.load8_s offset=1
              (local.get $l3))
            (i32.const 48))
          (i32.const 10))))
    (local.get $l2))
  (func $f28 (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (block $B5
                (block $B6
                  (block $B7
                    (block $B8
                      (block $B9
                        (block $B10
                          (br_table $B10 $B2 $B1 $B0 $B2 $B1 $B9 $B8 $B7 $B6 $B0 $B1 $B0 $B0 $B2 $B1 $B5 $B4 $B3
                            (i32.sub
                              (local.get $p1)
                              (i32.const 9))))
                        (i32.store
                          (local.get $p2)
                          (i32.add
                            (local.tee $p1
                              (i32.load
                                (local.get $p2)))
                            (i32.const 4)))
                        (i32.store
                          (local.get $p0)
                          (i32.load
                            (local.get $p1)))
                        (return))
                      (i32.store
                        (local.get $p2)
                        (i32.add
                          (local.tee $p1
                            (i32.load
                              (local.get $p2)))
                          (i32.const 4)))
                      (i64.store
                        (local.get $p0)
                        (i64.load16_s
                          (local.get $p1)))
                      (return))
                    (i32.store
                      (local.get $p2)
                      (i32.add
                        (local.tee $p1
                          (i32.load
                            (local.get $p2)))
                        (i32.const 4)))
                    (i64.store
                      (local.get $p0)
                      (i64.load16_u
                        (local.get $p1)))
                    (return))
                  (i32.store
                    (local.get $p2)
                    (i32.add
                      (local.tee $p1
                        (i32.load
                          (local.get $p2)))
                      (i32.const 4)))
                  (i64.store
                    (local.get $p0)
                    (i64.load8_s
                      (local.get $p1)))
                  (return))
                (i32.store
                  (local.get $p2)
                  (i32.add
                    (local.tee $p1
                      (i32.load
                        (local.get $p2)))
                    (i32.const 4)))
                (i64.store
                  (local.get $p0)
                  (i64.load8_u
                    (local.get $p1)))
                (return))
              (i32.store
                (local.get $p2)
                (i32.add
                  (local.tee $p1
                    (i32.and
                      (i32.add
                        (i32.load
                          (local.get $p2))
                        (i32.const 7))
                      (i32.const -8)))
                  (i32.const 8)))
              (f64.store
                (local.get $p0)
                (f64.load
                  (local.get $p1)))
              (return))
            (unreachable))
          (return))
        (i32.store
          (local.get $p2)
          (i32.add
            (local.tee $p1
              (i32.load
                (local.get $p2)))
            (i32.const 4)))
        (i64.store
          (local.get $p0)
          (i64.load32_s
            (local.get $p1)))
        (return))
      (i32.store
        (local.get $p2)
        (i32.add
          (local.tee $p1
            (i32.load
              (local.get $p2)))
          (i32.const 4)))
      (i64.store
        (local.get $p0)
        (i64.load32_u
          (local.get $p1)))
      (return))
    (i32.store
      (local.get $p2)
      (i32.add
        (local.tee $p1
          (i32.and
            (i32.add
              (i32.load
                (local.get $p2))
              (i32.const 7))
            (i32.const -8)))
        (i32.const 8)))
    (i64.store
      (local.get $p0)
      (i64.load
        (local.get $p1))))
  (func $f29 (type $t15) (param $p0 i64) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i64)
    (block $B0
      (if $I1
        (i64.lt_u
          (local.get $p0)
          (i64.const 4294967296))
        (then
          (local.set $l5
            (local.get $p0))
          (br $B0)))
      (loop $L2
        (i32.store8
          (local.tee $p1
            (i32.sub
              (local.get $p1)
              (i32.const 1)))
          (i32.or
            (i32.wrap_i64
              (i64.sub
                (local.get $p0)
                (i64.mul
                  (local.tee $l5
                    (i64.div_u
                      (local.get $p0)
                      (i64.const 10)))
                  (i64.const 10))))
            (i32.const 48)))
        (local.set $l2
          (i64.gt_u
            (local.get $p0)
            (i64.const 42949672959)))
        (local.set $p0
          (local.get $l5))
        (br_if $L2
          (local.get $l2))))
    (if $I3
      (local.tee $l2
        (i32.wrap_i64
          (local.get $l5)))
      (then
        (loop $L4
          (i32.store8
            (local.tee $p1
              (i32.sub
                (local.get $p1)
                (i32.const 1)))
            (i32.or
              (i32.sub
                (local.get $l2)
                (i32.mul
                  (local.tee $l3
                    (i32.div_u
                      (local.get $l2)
                      (i32.const 10)))
                  (i32.const 10)))
              (i32.const 48)))
          (local.set $l4
            (i32.gt_u
              (local.get $l2)
              (i32.const 9)))
          (local.set $l2
            (local.get $l3))
          (br_if $L4
            (local.get $l4)))))
    (local.get $p1))
  (func $f30 (type $t16) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (param $p4 i32)
    (local $l5 i32)
    (global.set $g0
      (local.tee $l5
        (i32.sub
          (global.get $g0)
          (i32.const 256))))
    (block $B0
      (br_if $B0
        (i32.le_s
          (local.get $p2)
          (local.get $p3)))
      (br_if $B0
        (i32.and
          (local.get $p4)
          (i32.const 73728)))
      (call $f18
        (local.get $l5)
        (i32.and
          (local.get $p1)
          (i32.const 255))
        (select
          (local.tee $p3
            (i32.sub
              (local.get $p2)
              (local.get $p3)))
          (i32.const 256)
          (local.tee $p1
            (i32.lt_u
              (local.get $p3)
              (i32.const 256)))))
      (if $I1
        (i32.eqz
          (local.get $p1))
        (then
          (loop $L2
            (call $f26
              (local.get $p0)
              (local.get $l5)
              (i32.const 256))
            (br_if $L2
              (i32.gt_u
                (local.tee $p3
                  (i32.sub
                    (local.get $p3)
                    (i32.const 256)))
                (i32.const 255))))))
      (call $f26
        (local.get $p0)
        (local.get $l5)
        (local.get $p3)))
    (global.set $g0
      (i32.add
        (local.get $l5)
        (i32.const 256))))
  (func $f31 (type $t8) (param $p0 i32) (param $p1 f64) (param $p2 i32) (param $p3 i32) (param $p4 i32) (param $p5 i32) (result i32)
    (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32) (local $l14 i32) (local $l15 i32) (local $l16 i32) (local $l17 i32) (local $l18 i32) (local $l19 i32) (local $l20 i32) (local $l21 i32) (local $l22 i32) (local $l23 i32) (local $l24 f64) (local $l25 i64) (local $l26 i64)
    (global.set $g0
      (local.tee $l12
        (i32.sub
          (global.get $g0)
          (i32.const 560))))
    (i32.store offset=44
      (local.get $l12)
      (i32.const 0))
    (block $B0
      (if $I1
        (i64.lt_s
          (local.tee $l25
            (i64.reinterpret_f64
              (local.get $p1)))
          (i64.const 0))
        (then
          (local.set $l16
            (i32.const 1))
          (local.set $l19
            (i32.const 1085))
          (local.set $l25
            (i64.reinterpret_f64
              (local.tee $p1
                (f64.neg
                  (local.get $p1)))))
          (br $B0)))
      (if $I2
        (i32.and
          (local.get $p4)
          (i32.const 2048))
        (then
          (local.set $l16
            (i32.const 1))
          (local.set $l19
            (i32.const 1088))
          (br $B0)))
      (local.set $l19
        (select
          (i32.const 1091)
          (i32.const 1086)
          (local.tee $l16
            (i32.and
              (local.get $p4)
              (i32.const 1)))))
      (local.set $l21
        (i32.eqz
          (local.get $l16))))
    (block $B3
      (if $I4
        (i64.eq
          (i64.and
            (local.get $l25)
            (i64.const 9218868437227405312))
          (i64.const 9218868437227405312))
        (then
          (call $f30
            (local.get $p0)
            (i32.const 32)
            (local.get $p2)
            (local.tee $p3
              (i32.add
                (local.get $l16)
                (i32.const 3)))
            (i32.and
              (local.get $p4)
              (i32.const -65537)))
          (call $f26
            (local.get $p0)
            (local.get $l19)
            (local.get $l16))
          (call $f26
            (local.get $p0)
            (select
              (select
                (i32.const 1119)
                (i32.const 1127)
                (local.tee $p5
                  (i32.and
                    (local.get $p5)
                    (i32.const 32))))
              (select
                (i32.const 1123)
                (i32.const 1131)
                (local.get $p5))
              (f64.ne
                (local.get $p1)
                (local.get $p1)))
            (i32.const 3))
          (call $f30
            (local.get $p0)
            (i32.const 32)
            (local.get $p2)
            (local.get $p3)
            (i32.xor
              (local.get $p4)
              (i32.const 8192)))
          (local.set $l9
            (select
              (local.get $p3)
              (local.get $p2)
              (i32.lt_s
                (local.get $p2)
                (local.get $p3))))
          (br $B3)))
      (local.set $l17
        (i32.add
          (local.get $l12)
          (i32.const 16)))
      (block $B5
        (local.set $l11
          (block $B6 (result i32)
            (block $B7
              (if $I8
                (f64.ne
                  (local.tee $p1
                    (f64.add
                      (local.tee $p1
                        (call $f23
                          (local.get $p1)
                          (i32.add
                            (local.get $l12)
                            (i32.const 44))))
                      (local.get $p1)))
                  (f64.const 0x0p+0 (;=0;)))
                (then
                  (i32.store offset=44
                    (local.get $l12)
                    (i32.sub
                      (local.tee $l6
                        (i32.load offset=44
                          (local.get $l12)))
                      (i32.const 1)))
                  (br_if $B7
                    (i32.ne
                      (local.tee $l14
                        (i32.or
                          (local.get $p5)
                          (i32.const 32)))
                      (i32.const 97)))
                  (br $B5)))
              (br_if $B5
                (i32.eq
                  (local.tee $l14
                    (i32.or
                      (local.get $p5)
                      (i32.const 32)))
                  (i32.const 97)))
              (local.set $l10
                (i32.load offset=44
                  (local.get $l12)))
              (br $B6
                (select
                  (i32.const 6)
                  (local.get $p3)
                  (i32.lt_s
                    (local.get $p3)
                    (i32.const 0)))))
            (i32.store offset=44
              (local.get $l12)
              (local.tee $l10
                (i32.sub
                  (local.get $l6)
                  (i32.const 29))))
            (local.set $p1
              (f64.mul
                (local.get $p1)
                (f64.const 0x1p+28 (;=2.68435e+08;))))
            (select
              (i32.const 6)
              (local.get $p3)
              (i32.lt_s
                (local.get $p3)
                (i32.const 0)))))
        (local.set $l7
          (local.tee $l13
            (i32.add
              (i32.add
                (local.get $l12)
                (i32.const 48))
              (select
                (i32.const 288)
                (i32.const 0)
                (i32.ge_s
                  (local.get $l10)
                  (i32.const 0))))))
        (loop $L9
          (i32.store
            (local.get $l7)
            (local.tee $p3
              (block $B10 (result i32)
                (if $I11
                  (i32.and
                    (f64.lt
                      (local.get $p1)
                      (f64.const 0x1p+32 (;=4.29497e+09;)))
                    (f64.ge
                      (local.get $p1)
                      (f64.const 0x0p+0 (;=0;))))
                  (then
                    (br $B10
                      (i32.trunc_f64_u
                        (local.get $p1)))))
                (i32.const 0))))
          (local.set $l7
            (i32.add
              (local.get $l7)
              (i32.const 4)))
          (br_if $L9
            (f64.ne
              (local.tee $p1
                (f64.mul
                  (f64.sub
                    (local.get $p1)
                    (f64.convert_i32_u
                      (local.get $p3)))
                  (f64.const 0x1.dcd65p+29 (;=1e+09;))))
              (f64.const 0x0p+0 (;=0;)))))
        (block $B12
          (if $I13
            (i32.le_s
              (local.get $l10)
              (i32.const 0))
            (then
              (local.set $p3
                (local.get $l10))
              (local.set $l6
                (local.get $l7))
              (local.set $l8
                (local.get $l13))
              (br $B12)))
          (local.set $l8
            (local.get $l13))
          (local.set $p3
            (local.get $l10))
          (loop $L14
            (local.set $p3
              (select
                (i32.const 29)
                (local.get $p3)
                (i32.ge_s
                  (local.get $p3)
                  (i32.const 29))))
            (block $B15
              (br_if $B15
                (i32.lt_u
                  (local.tee $l6
                    (i32.sub
                      (local.get $l7)
                      (i32.const 4)))
                  (local.get $l8)))
              (local.set $l26
                (i64.extend_i32_u
                  (local.get $p3)))
              (local.set $l25
                (i64.const 0))
              (loop $L16
                (i64.store32
                  (local.get $l6)
                  (i64.sub
                    (local.tee $l25
                      (i64.add
                        (i64.and
                          (local.get $l25)
                          (i64.const 4294967295))
                        (i64.shl
                          (i64.load32_u
                            (local.get $l6))
                          (local.get $l26))))
                    (i64.mul
                      (local.tee $l25
                        (i64.div_u
                          (local.get $l25)
                          (i64.const 1000000000)))
                      (i64.const 1000000000))))
                (br_if $L16
                  (i32.ge_u
                    (local.tee $l6
                      (i32.sub
                        (local.get $l6)
                        (i32.const 4)))
                    (local.get $l8))))
              (br_if $B15
                (i32.eqz
                  (local.tee $l6
                    (i32.wrap_i64
                      (local.get $l25)))))
              (i32.store
                (local.tee $l8
                  (i32.sub
                    (local.get $l8)
                    (i32.const 4)))
                (local.get $l6)))
            (loop $L17
              (if $I18
                (i32.lt_u
                  (local.get $l8)
                  (local.tee $l6
                    (local.get $l7)))
                (then
                  (br_if $L17
                    (i32.eqz
                      (i32.load
                        (local.tee $l7
                          (i32.sub
                            (local.get $l6)
                            (i32.const 4)))))))))
            (i32.store offset=44
              (local.get $l12)
              (local.tee $p3
                (i32.sub
                  (i32.load offset=44
                    (local.get $l12))
                  (local.get $p3))))
            (local.set $l7
              (local.get $l6))
            (br_if $L14
              (i32.gt_s
                (local.get $p3)
                (i32.const 0)))))
        (if $I19
          (i32.lt_s
            (local.get $p3)
            (i32.const 0))
          (then
            (local.set $l15
              (i32.add
                (i32.div_u
                  (i32.add
                    (local.get $l11)
                    (i32.const 25))
                  (i32.const 9))
                (i32.const 1)))
            (local.set $l18
              (i32.eq
                (local.get $l14)
                (i32.const 102)))
            (loop $L20
              (local.set $l9
                (select
                  (i32.const 9)
                  (local.tee $p3
                    (i32.sub
                      (i32.const 0)
                      (local.get $p3)))
                  (i32.ge_s
                    (local.get $p3)
                    (i32.const 9))))
              (block $B21
                (if $I22
                  (i32.le_u
                    (local.get $l6)
                    (local.get $l8))
                  (then
                    (local.set $l7
                      (i32.load
                        (local.get $l8)))
                    (br $B21)))
                (local.set $l20
                  (i32.shr_u
                    (i32.const 1000000000)
                    (local.get $l9)))
                (local.set $l22
                  (i32.xor
                    (i32.shl
                      (i32.const -1)
                      (local.get $l9))
                    (i32.const -1)))
                (local.set $p3
                  (i32.const 0))
                (local.set $l7
                  (local.get $l8))
                (loop $L23
                  (i32.store
                    (local.get $l7)
                    (i32.add
                      (local.get $p3)
                      (i32.shr_u
                        (local.tee $l23
                          (i32.load
                            (local.get $l7)))
                        (local.get $l9))))
                  (local.set $p3
                    (i32.mul
                      (i32.and
                        (local.get $l22)
                        (local.get $l23))
                      (local.get $l20)))
                  (br_if $L23
                    (i32.lt_u
                      (local.tee $l7
                        (i32.add
                          (local.get $l7)
                          (i32.const 4)))
                      (local.get $l6))))
                (local.set $l7
                  (i32.load
                    (local.get $l8)))
                (br_if $B21
                  (i32.eqz
                    (local.get $p3)))
                (i32.store
                  (local.get $l6)
                  (local.get $p3))
                (local.set $l6
                  (i32.add
                    (local.get $l6)
                    (i32.const 4))))
              (i32.store offset=44
                (local.get $l12)
                (local.tee $p3
                  (i32.add
                    (i32.load offset=44
                      (local.get $l12))
                    (local.get $l9))))
              (local.set $l6
                (select
                  (i32.add
                    (local.tee $l7
                      (select
                        (local.get $l13)
                        (local.tee $l8
                          (i32.add
                            (local.get $l8)
                            (i32.shl
                              (i32.eqz
                                (local.get $l7))
                              (i32.const 2))))
                        (local.get $l18)))
                    (i32.shl
                      (local.get $l15)
                      (i32.const 2)))
                  (local.get $l6)
                  (i32.gt_s
                    (i32.shr_s
                      (i32.sub
                        (local.get $l6)
                        (local.get $l7))
                      (i32.const 2))
                    (local.get $l15))))
              (br_if $L20
                (i32.lt_s
                  (local.get $p3)
                  (i32.const 0))))))
        (local.set $p3
          (i32.const 0))
        (block $B24
          (br_if $B24
            (i32.le_u
              (local.get $l6)
              (local.get $l8)))
          (local.set $p3
            (i32.mul
              (i32.shr_s
                (i32.sub
                  (local.get $l13)
                  (local.get $l8))
                (i32.const 2))
              (i32.const 9)))
          (local.set $l7
            (i32.const 10))
          (br_if $B24
            (i32.lt_u
              (local.tee $l9
                (i32.load
                  (local.get $l8)))
              (i32.const 10)))
          (loop $L25
            (local.set $p3
              (i32.add
                (local.get $p3)
                (i32.const 1)))
            (br_if $L25
              (i32.ge_u
                (local.get $l9)
                (local.tee $l7
                  (i32.mul
                    (local.get $l7)
                    (i32.const 10)))))))
        (if $I26
          (i32.lt_s
            (local.tee $l7
              (i32.sub
                (i32.sub
                  (local.get $l11)
                  (select
                    (local.get $p3)
                    (i32.const 0)
                    (i32.ne
                      (local.get $l14)
                      (i32.const 102))))
                (i32.and
                  (i32.eq
                    (local.get $l14)
                    (i32.const 103))
                  (i32.ne
                    (local.get $l11)
                    (i32.const 0)))))
            (i32.sub
              (i32.mul
                (i32.shr_s
                  (i32.sub
                    (local.get $l6)
                    (local.get $l13))
                  (i32.const 2))
                (i32.const 9))
              (i32.const 9)))
          (then
            (local.set $l10
              (i32.sub
                (i32.add
                  (i32.add
                    (select
                      (i32.const 4)
                      (i32.const 292)
                      (i32.lt_s
                        (local.get $l10)
                        (i32.const 0)))
                    (local.get $l12))
                  (i32.shl
                    (local.tee $l15
                      (i32.div_s
                        (local.tee $l9
                          (i32.add
                            (local.get $l7)
                            (i32.const 9216)))
                        (i32.const 9)))
                    (i32.const 2)))
                (i32.const 4048)))
            (local.set $l7
              (i32.const 10))
            (if $I27
              (i32.le_s
                (local.tee $l9
                  (i32.sub
                    (local.get $l9)
                    (i32.mul
                      (local.get $l15)
                      (i32.const 9))))
                (i32.const 7))
              (then
                (loop $L28
                  (local.set $l7
                    (i32.mul
                      (local.get $l7)
                      (i32.const 10)))
                  (br_if $L28
                    (i32.ne
                      (local.tee $l9
                        (i32.add
                          (local.get $l9)
                          (i32.const 1)))
                      (i32.const 8))))))
            (block $B29
              (br_if $B29
                (i32.and
                  (i32.eqz
                    (local.tee $l9
                      (i32.sub
                        (local.tee $l18
                          (i32.load
                            (local.get $l10)))
                        (i32.mul
                          (local.tee $l15
                            (i32.div_u
                              (local.get $l18)
                              (local.get $l7)))
                          (local.get $l7)))))
                  (i32.eq
                    (local.tee $l20
                      (i32.add
                        (local.get $l10)
                        (i32.const 4)))
                    (local.get $l6))))
              (block $B30
                (if $I31
                  (i32.eqz
                    (i32.and
                      (local.get $l15)
                      (i32.const 1)))
                  (then
                    (local.set $p1
                      (f64.const 0x1p+53 (;=9.0072e+15;)))
                    (br_if $B30
                      (i32.ne
                        (local.get $l7)
                        (i32.const 1000000000)))
                    (br_if $B30
                      (i32.ge_u
                        (local.get $l8)
                        (local.get $l10)))
                    (br_if $B30
                      (i32.eqz
                        (i32.and
                          (i32.load8_u
                            (i32.sub
                              (local.get $l10)
                              (i32.const 4)))
                          (i32.const 1))))))
                (local.set $p1
                  (f64.const 0x1.0000000000001p+53 (;=9.0072e+15;))))
              (local.set $l24
                (select
                  (f64.const 0x1p-1 (;=0.5;))
                  (select
                    (select
                      (f64.const 0x1p+0 (;=1;))
                      (f64.const 0x1.8p+0 (;=1.5;))
                      (i32.eq
                        (local.get $l6)
                        (local.get $l20)))
                    (f64.const 0x1.8p+0 (;=1.5;))
                    (i32.eq
                      (local.get $l9)
                      (local.tee $l20
                        (i32.shr_u
                          (local.get $l7)
                          (i32.const 1)))))
                  (i32.lt_u
                    (local.get $l9)
                    (local.get $l20))))
              (block $B32
                (br_if $B32
                  (local.get $l21))
                (br_if $B32
                  (i32.ne
                    (i32.load8_u
                      (local.get $l19))
                    (i32.const 45)))
                (local.set $l24
                  (f64.neg
                    (local.get $l24)))
                (local.set $p1
                  (f64.neg
                    (local.get $p1))))
              (i32.store
                (local.get $l10)
                (local.tee $l9
                  (i32.sub
                    (local.get $l18)
                    (local.get $l9))))
              (br_if $B29
                (f64.eq
                  (f64.add
                    (local.get $p1)
                    (local.get $l24))
                  (local.get $p1)))
              (i32.store
                (local.get $l10)
                (local.tee $p3
                  (i32.add
                    (local.get $l7)
                    (local.get $l9))))
              (if $I33
                (i32.ge_u
                  (local.get $p3)
                  (i32.const 1000000000))
                (then
                  (loop $L34
                    (i32.store
                      (local.get $l10)
                      (i32.const 0))
                    (if $I35
                      (i32.gt_u
                        (local.get $l8)
                        (local.tee $l10
                          (i32.sub
                            (local.get $l10)
                            (i32.const 4))))
                      (then
                        (i32.store
                          (local.tee $l8
                            (i32.sub
                              (local.get $l8)
                              (i32.const 4)))
                          (i32.const 0))))
                    (i32.store
                      (local.get $l10)
                      (local.tee $p3
                        (i32.add
                          (i32.load
                            (local.get $l10))
                          (i32.const 1))))
                    (br_if $L34
                      (i32.gt_u
                        (local.get $p3)
                        (i32.const 999999999))))))
              (local.set $p3
                (i32.mul
                  (i32.shr_s
                    (i32.sub
                      (local.get $l13)
                      (local.get $l8))
                    (i32.const 2))
                  (i32.const 9)))
              (local.set $l7
                (i32.const 10))
              (br_if $B29
                (i32.lt_u
                  (local.tee $l9
                    (i32.load
                      (local.get $l8)))
                  (i32.const 10)))
              (loop $L36
                (local.set $p3
                  (i32.add
                    (local.get $p3)
                    (i32.const 1)))
                (br_if $L36
                  (i32.ge_u
                    (local.get $l9)
                    (local.tee $l7
                      (i32.mul
                        (local.get $l7)
                        (i32.const 10)))))))
            (local.set $l6
              (select
                (local.tee $l7
                  (i32.add
                    (local.get $l10)
                    (i32.const 4)))
                (local.get $l6)
                (i32.gt_u
                  (local.get $l6)
                  (local.get $l7))))))
        (loop $L37
          (if $I38
            (i32.eqz
              (local.tee $l9
                (i32.le_u
                  (local.tee $l7
                    (local.get $l6))
                  (local.get $l8))))
            (then
              (br_if $L37
                (i32.eqz
                  (i32.load
                    (local.tee $l6
                      (i32.sub
                        (local.get $l7)
                        (i32.const 4)))))))))
        (block $B39
          (if $I40
            (i32.ne
              (local.get $l14)
              (i32.const 103))
            (then
              (local.set $l10
                (i32.and
                  (local.get $p4)
                  (i32.const 8)))
              (br $B39)))
          (local.set $l11
            (i32.add
              (select
                (i32.xor
                  (local.get $p3)
                  (i32.const -1))
                (i32.const -1)
                (local.tee $l10
                  (i32.and
                    (i32.gt_s
                      (local.tee $l6
                        (select
                          (local.get $l11)
                          (i32.const 1)
                          (local.get $l11)))
                      (local.get $p3))
                    (i32.gt_s
                      (local.get $p3)
                      (i32.const -5)))))
              (local.get $l6)))
          (local.set $p5
            (i32.add
              (select
                (i32.const -1)
                (i32.const -2)
                (local.get $l10))
              (local.get $p5)))
          (br_if $B39
            (local.tee $l10
              (i32.and
                (local.get $p4)
                (i32.const 8))))
          (local.set $l6
            (i32.const -9))
          (block $B41
            (br_if $B41
              (local.get $l9))
            (br_if $B41
              (i32.eqz
                (local.tee $l14
                  (i32.load
                    (i32.sub
                      (local.get $l7)
                      (i32.const 4))))))
            (local.set $l9
              (i32.const 10))
            (local.set $l6
              (i32.const 0))
            (br_if $B41
              (i32.rem_u
                (local.get $l14)
                (i32.const 10)))
            (loop $L42
              (local.set $l6
                (i32.add
                  (local.tee $l10
                    (local.get $l6))
                  (i32.const 1)))
              (br_if $L42
                (i32.eqz
                  (i32.rem_u
                    (local.get $l14)
                    (local.tee $l9
                      (i32.mul
                        (local.get $l9)
                        (i32.const 10)))))))
            (local.set $l6
              (i32.xor
                (local.get $l10)
                (i32.const -1))))
          (local.set $l9
            (i32.mul
              (i32.shr_s
                (i32.sub
                  (local.get $l7)
                  (local.get $l13))
                (i32.const 2))
              (i32.const 9)))
          (if $I43
            (i32.eq
              (i32.and
                (local.get $p5)
                (i32.const -33))
              (i32.const 70))
            (then
              (local.set $l10
                (i32.const 0))
              (local.set $l11
                (select
                  (local.get $l11)
                  (local.tee $l6
                    (select
                      (local.tee $l6
                        (i32.sub
                          (i32.add
                            (local.get $l6)
                            (local.get $l9))
                          (i32.const 9)))
                      (i32.const 0)
                      (i32.gt_s
                        (local.get $l6)
                        (i32.const 0))))
                  (i32.gt_s
                    (local.get $l6)
                    (local.get $l11))))
              (br $B39)))
          (local.set $l10
            (i32.const 0))
          (local.set $l11
            (select
              (local.get $l11)
              (local.tee $l6
                (select
                  (local.tee $l6
                    (i32.sub
                      (i32.add
                        (i32.add
                          (local.get $p3)
                          (local.get $l9))
                        (local.get $l6))
                      (i32.const 9)))
                  (i32.const 0)
                  (i32.gt_s
                    (local.get $l6)
                    (i32.const 0))))
              (i32.gt_s
                (local.get $l6)
                (local.get $l11)))))
        (local.set $l9
          (i32.const -1))
        (br_if $B3
          (i32.gt_s
            (local.get $l11)
            (select
              (i32.const 2147483645)
              (i32.const 2147483646)
              (local.tee $l18
                (i32.or
                  (local.get $l10)
                  (local.get $l11))))))
        (local.set $l14
          (i32.add
            (i32.add
              (local.get $l11)
              (i32.ne
                (local.get $l18)
                (i32.const 0)))
            (i32.const 1)))
        (block $B44
          (if $I45
            (i32.eq
              (local.tee $l21
                (i32.and
                  (local.get $p5)
                  (i32.const -33)))
              (i32.const 70))
            (then
              (br_if $B3
                (i32.gt_s
                  (local.get $p3)
                  (i32.xor
                    (local.get $l14)
                    (i32.const 2147483647))))
              (local.set $l6
                (select
                  (local.get $p3)
                  (i32.const 0)
                  (i32.gt_s
                    (local.get $p3)
                    (i32.const 0))))
              (br $B44)))
          (if $I46
            (i32.le_s
              (i32.sub
                (local.get $l17)
                (local.tee $l6
                  (call $f29
                    (i64.extend_i32_u
                      (i32.sub
                        (i32.xor
                          (local.get $p3)
                          (local.tee $l6
                            (i32.shr_s
                              (local.get $p3)
                              (i32.const 31))))
                        (local.get $l6)))
                    (local.get $l17))))
              (i32.const 1))
            (then
              (loop $L47
                (i32.store8
                  (local.tee $l6
                    (i32.sub
                      (local.get $l6)
                      (i32.const 1)))
                  (i32.const 48))
                (br_if $L47
                  (i32.lt_s
                    (i32.sub
                      (local.get $l17)
                      (local.get $l6))
                    (i32.const 2))))))
          (i32.store8
            (local.tee $l15
              (i32.sub
                (local.get $l6)
                (i32.const 2)))
            (local.get $p5))
          (i32.store8
            (i32.sub
              (local.get $l6)
              (i32.const 1))
            (select
              (i32.const 45)
              (i32.const 43)
              (i32.lt_s
                (local.get $p3)
                (i32.const 0))))
          (br_if $B3
            (i32.gt_s
              (local.tee $l6
                (i32.sub
                  (local.get $l17)
                  (local.get $l15)))
              (i32.xor
                (local.get $l14)
                (i32.const 2147483647)))))
        (br_if $B3
          (i32.gt_s
            (local.tee $p3
              (i32.add
                (local.get $l6)
                (local.get $l14)))
            (i32.xor
              (local.get $l16)
              (i32.const 2147483647))))
        (call $f30
          (local.get $p0)
          (i32.const 32)
          (local.get $p2)
          (local.tee $p5
            (i32.add
              (local.get $p3)
              (local.get $l16)))
          (local.get $p4))
        (call $f26
          (local.get $p0)
          (local.get $l19)
          (local.get $l16))
        (call $f30
          (local.get $p0)
          (i32.const 48)
          (local.get $p2)
          (local.get $p5)
          (i32.xor
            (local.get $p4)
            (i32.const 65536)))
        (block $B48
          (block $B49
            (block $B50
              (if $I51
                (i32.eq
                  (local.get $l21)
                  (i32.const 70))
                (then
                  (local.set $p3
                    (i32.or
                      (local.tee $l6
                        (i32.add
                          (local.get $l12)
                          (i32.const 16)))
                      (i32.const 8)))
                  (local.set $l10
                    (i32.or
                      (local.get $l6)
                      (i32.const 9)))
                  (local.set $l8
                    (local.tee $l9
                      (select
                        (local.get $l13)
                        (local.get $l8)
                        (i32.gt_u
                          (local.get $l8)
                          (local.get $l13)))))
                  (loop $L52
                    (local.set $l6
                      (call $f29
                        (i64.load32_u
                          (local.get $l8))
                        (local.get $l10)))
                    (block $B53
                      (if $I54
                        (i32.ne
                          (local.get $l8)
                          (local.get $l9))
                        (then
                          (br_if $B53
                            (i32.le_u
                              (local.get $l6)
                              (i32.add
                                (local.get $l12)
                                (i32.const 16))))
                          (loop $L55
                            (i32.store8
                              (local.tee $l6
                                (i32.sub
                                  (local.get $l6)
                                  (i32.const 1)))
                              (i32.const 48))
                            (br_if $L55
                              (i32.gt_u
                                (local.get $l6)
                                (i32.add
                                  (local.get $l12)
                                  (i32.const 16)))))
                          (br $B53)))
                      (br_if $B53
                        (i32.ne
                          (local.get $l6)
                          (local.get $l10)))
                      (i32.store8 offset=24
                        (local.get $l12)
                        (i32.const 48))
                      (local.set $l6
                        (local.get $p3)))
                    (call $f26
                      (local.get $p0)
                      (local.get $l6)
                      (i32.sub
                        (local.get $l10)
                        (local.get $l6)))
                    (br_if $L52
                      (i32.le_u
                        (local.tee $l8
                          (i32.add
                            (local.get $l8)
                            (i32.const 4)))
                        (local.get $l13))))
                  (if $I56
                    (local.get $l18)
                    (then
                      (call $f26
                        (local.get $p0)
                        (i32.const 1137)
                        (i32.const 1))))
                  (br_if $B50
                    (i32.le_u
                      (local.get $l7)
                      (local.get $l8)))
                  (br_if $B50
                    (i32.le_s
                      (local.get $l11)
                      (i32.const 0)))
                  (loop $L57
                    (if $I58
                      (i32.gt_u
                        (local.tee $l6
                          (call $f29
                            (i64.load32_u
                              (local.get $l8))
                            (local.get $l10)))
                        (i32.add
                          (local.get $l12)
                          (i32.const 16)))
                      (then
                        (loop $L59
                          (i32.store8
                            (local.tee $l6
                              (i32.sub
                                (local.get $l6)
                                (i32.const 1)))
                            (i32.const 48))
                          (br_if $L59
                            (i32.gt_u
                              (local.get $l6)
                              (i32.add
                                (local.get $l12)
                                (i32.const 16)))))))
                    (call $f26
                      (local.get $p0)
                      (local.get $l6)
                      (select
                        (i32.const 9)
                        (local.get $l11)
                        (i32.ge_s
                          (local.get $l11)
                          (i32.const 9))))
                    (local.set $l6
                      (i32.sub
                        (local.get $l11)
                        (i32.const 9)))
                    (br_if $B49
                      (i32.ge_u
                        (local.tee $l8
                          (i32.add
                            (local.get $l8)
                            (i32.const 4)))
                        (local.get $l7)))
                    (local.set $p3
                      (i32.gt_s
                        (local.get $l11)
                        (i32.const 9)))
                    (local.set $l11
                      (local.get $l6))
                    (br_if $L57
                      (local.get $p3)))
                  (br $B49)))
              (block $B60
                (br_if $B60
                  (i32.lt_s
                    (local.get $l11)
                    (i32.const 0)))
                (local.set $l9
                  (select
                    (local.get $l7)
                    (i32.add
                      (local.get $l8)
                      (i32.const 4))
                    (i32.gt_u
                      (local.get $l7)
                      (local.get $l8))))
                (local.set $p3
                  (i32.or
                    (local.tee $l6
                      (i32.add
                        (local.get $l12)
                        (i32.const 16)))
                    (i32.const 8)))
                (local.set $l13
                  (i32.or
                    (local.get $l6)
                    (i32.const 9)))
                (local.set $l7
                  (local.get $l8))
                (loop $L61
                  (if $I62
                    (i32.eq
                      (local.get $l13)
                      (local.tee $l6
                        (call $f29
                          (i64.load32_u
                            (local.get $l7))
                          (local.get $l13))))
                    (then
                      (i32.store8 offset=24
                        (local.get $l12)
                        (i32.const 48))
                      (local.set $l6
                        (local.get $p3))))
                  (block $B63
                    (if $I64
                      (i32.ne
                        (local.get $l7)
                        (local.get $l8))
                      (then
                        (br_if $B63
                          (i32.le_u
                            (local.get $l6)
                            (i32.add
                              (local.get $l12)
                              (i32.const 16))))
                        (loop $L65
                          (i32.store8
                            (local.tee $l6
                              (i32.sub
                                (local.get $l6)
                                (i32.const 1)))
                            (i32.const 48))
                          (br_if $L65
                            (i32.gt_u
                              (local.get $l6)
                              (i32.add
                                (local.get $l12)
                                (i32.const 16)))))
                        (br $B63)))
                    (call $f26
                      (local.get $p0)
                      (local.get $l6)
                      (i32.const 1))
                    (local.set $l6
                      (i32.add
                        (local.get $l6)
                        (i32.const 1)))
                    (br_if $B63
                      (i32.eqz
                        (i32.or
                          (local.get $l10)
                          (local.get $l11))))
                    (call $f26
                      (local.get $p0)
                      (i32.const 1137)
                      (i32.const 1)))
                  (call $f26
                    (local.get $p0)
                    (local.get $l6)
                    (select
                      (local.tee $l6
                        (i32.sub
                          (local.get $l13)
                          (local.get $l6)))
                      (local.get $l11)
                      (i32.lt_s
                        (local.get $l6)
                        (local.get $l11))))
                  (local.set $l11
                    (i32.sub
                      (local.get $l11)
                      (local.get $l6)))
                  (br_if $B60
                    (i32.ge_u
                      (local.tee $l7
                        (i32.add
                          (local.get $l7)
                          (i32.const 4)))
                      (local.get $l9)))
                  (br_if $L61
                    (i32.ge_s
                      (local.get $l11)
                      (i32.const 0)))))
              (call $f30
                (local.get $p0)
                (i32.const 48)
                (i32.add
                  (local.get $l11)
                  (i32.const 18))
                (i32.const 18)
                (i32.const 0))
              (call $f26
                (local.get $p0)
                (local.get $l15)
                (i32.sub
                  (local.get $l17)
                  (local.get $l15)))
              (br $B48))
            (local.set $l6
              (local.get $l11)))
          (call $f30
            (local.get $p0)
            (i32.const 48)
            (i32.add
              (local.get $l6)
              (i32.const 9))
            (i32.const 9)
            (i32.const 0)))
        (call $f30
          (local.get $p0)
          (i32.const 32)
          (local.get $p2)
          (local.get $p5)
          (i32.xor
            (local.get $p4)
            (i32.const 8192)))
        (local.set $l9
          (select
            (local.get $p5)
            (local.get $p2)
            (i32.lt_s
              (local.get $p2)
              (local.get $p5))))
        (br $B3))
      (local.set $l8
        (i32.add
          (local.get $l19)
          (i32.and
            (i32.shr_s
              (i32.shl
                (local.get $p5)
                (i32.const 26))
              (i32.const 31))
            (i32.const 9))))
      (block $B66
        (br_if $B66
          (i32.gt_u
            (local.get $p3)
            (i32.const 11)))
        (local.set $l6
          (i32.sub
            (i32.const 12)
            (local.get $p3)))
        (local.set $l24
          (f64.const 0x1p+4 (;=16;)))
        (loop $L67
          (local.set $l24
            (f64.mul
              (local.get $l24)
              (f64.const 0x1p+4 (;=16;))))
          (br_if $L67
            (local.tee $l6
              (i32.sub
                (local.get $l6)
                (i32.const 1)))))
        (if $I68
          (i32.eq
            (i32.load8_u
              (local.get $l8))
            (i32.const 45))
          (then
            (local.set $p1
              (f64.neg
                (f64.add
                  (local.get $l24)
                  (f64.sub
                    (f64.neg
                      (local.get $p1))
                    (local.get $l24)))))
            (br $B66)))
        (local.set $p1
          (f64.sub
            (f64.add
              (local.get $p1)
              (local.get $l24))
            (local.get $l24))))
      (if $I69
        (i32.eq
          (local.get $l17)
          (local.tee $l6
            (call $f29
              (i64.extend_i32_u
                (i32.sub
                  (i32.xor
                    (local.tee $l6
                      (i32.load offset=44
                        (local.get $l12)))
                    (local.tee $l6
                      (i32.shr_s
                        (local.get $l6)
                        (i32.const 31))))
                  (local.get $l6)))
              (local.get $l17))))
        (then
          (i32.store8 offset=15
            (local.get $l12)
            (i32.const 48))
          (local.set $l6
            (i32.add
              (local.get $l12)
              (i32.const 15)))))
      (local.set $l11
        (i32.or
          (local.get $l16)
          (i32.const 2)))
      (local.set $l13
        (i32.and
          (local.get $p5)
          (i32.const 32)))
      (local.set $l7
        (i32.load offset=44
          (local.get $l12)))
      (i32.store8
        (local.tee $l10
          (i32.sub
            (local.get $l6)
            (i32.const 2)))
        (i32.add
          (local.get $p5)
          (i32.const 15)))
      (i32.store8
        (i32.sub
          (local.get $l6)
          (i32.const 1))
        (select
          (i32.const 45)
          (i32.const 43)
          (i32.lt_s
            (local.get $l7)
            (i32.const 0))))
      (local.set $l6
        (i32.and
          (local.get $p4)
          (i32.const 8)))
      (local.set $l7
        (i32.add
          (local.get $l12)
          (i32.const 16)))
      (loop $L70
        (i32.store8
          (local.tee $p5
            (local.get $l7))
          (i32.or
            (i32.load8_u
              (i32.add
                (local.tee $l7
                  (block $B71 (result i32)
                    (if $I72
                      (f64.lt
                        (f64.abs
                          (local.get $p1))
                        (f64.const 0x1p+31 (;=2.14748e+09;)))
                      (then
                        (br $B71
                          (i32.trunc_f64_s
                            (local.get $p1)))))
                    (i32.const -2147483648)))
                (i32.const 1696)))
            (local.get $l13)))
        (local.set $p1
          (f64.mul
            (f64.sub
              (local.get $p1)
              (f64.convert_i32_s
                (local.get $l7)))
            (f64.const 0x1p+4 (;=16;))))
        (block $B73
          (br_if $B73
            (i32.ne
              (i32.sub
                (local.tee $l7
                  (i32.add
                    (local.get $p5)
                    (i32.const 1)))
                (i32.add
                  (local.get $l12)
                  (i32.const 16)))
              (i32.const 1)))
          (block $B74
            (br_if $B74
              (local.get $l6))
            (br_if $B74
              (i32.gt_s
                (local.get $p3)
                (i32.const 0)))
            (br_if $B73
              (f64.eq
                (local.get $p1)
                (f64.const 0x0p+0 (;=0;)))))
          (i32.store8 offset=1
            (local.get $p5)
            (i32.const 46))
          (local.set $l7
            (i32.add
              (local.get $p5)
              (i32.const 2))))
        (br_if $L70
          (f64.ne
            (local.get $p1)
            (f64.const 0x0p+0 (;=0;)))))
      (local.set $l9
        (i32.const -1))
      (br_if $B3
        (i32.lt_s
          (i32.sub
            (i32.const 2147483645)
            (local.tee $l13
              (i32.add
                (local.get $l11)
                (local.tee $l6
                  (i32.sub
                    (local.get $l17)
                    (local.get $l10))))))
          (local.get $p3)))
      (call $f30
        (local.get $p0)
        (i32.const 32)
        (local.get $p2)
        (local.tee $p3
          (i32.add
            (local.get $l13)
            (local.tee $l9
              (select
                (select
                  (i32.add
                    (local.get $p3)
                    (i32.const 2))
                  (local.tee $p5
                    (i32.sub
                      (local.get $l7)
                      (local.tee $l7
                        (i32.add
                          (local.get $l12)
                          (i32.const 16)))))
                  (i32.lt_s
                    (i32.sub
                      (local.get $p5)
                      (i32.const 2))
                    (local.get $p3)))
                (local.get $p5)
                (local.get $p3)))))
        (local.get $p4))
      (call $f26
        (local.get $p0)
        (local.get $l8)
        (local.get $l11))
      (call $f30
        (local.get $p0)
        (i32.const 48)
        (local.get $p2)
        (local.get $p3)
        (i32.xor
          (local.get $p4)
          (i32.const 65536)))
      (call $f26
        (local.get $p0)
        (local.get $l7)
        (local.get $p5))
      (call $f30
        (local.get $p0)
        (i32.const 48)
        (i32.sub
          (local.get $l9)
          (local.get $p5))
        (i32.const 0)
        (i32.const 0))
      (call $f26
        (local.get $p0)
        (local.get $l10)
        (local.get $l6))
      (call $f30
        (local.get $p0)
        (i32.const 32)
        (local.get $p2)
        (local.get $p3)
        (i32.xor
          (local.get $p4)
          (i32.const 8192)))
      (local.set $l9
        (select
          (local.get $p3)
          (local.get $p2)
          (i32.lt_s
            (local.get $p2)
            (local.get $p3)))))
    (global.set $g0
      (i32.add
        (local.get $l12)
        (i32.const 560)))
    (local.get $l9))
  (func $f32 (type $t4) (param $p0 i32) (param $p1 i32) (result i32)
    (if $I0
      (i32.eqz
        (local.get $p0))
      (then
        (return
          (i32.const 0))))
    (block $B1 (result i32)
      (block $B2
        (br $B1
          (if $I3 (result i32)
            (local.get $p0)
            (then
              (br_if $B2
                (i32.le_u
                  (local.get $p1)
                  (i32.const 127)))
              (block $B4
                (if $I5
                  (i32.eqz
                    (i32.load
                      (i32.load
                        (i32.const 2184))))
                  (then
                    (br_if $B2
                      (i32.eq
                        (i32.and
                          (local.get $p1)
                          (i32.const -128))
                        (i32.const 57216)))
                    (br $B4)))
                (if $I6
                  (i32.le_u
                    (local.get $p1)
                    (i32.const 2047))
                  (then
                    (i32.store8 offset=1
                      (local.get $p0)
                      (i32.or
                        (i32.and
                          (local.get $p1)
                          (i32.const 63))
                        (i32.const 128)))
                    (i32.store8
                      (local.get $p0)
                      (i32.or
                        (i32.shr_u
                          (local.get $p1)
                          (i32.const 6))
                        (i32.const 192)))
                    (br $B1
                      (i32.const 2))))
                (if $I7
                  (i32.eqz
                    (i32.and
                      (i32.ne
                        (i32.and
                          (local.get $p1)
                          (i32.const -8192))
                        (i32.const 57344))
                      (i32.ge_u
                        (local.get $p1)
                        (i32.const 55296))))
                  (then
                    (i32.store8 offset=2
                      (local.get $p0)
                      (i32.or
                        (i32.and
                          (local.get $p1)
                          (i32.const 63))
                        (i32.const 128)))
                    (i32.store8
                      (local.get $p0)
                      (i32.or
                        (i32.shr_u
                          (local.get $p1)
                          (i32.const 12))
                        (i32.const 224)))
                    (i32.store8 offset=1
                      (local.get $p0)
                      (i32.or
                        (i32.and
                          (i32.shr_u
                            (local.get $p1)
                            (i32.const 6))
                          (i32.const 63))
                        (i32.const 128)))
                    (br $B1
                      (i32.const 3))))
                (if $I8
                  (i32.le_u
                    (i32.sub
                      (local.get $p1)
                      (i32.const 65536))
                    (i32.const 1048575))
                  (then
                    (i32.store8 offset=3
                      (local.get $p0)
                      (i32.or
                        (i32.and
                          (local.get $p1)
                          (i32.const 63))
                        (i32.const 128)))
                    (i32.store8
                      (local.get $p0)
                      (i32.or
                        (i32.shr_u
                          (local.get $p1)
                          (i32.const 18))
                        (i32.const 240)))
                    (i32.store8 offset=2
                      (local.get $p0)
                      (i32.or
                        (i32.and
                          (i32.shr_u
                            (local.get $p1)
                            (i32.const 6))
                          (i32.const 63))
                        (i32.const 128)))
                    (i32.store8 offset=1
                      (local.get $p0)
                      (i32.or
                        (i32.and
                          (i32.shr_u
                            (local.get $p1)
                            (i32.const 12))
                          (i32.const 63))
                        (i32.const 128)))
                    (br $B1
                      (i32.const 4)))))
              (i32.store
                (i32.const 2016)
                (i32.const 25))
              (i32.const -1))
            (else
              (i32.const 1)))))
      (i32.store8
        (local.get $p0)
        (local.get $p1))
      (i32.const 1)))
  (func $f33 (type $t0) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32)
    (local.set $p0
      (i32.add
        (local.tee $l1
          (i32.load
            (i32.const 2012)))
        (local.tee $l2
          (i32.and
            (i32.add
              (local.get $p0)
              (i32.const 7))
            (i32.const -8)))))
    (block $B0
      (br_if $B0
        (select
          (local.get $l2)
          (i32.const 0)
          (i32.le_u
            (local.get $p0)
            (local.get $l1))))
      (br_if $B0
        (i32.lt_u
          (i32.shl
            (memory.size)
            (i32.const 16))
          (local.get $p0)))
      (i32.store
        (i32.const 2012)
        (local.get $p0))
      (return
        (local.get $l1)))
    (i32.store
      (i32.const 2016)
      (i32.const 48))
    (i32.const -1))
  (func $f34 (type $t2) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.get $p0)))
      (local.set $l5
        (i32.add
          (local.tee $l2
            (i32.sub
              (local.get $p0)
              (i32.const 8)))
          (local.tee $p0
            (i32.and
              (local.tee $l1
                (i32.load
                  (i32.sub
                    (local.get $p0)
                    (i32.const 4))))
              (i32.const -8)))))
      (block $B1
        (br_if $B1
          (i32.and
            (local.get $l1)
            (i32.const 1)))
        (br_if $B0
          (i32.eqz
            (i32.and
              (local.get $l1)
              (i32.const 3))))
        (br_if $B0
          (i32.lt_u
            (local.tee $l2
              (i32.sub
                (local.get $l2)
                (local.tee $l1
                  (i32.load
                    (local.get $l2)))))
            (i32.load
              (i32.const 3288))))
        (local.set $p0
          (i32.add
            (local.get $p0)
            (local.get $l1)))
        (block $B2
          (block $B3
            (if $I4
              (i32.ne
                (i32.load
                  (i32.const 3292))
                (local.get $l2))
              (then
                (if $I5
                  (i32.le_u
                    (local.get $l1)
                    (i32.const 255))
                  (then
                    (local.set $l4
                      (i32.shr_u
                        (local.get $l1)
                        (i32.const 3)))
                    (if $I6
                      (i32.eq
                        (local.tee $l1
                          (i32.load offset=12
                            (local.get $l2)))
                        (local.tee $l3
                          (i32.load offset=8
                            (local.get $l2))))
                      (then
                        (i32.store
                          (i32.const 3272)
                          (i32.and
                            (i32.load
                              (i32.const 3272))
                            (i32.rotl
                              (i32.const -2)
                              (local.get $l4))))
                        (br $B1)))
                    (i32.store offset=12
                      (local.get $l3)
                      (local.get $l1))
                    (i32.store offset=8
                      (local.get $l1)
                      (local.get $l3))
                    (br $B1)))
                (local.set $l6
                  (i32.load offset=24
                    (local.get $l2)))
                (if $I7
                  (i32.ne
                    (local.get $l2)
                    (local.tee $l1
                      (i32.load offset=12
                        (local.get $l2))))
                  (then
                    (i32.store offset=12
                      (local.tee $l3
                        (i32.load offset=8
                          (local.get $l2)))
                      (local.get $l1))
                    (i32.store offset=8
                      (local.get $l1)
                      (local.get $l3))
                    (br $B2)))
                (if $I8
                  (i32.eqz
                    (local.tee $l3
                      (i32.load
                        (local.tee $l4
                          (i32.add
                            (local.get $l2)
                            (i32.const 20))))))
                  (then
                    (br_if $B3
                      (i32.eqz
                        (local.tee $l3
                          (i32.load offset=16
                            (local.get $l2)))))
                    (local.set $l4
                      (i32.add
                        (local.get $l2)
                        (i32.const 16)))))
                (loop $L9
                  (local.set $l7
                    (local.get $l4))
                  (br_if $L9
                    (local.tee $l3
                      (i32.load
                        (local.tee $l4
                          (i32.add
                            (local.tee $l1
                              (local.get $l3))
                            (i32.const 20))))))
                  (local.set $l4
                    (i32.add
                      (local.get $l1)
                      (i32.const 16)))
                  (br_if $L9
                    (local.tee $l3
                      (i32.load offset=16
                        (local.get $l1)))))
                (i32.store
                  (local.get $l7)
                  (i32.const 0))
                (br $B2)))
            (br_if $B1
              (i32.ne
                (i32.and
                  (local.tee $l1
                    (i32.load offset=4
                      (local.get $l5)))
                  (i32.const 3))
                (i32.const 3)))
            (i32.store
              (i32.const 3280)
              (local.get $p0))
            (i32.store offset=4
              (local.get $l5)
              (i32.and
                (local.get $l1)
                (i32.const -2)))
            (i32.store offset=4
              (local.get $l2)
              (i32.or
                (local.get $p0)
                (i32.const 1)))
            (i32.store
              (local.get $l5)
              (local.get $p0))
            (return))
          (local.set $l1
            (i32.const 0)))
        (br_if $B1
          (i32.eqz
            (local.get $l6)))
        (block $B10
          (if $I11
            (i32.eq
              (i32.load
                (local.tee $l4
                  (i32.add
                    (i32.shl
                      (local.tee $l3
                        (i32.load offset=28
                          (local.get $l2)))
                      (i32.const 2))
                    (i32.const 3576))))
              (local.get $l2))
            (then
              (i32.store
                (local.get $l4)
                (local.get $l1))
              (br_if $B10
                (local.get $l1))
              (i32.store
                (i32.const 3276)
                (i32.and
                  (i32.load
                    (i32.const 3276))
                  (i32.rotl
                    (i32.const -2)
                    (local.get $l3))))
              (br $B1)))
          (i32.store
            (i32.add
              (local.get $l6)
              (select
                (i32.const 16)
                (i32.const 20)
                (i32.eq
                  (i32.load offset=16
                    (local.get $l6))
                  (local.get $l2))))
            (local.get $l1))
          (br_if $B1
            (i32.eqz
              (local.get $l1))))
        (i32.store offset=24
          (local.get $l1)
          (local.get $l6))
        (if $I12
          (local.tee $l3
            (i32.load offset=16
              (local.get $l2)))
          (then
            (i32.store offset=16
              (local.get $l1)
              (local.get $l3))
            (i32.store offset=24
              (local.get $l3)
              (local.get $l1))))
        (br_if $B1
          (i32.eqz
            (local.tee $l3
              (i32.load offset=20
                (local.get $l2)))))
        (i32.store offset=20
          (local.get $l1)
          (local.get $l3))
        (i32.store offset=24
          (local.get $l3)
          (local.get $l1)))
      (br_if $B0
        (i32.ge_u
          (local.get $l2)
          (local.get $l5)))
      (br_if $B0
        (i32.eqz
          (i32.and
            (local.tee $l1
              (i32.load offset=4
                (local.get $l5)))
            (i32.const 1))))
      (block $B13
        (block $B14
          (block $B15
            (block $B16
              (if $I17
                (i32.eqz
                  (i32.and
                    (local.get $l1)
                    (i32.const 2)))
                (then
                  (if $I18
                    (i32.eq
                      (i32.load
                        (i32.const 3296))
                      (local.get $l5))
                    (then
                      (i32.store
                        (i32.const 3296)
                        (local.get $l2))
                      (i32.store
                        (i32.const 3284)
                        (local.tee $p0
                          (i32.add
                            (i32.load
                              (i32.const 3284))
                            (local.get $p0))))
                      (i32.store offset=4
                        (local.get $l2)
                        (i32.or
                          (local.get $p0)
                          (i32.const 1)))
                      (br_if $B0
                        (i32.ne
                          (local.get $l2)
                          (i32.load
                            (i32.const 3292))))
                      (i32.store
                        (i32.const 3280)
                        (i32.const 0))
                      (i32.store
                        (i32.const 3292)
                        (i32.const 0))
                      (return)))
                  (if $I19
                    (i32.eq
                      (i32.load
                        (i32.const 3292))
                      (local.get $l5))
                    (then
                      (i32.store
                        (i32.const 3292)
                        (local.get $l2))
                      (i32.store
                        (i32.const 3280)
                        (local.tee $p0
                          (i32.add
                            (i32.load
                              (i32.const 3280))
                            (local.get $p0))))
                      (i32.store offset=4
                        (local.get $l2)
                        (i32.or
                          (local.get $p0)
                          (i32.const 1)))
                      (i32.store
                        (i32.add
                          (local.get $p0)
                          (local.get $l2))
                        (local.get $p0))
                      (return)))
                  (local.set $p0
                    (i32.add
                      (i32.and
                        (local.get $l1)
                        (i32.const -8))
                      (local.get $p0)))
                  (if $I20
                    (i32.le_u
                      (local.get $l1)
                      (i32.const 255))
                    (then
                      (local.set $l4
                        (i32.shr_u
                          (local.get $l1)
                          (i32.const 3)))
                      (if $I21
                        (i32.eq
                          (local.tee $l1
                            (i32.load offset=12
                              (local.get $l5)))
                          (local.tee $l3
                            (i32.load offset=8
                              (local.get $l5))))
                        (then
                          (i32.store
                            (i32.const 3272)
                            (i32.and
                              (i32.load
                                (i32.const 3272))
                              (i32.rotl
                                (i32.const -2)
                                (local.get $l4))))
                          (br $B14)))
                      (i32.store offset=12
                        (local.get $l3)
                        (local.get $l1))
                      (i32.store offset=8
                        (local.get $l1)
                        (local.get $l3))
                      (br $B14)))
                  (local.set $l6
                    (i32.load offset=24
                      (local.get $l5)))
                  (if $I22
                    (i32.ne
                      (local.get $l5)
                      (local.tee $l1
                        (i32.load offset=12
                          (local.get $l5))))
                    (then
                      (drop
                        (i32.load
                          (i32.const 3288)))
                      (i32.store offset=12
                        (local.tee $l3
                          (i32.load offset=8
                            (local.get $l5)))
                        (local.get $l1))
                      (i32.store offset=8
                        (local.get $l1)
                        (local.get $l3))
                      (br $B15)))
                  (if $I23
                    (i32.eqz
                      (local.tee $l3
                        (i32.load
                          (local.tee $l4
                            (i32.add
                              (local.get $l5)
                              (i32.const 20))))))
                    (then
                      (br_if $B16
                        (i32.eqz
                          (local.tee $l3
                            (i32.load offset=16
                              (local.get $l5)))))
                      (local.set $l4
                        (i32.add
                          (local.get $l5)
                          (i32.const 16)))))
                  (loop $L24
                    (local.set $l7
                      (local.get $l4))
                    (br_if $L24
                      (local.tee $l3
                        (i32.load
                          (local.tee $l4
                            (i32.add
                              (local.tee $l1
                                (local.get $l3))
                              (i32.const 20))))))
                    (local.set $l4
                      (i32.add
                        (local.get $l1)
                        (i32.const 16)))
                    (br_if $L24
                      (local.tee $l3
                        (i32.load offset=16
                          (local.get $l1)))))
                  (i32.store
                    (local.get $l7)
                    (i32.const 0))
                  (br $B15)))
              (i32.store offset=4
                (local.get $l5)
                (i32.and
                  (local.get $l1)
                  (i32.const -2)))
              (i32.store offset=4
                (local.get $l2)
                (i32.or
                  (local.get $p0)
                  (i32.const 1)))
              (i32.store
                (i32.add
                  (local.get $p0)
                  (local.get $l2))
                (local.get $p0))
              (br $B13))
            (local.set $l1
              (i32.const 0)))
          (br_if $B14
            (i32.eqz
              (local.get $l6)))
          (block $B25
            (if $I26
              (i32.eq
                (i32.load
                  (local.tee $l4
                    (i32.add
                      (i32.shl
                        (local.tee $l3
                          (i32.load offset=28
                            (local.get $l5)))
                        (i32.const 2))
                      (i32.const 3576))))
                (local.get $l5))
              (then
                (i32.store
                  (local.get $l4)
                  (local.get $l1))
                (br_if $B25
                  (local.get $l1))
                (i32.store
                  (i32.const 3276)
                  (i32.and
                    (i32.load
                      (i32.const 3276))
                    (i32.rotl
                      (i32.const -2)
                      (local.get $l3))))
                (br $B14)))
            (i32.store
              (i32.add
                (local.get $l6)
                (select
                  (i32.const 16)
                  (i32.const 20)
                  (i32.eq
                    (i32.load offset=16
                      (local.get $l6))
                    (local.get $l5))))
              (local.get $l1))
            (br_if $B14
              (i32.eqz
                (local.get $l1))))
          (i32.store offset=24
            (local.get $l1)
            (local.get $l6))
          (if $I27
            (local.tee $l3
              (i32.load offset=16
                (local.get $l5)))
            (then
              (i32.store offset=16
                (local.get $l1)
                (local.get $l3))
              (i32.store offset=24
                (local.get $l3)
                (local.get $l1))))
          (br_if $B14
            (i32.eqz
              (local.tee $l3
                (i32.load offset=20
                  (local.get $l5)))))
          (i32.store offset=20
            (local.get $l1)
            (local.get $l3))
          (i32.store offset=24
            (local.get $l3)
            (local.get $l1)))
        (i32.store offset=4
          (local.get $l2)
          (i32.or
            (local.get $p0)
            (i32.const 1)))
        (i32.store
          (i32.add
            (local.get $p0)
            (local.get $l2))
          (local.get $p0))
        (br_if $B13
          (i32.ne
            (local.get $l2)
            (i32.load
              (i32.const 3292))))
        (i32.store
          (i32.const 3280)
          (local.get $p0))
        (return))
      (if $I28
        (i32.le_u
          (local.get $p0)
          (i32.const 255))
        (then
          (local.set $l1
            (i32.add
              (i32.and
                (local.get $p0)
                (i32.const -8))
              (i32.const 3312)))
          (local.set $p0
            (block $B29 (result i32)
              (if $I30
                (i32.eqz
                  (i32.and
                    (local.tee $l3
                      (i32.load
                        (i32.const 3272)))
                    (local.tee $p0
                      (i32.shl
                        (i32.const 1)
                        (i32.shr_u
                          (local.get $p0)
                          (i32.const 3))))))
                (then
                  (i32.store
                    (i32.const 3272)
                    (i32.or
                      (local.get $p0)
                      (local.get $l3)))
                  (br $B29
                    (local.get $l1))))
              (i32.load offset=8
                (local.get $l1))))
          (i32.store offset=8
            (local.get $l1)
            (local.get $l2))
          (i32.store offset=12
            (local.get $p0)
            (local.get $l2))
          (i32.store offset=12
            (local.get $l2)
            (local.get $l1))
          (i32.store offset=8
            (local.get $l2)
            (local.get $p0))
          (return)))
      (local.set $l3
        (i32.const 31))
      (if $I31
        (i32.le_u
          (local.get $p0)
          (i32.const 16777215))
        (then
          (local.set $l3
            (i32.add
              (i32.sub
                (i32.and
                  (i32.shr_u
                    (local.get $p0)
                    (i32.sub
                      (i32.const 38)
                      (local.tee $l1
                        (i32.clz
                          (i32.shr_u
                            (local.get $p0)
                            (i32.const 8))))))
                  (i32.const 1))
                (i32.shl
                  (local.get $l1)
                  (i32.const 1)))
              (i32.const 62)))))
      (i32.store offset=28
        (local.get $l2)
        (local.get $l3))
      (i64.store offset=16 align=4
        (local.get $l2)
        (i64.const 0))
      (local.set $l1
        (i32.add
          (i32.shl
            (local.get $l3)
            (i32.const 2))
          (i32.const 3576)))
      (block $B32
        (block $B33
          (block $B34
            (if $I35
              (i32.eqz
                (i32.and
                  (local.tee $l4
                    (i32.load
                      (i32.const 3276)))
                  (local.tee $l7
                    (i32.shl
                      (i32.const 1)
                      (local.get $l3)))))
              (then
                (i32.store
                  (i32.const 3276)
                  (i32.or
                    (local.get $l4)
                    (local.get $l7)))
                (i32.store
                  (local.get $l1)
                  (local.get $l2))
                (i32.store offset=24
                  (local.get $l2)
                  (local.get $l1))
                (br $B34)))
            (local.set $l3
              (i32.shl
                (local.get $p0)
                (select
                  (i32.sub
                    (i32.const 25)
                    (i32.shr_u
                      (local.get $l3)
                      (i32.const 1)))
                  (i32.const 0)
                  (i32.ne
                    (local.get $l3)
                    (i32.const 31)))))
            (local.set $l1
              (i32.load
                (local.get $l1)))
            (loop $L36
              (br_if $B33
                (i32.eq
                  (i32.and
                    (i32.load offset=4
                      (local.tee $l4
                        (local.get $l1)))
                    (i32.const -8))
                  (local.get $p0)))
              (local.set $l1
                (i32.shr_u
                  (local.get $l3)
                  (i32.const 29)))
              (local.set $l3
                (i32.shl
                  (local.get $l3)
                  (i32.const 1)))
              (br_if $L36
                (local.tee $l1
                  (i32.load
                    (i32.add
                      (local.tee $l7
                        (i32.add
                          (local.get $l4)
                          (i32.and
                            (local.get $l1)
                            (i32.const 4))))
                      (i32.const 16))))))
            (i32.store offset=16
              (local.get $l7)
              (local.get $l2))
            (i32.store offset=24
              (local.get $l2)
              (local.get $l4)))
          (i32.store offset=12
            (local.get $l2)
            (local.get $l2))
          (i32.store offset=8
            (local.get $l2)
            (local.get $l2))
          (br $B32))
        (i32.store offset=12
          (local.tee $p0
            (i32.load offset=8
              (local.get $l4)))
          (local.get $l2))
        (i32.store offset=8
          (local.get $l4)
          (local.get $l2))
        (i32.store offset=24
          (local.get $l2)
          (i32.const 0))
        (i32.store offset=12
          (local.get $l2)
          (local.get $l4))
        (i32.store offset=8
          (local.get $l2)
          (local.get $p0)))
      (i32.store
        (i32.const 3304)
        (select
          (local.tee $p0
            (i32.sub
              (i32.load
                (i32.const 3304))
              (i32.const 1)))
          (i32.const -1)
          (local.get $p0)))))
  (func $f35 (type $t17) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (local.set $l5
      (i32.add
        (local.get $p0)
        (local.get $p1)))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.and
            (local.tee $l2
              (i32.load offset=4
                (local.get $p0)))
            (i32.const 1)))
        (br_if $B0
          (i32.eqz
            (i32.and
              (local.get $l2)
              (i32.const 3))))
        (local.set $p1
          (i32.add
            (local.tee $l2
              (i32.load
                (local.get $p0)))
            (local.get $p1)))
        (block $B2
          (block $B3
            (block $B4
              (if $I5
                (i32.ne
                  (local.tee $p0
                    (i32.sub
                      (local.get $p0)
                      (local.get $l2)))
                  (i32.load
                    (i32.const 3292)))
                (then
                  (if $I6
                    (i32.le_u
                      (local.get $l2)
                      (i32.const 255))
                    (then
                      (local.set $l4
                        (i32.shr_u
                          (local.get $l2)
                          (i32.const 3)))
                      (br_if $B4
                        (i32.ne
                          (local.tee $l3
                            (i32.load offset=8
                              (local.get $p0)))
                          (local.tee $l2
                            (i32.load offset=12
                              (local.get $p0)))))
                      (i32.store
                        (i32.const 3272)
                        (i32.and
                          (i32.load
                            (i32.const 3272))
                          (i32.rotl
                            (i32.const -2)
                            (local.get $l4))))
                      (br $B1)))
                  (local.set $l6
                    (i32.load offset=24
                      (local.get $p0)))
                  (if $I7
                    (i32.ne
                      (local.get $p0)
                      (local.tee $l2
                        (i32.load offset=12
                          (local.get $p0))))
                    (then
                      (drop
                        (i32.load
                          (i32.const 3288)))
                      (i32.store offset=12
                        (local.tee $l3
                          (i32.load offset=8
                            (local.get $p0)))
                        (local.get $l2))
                      (i32.store offset=8
                        (local.get $l2)
                        (local.get $l3))
                      (br $B2)))
                  (if $I8
                    (i32.eqz
                      (local.tee $l3
                        (i32.load
                          (local.tee $l4
                            (i32.add
                              (local.get $p0)
                              (i32.const 20))))))
                    (then
                      (br_if $B3
                        (i32.eqz
                          (local.tee $l3
                            (i32.load offset=16
                              (local.get $p0)))))
                      (local.set $l4
                        (i32.add
                          (local.get $p0)
                          (i32.const 16)))))
                  (loop $L9
                    (local.set $l7
                      (local.get $l4))
                    (br_if $L9
                      (local.tee $l3
                        (i32.load
                          (local.tee $l4
                            (i32.add
                              (local.tee $l2
                                (local.get $l3))
                              (i32.const 20))))))
                    (local.set $l4
                      (i32.add
                        (local.get $l2)
                        (i32.const 16)))
                    (br_if $L9
                      (local.tee $l3
                        (i32.load offset=16
                          (local.get $l2)))))
                  (i32.store
                    (local.get $l7)
                    (i32.const 0))
                  (br $B2)))
              (br_if $B1
                (i32.ne
                  (i32.and
                    (local.tee $l2
                      (i32.load offset=4
                        (local.get $l5)))
                    (i32.const 3))
                  (i32.const 3)))
              (i32.store
                (i32.const 3280)
                (local.get $p1))
              (i32.store offset=4
                (local.get $l5)
                (i32.and
                  (local.get $l2)
                  (i32.const -2)))
              (i32.store offset=4
                (local.get $p0)
                (i32.or
                  (local.get $p1)
                  (i32.const 1)))
              (i32.store
                (local.get $l5)
                (local.get $p1))
              (return))
            (i32.store offset=12
              (local.get $l3)
              (local.get $l2))
            (i32.store offset=8
              (local.get $l2)
              (local.get $l3))
            (br $B1))
          (local.set $l2
            (i32.const 0)))
        (br_if $B1
          (i32.eqz
            (local.get $l6)))
        (block $B10
          (if $I11
            (i32.eq
              (i32.load
                (local.tee $l4
                  (i32.add
                    (i32.shl
                      (local.tee $l3
                        (i32.load offset=28
                          (local.get $p0)))
                      (i32.const 2))
                    (i32.const 3576))))
              (local.get $p0))
            (then
              (i32.store
                (local.get $l4)
                (local.get $l2))
              (br_if $B10
                (local.get $l2))
              (i32.store
                (i32.const 3276)
                (i32.and
                  (i32.load
                    (i32.const 3276))
                  (i32.rotl
                    (i32.const -2)
                    (local.get $l3))))
              (br $B1)))
          (i32.store
            (i32.add
              (local.get $l6)
              (select
                (i32.const 16)
                (i32.const 20)
                (i32.eq
                  (i32.load offset=16
                    (local.get $l6))
                  (local.get $p0))))
            (local.get $l2))
          (br_if $B1
            (i32.eqz
              (local.get $l2))))
        (i32.store offset=24
          (local.get $l2)
          (local.get $l6))
        (if $I12
          (local.tee $l3
            (i32.load offset=16
              (local.get $p0)))
          (then
            (i32.store offset=16
              (local.get $l2)
              (local.get $l3))
            (i32.store offset=24
              (local.get $l3)
              (local.get $l2))))
        (br_if $B1
          (i32.eqz
            (local.tee $l3
              (i32.load offset=20
                (local.get $p0)))))
        (i32.store offset=20
          (local.get $l2)
          (local.get $l3))
        (i32.store offset=24
          (local.get $l3)
          (local.get $l2)))
      (block $B13
        (block $B14
          (block $B15
            (block $B16
              (if $I17
                (i32.eqz
                  (i32.and
                    (local.tee $l2
                      (i32.load offset=4
                        (local.get $l5)))
                    (i32.const 2)))
                (then
                  (if $I18
                    (i32.eq
                      (i32.load
                        (i32.const 3296))
                      (local.get $l5))
                    (then
                      (i32.store
                        (i32.const 3296)
                        (local.get $p0))
                      (i32.store
                        (i32.const 3284)
                        (local.tee $p1
                          (i32.add
                            (i32.load
                              (i32.const 3284))
                            (local.get $p1))))
                      (i32.store offset=4
                        (local.get $p0)
                        (i32.or
                          (local.get $p1)
                          (i32.const 1)))
                      (br_if $B0
                        (i32.ne
                          (local.get $p0)
                          (i32.load
                            (i32.const 3292))))
                      (i32.store
                        (i32.const 3280)
                        (i32.const 0))
                      (i32.store
                        (i32.const 3292)
                        (i32.const 0))
                      (return)))
                  (if $I19
                    (i32.eq
                      (i32.load
                        (i32.const 3292))
                      (local.get $l5))
                    (then
                      (i32.store
                        (i32.const 3292)
                        (local.get $p0))
                      (i32.store
                        (i32.const 3280)
                        (local.tee $p1
                          (i32.add
                            (i32.load
                              (i32.const 3280))
                            (local.get $p1))))
                      (i32.store offset=4
                        (local.get $p0)
                        (i32.or
                          (local.get $p1)
                          (i32.const 1)))
                      (i32.store
                        (i32.add
                          (local.get $p0)
                          (local.get $p1))
                        (local.get $p1))
                      (return)))
                  (local.set $p1
                    (i32.add
                      (i32.and
                        (local.get $l2)
                        (i32.const -8))
                      (local.get $p1)))
                  (if $I20
                    (i32.le_u
                      (local.get $l2)
                      (i32.const 255))
                    (then
                      (local.set $l4
                        (i32.shr_u
                          (local.get $l2)
                          (i32.const 3)))
                      (if $I21
                        (i32.eq
                          (local.tee $l2
                            (i32.load offset=12
                              (local.get $l5)))
                          (local.tee $l3
                            (i32.load offset=8
                              (local.get $l5))))
                        (then
                          (i32.store
                            (i32.const 3272)
                            (i32.and
                              (i32.load
                                (i32.const 3272))
                              (i32.rotl
                                (i32.const -2)
                                (local.get $l4))))
                          (br $B14)))
                      (i32.store offset=12
                        (local.get $l3)
                        (local.get $l2))
                      (i32.store offset=8
                        (local.get $l2)
                        (local.get $l3))
                      (br $B14)))
                  (local.set $l6
                    (i32.load offset=24
                      (local.get $l5)))
                  (if $I22
                    (i32.ne
                      (local.get $l5)
                      (local.tee $l2
                        (i32.load offset=12
                          (local.get $l5))))
                    (then
                      (drop
                        (i32.load
                          (i32.const 3288)))
                      (i32.store offset=12
                        (local.tee $l3
                          (i32.load offset=8
                            (local.get $l5)))
                        (local.get $l2))
                      (i32.store offset=8
                        (local.get $l2)
                        (local.get $l3))
                      (br $B15)))
                  (if $I23
                    (i32.eqz
                      (local.tee $l3
                        (i32.load
                          (local.tee $l4
                            (i32.add
                              (local.get $l5)
                              (i32.const 20))))))
                    (then
                      (br_if $B16
                        (i32.eqz
                          (local.tee $l3
                            (i32.load offset=16
                              (local.get $l5)))))
                      (local.set $l4
                        (i32.add
                          (local.get $l5)
                          (i32.const 16)))))
                  (loop $L24
                    (local.set $l7
                      (local.get $l4))
                    (br_if $L24
                      (local.tee $l3
                        (i32.load
                          (local.tee $l4
                            (i32.add
                              (local.tee $l2
                                (local.get $l3))
                              (i32.const 20))))))
                    (local.set $l4
                      (i32.add
                        (local.get $l2)
                        (i32.const 16)))
                    (br_if $L24
                      (local.tee $l3
                        (i32.load offset=16
                          (local.get $l2)))))
                  (i32.store
                    (local.get $l7)
                    (i32.const 0))
                  (br $B15)))
              (i32.store offset=4
                (local.get $l5)
                (i32.and
                  (local.get $l2)
                  (i32.const -2)))
              (i32.store offset=4
                (local.get $p0)
                (i32.or
                  (local.get $p1)
                  (i32.const 1)))
              (i32.store
                (i32.add
                  (local.get $p0)
                  (local.get $p1))
                (local.get $p1))
              (br $B13))
            (local.set $l2
              (i32.const 0)))
          (br_if $B14
            (i32.eqz
              (local.get $l6)))
          (block $B25
            (if $I26
              (i32.eq
                (i32.load
                  (local.tee $l4
                    (i32.add
                      (i32.shl
                        (local.tee $l3
                          (i32.load offset=28
                            (local.get $l5)))
                        (i32.const 2))
                      (i32.const 3576))))
                (local.get $l5))
              (then
                (i32.store
                  (local.get $l4)
                  (local.get $l2))
                (br_if $B25
                  (local.get $l2))
                (i32.store
                  (i32.const 3276)
                  (i32.and
                    (i32.load
                      (i32.const 3276))
                    (i32.rotl
                      (i32.const -2)
                      (local.get $l3))))
                (br $B14)))
            (i32.store
              (i32.add
                (local.get $l6)
                (select
                  (i32.const 16)
                  (i32.const 20)
                  (i32.eq
                    (i32.load offset=16
                      (local.get $l6))
                    (local.get $l5))))
              (local.get $l2))
            (br_if $B14
              (i32.eqz
                (local.get $l2))))
          (i32.store offset=24
            (local.get $l2)
            (local.get $l6))
          (if $I27
            (local.tee $l3
              (i32.load offset=16
                (local.get $l5)))
            (then
              (i32.store offset=16
                (local.get $l2)
                (local.get $l3))
              (i32.store offset=24
                (local.get $l3)
                (local.get $l2))))
          (br_if $B14
            (i32.eqz
              (local.tee $l3
                (i32.load offset=20
                  (local.get $l5)))))
          (i32.store offset=20
            (local.get $l2)
            (local.get $l3))
          (i32.store offset=24
            (local.get $l3)
            (local.get $l2)))
        (i32.store offset=4
          (local.get $p0)
          (i32.or
            (local.get $p1)
            (i32.const 1)))
        (i32.store
          (i32.add
            (local.get $p0)
            (local.get $p1))
          (local.get $p1))
        (br_if $B13
          (i32.ne
            (local.get $p0)
            (i32.load
              (i32.const 3292))))
        (i32.store
          (i32.const 3280)
          (local.get $p1))
        (return))
      (if $I28
        (i32.le_u
          (local.get $p1)
          (i32.const 255))
        (then
          (local.set $l2
            (i32.add
              (i32.and
                (local.get $p1)
                (i32.const -8))
              (i32.const 3312)))
          (local.set $p1
            (block $B29 (result i32)
              (if $I30
                (i32.eqz
                  (i32.and
                    (local.tee $l3
                      (i32.load
                        (i32.const 3272)))
                    (local.tee $p1
                      (i32.shl
                        (i32.const 1)
                        (i32.shr_u
                          (local.get $p1)
                          (i32.const 3))))))
                (then
                  (i32.store
                    (i32.const 3272)
                    (i32.or
                      (local.get $p1)
                      (local.get $l3)))
                  (br $B29
                    (local.get $l2))))
              (i32.load offset=8
                (local.get $l2))))
          (i32.store offset=8
            (local.get $l2)
            (local.get $p0))
          (i32.store offset=12
            (local.get $p1)
            (local.get $p0))
          (i32.store offset=12
            (local.get $p0)
            (local.get $l2))
          (i32.store offset=8
            (local.get $p0)
            (local.get $p1))
          (return)))
      (local.set $l3
        (i32.const 31))
      (if $I31
        (i32.le_u
          (local.get $p1)
          (i32.const 16777215))
        (then
          (local.set $l3
            (i32.add
              (i32.sub
                (i32.and
                  (i32.shr_u
                    (local.get $p1)
                    (i32.sub
                      (i32.const 38)
                      (local.tee $l2
                        (i32.clz
                          (i32.shr_u
                            (local.get $p1)
                            (i32.const 8))))))
                  (i32.const 1))
                (i32.shl
                  (local.get $l2)
                  (i32.const 1)))
              (i32.const 62)))))
      (i32.store offset=28
        (local.get $p0)
        (local.get $l3))
      (i64.store offset=16 align=4
        (local.get $p0)
        (i64.const 0))
      (local.set $l2
        (i32.add
          (i32.shl
            (local.get $l3)
            (i32.const 2))
          (i32.const 3576)))
      (block $B32
        (block $B33
          (if $I34
            (i32.eqz
              (i32.and
                (local.tee $l4
                  (i32.load
                    (i32.const 3276)))
                (local.tee $l7
                  (i32.shl
                    (i32.const 1)
                    (local.get $l3)))))
            (then
              (i32.store
                (i32.const 3276)
                (i32.or
                  (local.get $l4)
                  (local.get $l7)))
              (i32.store
                (local.get $l2)
                (local.get $p0))
              (i32.store offset=24
                (local.get $p0)
                (local.get $l2))
              (br $B33)))
          (local.set $l3
            (i32.shl
              (local.get $p1)
              (select
                (i32.sub
                  (i32.const 25)
                  (i32.shr_u
                    (local.get $l3)
                    (i32.const 1)))
                (i32.const 0)
                (i32.ne
                  (local.get $l3)
                  (i32.const 31)))))
          (local.set $l2
            (i32.load
              (local.get $l2)))
          (loop $L35
            (br_if $B32
              (i32.eq
                (i32.and
                  (i32.load offset=4
                    (local.tee $l4
                      (local.get $l2)))
                  (i32.const -8))
                (local.get $p1)))
            (local.set $l2
              (i32.shr_u
                (local.get $l3)
                (i32.const 29)))
            (local.set $l3
              (i32.shl
                (local.get $l3)
                (i32.const 1)))
            (br_if $L35
              (local.tee $l2
                (i32.load
                  (i32.add
                    (local.tee $l7
                      (i32.add
                        (local.get $l4)
                        (i32.and
                          (local.get $l2)
                          (i32.const 4))))
                    (i32.const 16))))))
          (i32.store offset=16
            (local.get $l7)
            (local.get $p0))
          (i32.store offset=24
            (local.get $p0)
            (local.get $l4)))
        (i32.store offset=12
          (local.get $p0)
          (local.get $p0))
        (i32.store offset=8
          (local.get $p0)
          (local.get $p0))
        (return))
      (i32.store offset=12
        (local.tee $p1
          (i32.load offset=8
            (local.get $l4)))
        (local.get $p0))
      (i32.store offset=8
        (local.get $l4)
        (local.get $p0))
      (i32.store offset=24
        (local.get $p0)
        (i32.const 0))
      (i32.store offset=12
        (local.get $p0)
        (local.get $l4))
      (i32.store offset=8
        (local.get $p0)
        (local.get $p1))))
  (func $stackSave (export "stackSave") (type $t7) (result i32)
    (global.get $g0))
  (func $stackRestore (export "stackRestore") (type $t2) (param $p0 i32)
    (global.set $g0
      (local.get $p0)))
  (func $stackAlloc (export "stackAlloc") (type $t0) (param $p0 i32) (result i32)
    (global.set $g0
      (local.tee $p0
        (i32.and
          (i32.sub
            (global.get $g0)
            (local.get $p0))
          (i32.const -16))))
    (local.get $p0))
  (table $__indirect_function_table (export "__indirect_function_table") 8 8 funcref)
  (memory $memory (export "memory") 1152 1152)
  (global $g0 (mut i32) (i32.const 69312))
  (elem $e0 (i32.const 1) func $f6 $f19 $f20 $f21 $f10 $f22 $f31)
  (data $d0 (i32.const 1024) "[PolyBench] posix_memalign: cannot allocate memory\00-+   0X0x\00-0X+0X 0X-0x+0x 0x\00begin dump: %s\00nan\00inf\00NAN\00INF\00C\00.\00(null)\00%0.2lf \00\0aend   dump: %s\0a\00==BEGIN DUMP_ARRAYS==\0a\00==END   DUMP_ARRAYS==\0a\00\00\00\00\b0\06")
  (data $d1 (i32.const 1232) "\19\00\0a\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\19\00\11\0a\19\19\19\03\0a\07\00\01\00\09\0b\18\00\00\09\06\0b\00\00\0b\00\06\19\00\00\00\19\19\19")
  (data $d2 (i32.const 1313) "\0e\00\00\00\00\00\00\00\00\19\00\0a\0d\19\19\19\00\0d\00\00\02\00\09\0e\00\00\00\09\00\0e\00\00\0e")
  (data $d3 (i32.const 1371) "\0c")
  (data $d4 (i32.const 1383) "\13\00\00\00\00\13\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c")
  (data $d5 (i32.const 1429) "\10")
  (data $d6 (i32.const 1441) "\0f\00\00\00\04\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10")
  (data $d7 (i32.const 1487) "\12")
  (data $d8 (i32.const 1499) "\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00\1a\00\00\00\1a\1a\1a")
  (data $d9 (i32.const 1554) "\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\09")
  (data $d10 (i32.const 1603) "\14")
  (data $d11 (i32.const 1615) "\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14")
  (data $d12 (i32.const 1661) "\16")
  (data $d13 (i32.const 1673) "\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\000123456789ABCDEF")
  (data $d14 (i32.const 1712) "\05")
  (data $d15 (i32.const 1724) "\02")
  (data $d16 (i32.const 1748) "\03\00\00\00\04\00\00\00\b4\08")
  (data $d17 (i32.const 1772) "\02")
  (data $d18 (i32.const 1788) "\ff\ff\ff\ff\ff\ff\ff\ff")
  (data $d19 (i32.const 1856) "\b0\06\00\00\00\00\00\00\05")
  (data $d20 (i32.const 1876) "\05")
  (data $d21 (i32.const 1900) "\03\00\00\00\06\00\00\00\c8\08\00\00\00\04")
  (data $d22 (i32.const 1924) "\01")
  (data $d23 (i32.const 1940) "\ff\ff\ff\ff\0a")
  (data $d24 (i32.const 2008) "H\07\00\00\c0\0e\01"))
