(module
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func (param i32) (result i32)))
  (import "wasi_snapshot_preview1" "proc_exit" (func (;0;) (type 2)))
  (func (;1;) (type 0)
    call 12)
  (func (;2;) (type 3) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    local.get 0
    i32.store offset=28
    local.get 4
    local.get 1
    i32.store offset=24
    i32.const 0
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=20
    block  ;; label = @1
      loop  ;; label = @2
        local.get 4
        i32.load offset=20
        local.set 6
        local.get 4
        i32.load offset=24
        local.set 7
        i32.const 1
        local.set 8
        local.get 7
        local.get 8
        i32.sub
        local.set 9
        local.get 6
        local.set 10
        local.get 9
        local.set 11
        local.get 10
        local.get 11
        i32.lt_s
        local.set 12
        i32.const 1
        local.set 13
        local.get 12
        local.get 13
        i32.and
        local.set 14
        local.get 14
        i32.eqz
        br_if 1 (;@1;)
        i32.const 0
        local.set 15
        local.get 4
        local.get 15
        i32.store offset=16
        block  ;; label = @3
          loop  ;; label = @4
            local.get 4
            i32.load offset=16
            local.set 16
            local.get 4
            i32.load offset=24
            local.set 17
            local.get 4
            i32.load offset=20
            local.set 18
            local.get 17
            local.get 18
            i32.sub
            local.set 19
            i32.const 1
            local.set 20
            local.get 19
            local.get 20
            i32.sub
            local.set 21
            local.get 16
            local.set 22
            local.get 21
            local.set 23
            local.get 22
            local.get 23
            i32.lt_s
            local.set 24
            i32.const 1
            local.set 25
            local.get 24
            local.get 25
            i32.and
            local.set 26
            local.get 26
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load offset=28
            local.set 27
            local.get 4
            i32.load offset=16
            local.set 28
            i32.const 2
            local.set 29
            local.get 28
            local.get 29
            i32.shl
            local.set 30
            local.get 27
            local.get 30
            i32.add
            local.set 31
            local.get 31
            i32.load
            local.set 32
            local.get 4
            i32.load offset=28
            local.set 33
            local.get 4
            i32.load offset=16
            local.set 34
            i32.const 1
            local.set 35
            local.get 34
            local.get 35
            i32.add
            local.set 36
            i32.const 2
            local.set 37
            local.get 36
            local.get 37
            i32.shl
            local.set 38
            local.get 33
            local.get 38
            i32.add
            local.set 39
            local.get 39
            i32.load
            local.set 40
            local.get 32
            local.set 41
            local.get 40
            local.set 42
            local.get 41
            local.get 42
            i32.gt_s
            local.set 43
            i32.const 1
            local.set 44
            local.get 43
            local.get 44
            i32.and
            local.set 45
            block  ;; label = @5
              local.get 45
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              i32.load offset=28
              local.set 46
              local.get 4
              i32.load offset=16
              local.set 47
              i32.const 2
              local.set 48
              local.get 47
              local.get 48
              i32.shl
              local.set 49
              local.get 46
              local.get 49
              i32.add
              local.set 50
              local.get 50
              i32.load
              local.set 51
              local.get 4
              local.get 51
              i32.store offset=12
              local.get 4
              i32.load offset=28
              local.set 52
              local.get 4
              i32.load offset=16
              local.set 53
              i32.const 1
              local.set 54
              local.get 53
              local.get 54
              i32.add
              local.set 55
              i32.const 2
              local.set 56
              local.get 55
              local.get 56
              i32.shl
              local.set 57
              local.get 52
              local.get 57
              i32.add
              local.set 58
              local.get 58
              i32.load
              local.set 59
              local.get 4
              i32.load offset=28
              local.set 60
              local.get 4
              i32.load offset=16
              local.set 61
              i32.const 2
              local.set 62
              local.get 61
              local.get 62
              i32.shl
              local.set 63
              local.get 60
              local.get 63
              i32.add
              local.set 64
              local.get 64
              local.get 59
              i32.store
              local.get 4
              i32.load offset=12
              local.set 65
              local.get 4
              i32.load offset=28
              local.set 66
              local.get 4
              i32.load offset=16
              local.set 67
              i32.const 1
              local.set 68
              local.get 67
              local.get 68
              i32.add
              local.set 69
              i32.const 2
              local.set 70
              local.get 69
              local.get 70
              i32.shl
              local.set 71
              local.get 66
              local.get 71
              i32.add
              local.set 72
              local.get 72
              local.get 65
              i32.store
            end
            local.get 4
            i32.load offset=16
            local.set 73
            i32.const 1
            local.set 74
            local.get 73
            local.get 74
            i32.add
            local.set 75
            local.get 4
            local.get 75
            i32.store offset=16
            br 0 (;@4;)
          end
          unreachable
        end
        local.get 4
        i32.load offset=20
        local.set 76
        i32.const 1
        local.set 77
        local.get 76
        local.get 77
        i32.add
        local.set 78
        local.get 4
        local.get 78
        i32.store offset=20
        br 0 (;@2;)
      end
      unreachable
    end
    return)
  (func (;3;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64)
    global.get 0
    local.set 0
    i32.const 48
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    local.set 2
    local.get 2
    global.set 0
    i32.const 0
    local.set 3
    local.get 2
    local.get 3
    i32.store offset=44
    i32.const 16
    local.set 4
    local.get 2
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    i32.const 24
    local.set 7
    local.get 6
    local.get 7
    i32.add
    local.set 8
    i32.const 0
    local.set 9
    local.get 9
    i32.load offset=1048
    local.set 10
    local.get 8
    local.get 10
    i32.store
    i32.const 16
    local.set 11
    local.get 6
    local.get 11
    i32.add
    local.set 12
    local.get 9
    i64.load offset=1040
    local.set 23
    local.get 12
    local.get 23
    i64.store
    i32.const 8
    local.set 13
    local.get 6
    local.get 13
    i32.add
    local.set 14
    local.get 9
    i64.load offset=1032
    local.set 24
    local.get 14
    local.get 24
    i64.store
    local.get 9
    i64.load offset=1024
    local.set 25
    local.get 6
    local.get 25
    i64.store
    i32.const 7
    local.set 15
    local.get 2
    local.get 15
    i32.store offset=12
    i32.const 16
    local.set 16
    local.get 2
    local.get 16
    i32.add
    local.set 17
    local.get 17
    local.set 18
    local.get 2
    i32.load offset=12
    local.set 19
    local.get 18
    local.get 19
    call 2
    i32.const 0
    local.set 20
    i32.const 48
    local.set 21
    local.get 2
    local.get 21
    i32.add
    local.set 22
    local.get 22
    global.set 0
    local.get 20
    return)
  (func (;4;) (type 0)
    block  ;; label = @1
      i32.const 1
      i32.eqz
      br_if 0 (;@1;)
      call 1
    end
    call 3
    call 7
    unreachable)
  (func (;5;) (type 0))
  (func (;6;) (type 0)
    (local i32)
    i32.const 0
    local.set 0
    block  ;; label = @1
      i32.const 0
      i32.const 0
      i32.le_u
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        local.tee 0
        i32.load
        call_indirect (type 0)
        local.get 0
        i32.const 0
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    call 5)
  (func (;7;) (type 2) (param i32)
    call 5
    call 6
    call 5
    local.get 0
    call 8
    unreachable)
  (func (;8;) (type 2) (param i32)
    local.get 0
    call 0
    unreachable)
  (func (;9;) (type 1) (result i32)
    global.get 0)
  (func (;10;) (type 2) (param i32)
    local.get 0
    global.set 0)
  (func (;11;) (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get 0
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 1
    global.set 0
    local.get 1)
  (func (;12;) (type 0)
    i32.const 5243936
    global.set 2
    i32.const 1056
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set 1)
  (func (;13;) (type 1) (result i32)
    global.get 0
    global.get 1
    i32.sub)
  (func (;14;) (type 1) (result i32)
    global.get 2)
  (func (;15;) (type 1) (result i32)
    global.get 1)
  (func (;16;) (type 1) (result i32)
    i32.const 1052)
  (table (;0;) 2 2 funcref)
  (memory (;0;) 256 256)
  (global (;0;) (mut i32) (i32.const 5243936))
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "memory" (memory 0))
  (export "__indirect_function_table" (table 0))
  (export "_start" (func 4))
  (export "__errno_location" (func 16))
  (export "emscripten_stack_init" (func 12))
  (export "emscripten_stack_get_free" (func 13))
  (export "emscripten_stack_get_base" (func 14))
  (export "emscripten_stack_get_end" (func 15))
  (export "stackSave" (func 9))
  (export "stackRestore" (func 10))
  (export "stackAlloc" (func 11))
  (elem (;0;) (i32.const 1) func 1)
  (data (;0;) (i32.const 1024) "@\00\00\00\22\00\00\00\19\00\00\00\0c\00\00\00\16\00\00\00\0b\00\00\00Z\00\00\00"))
