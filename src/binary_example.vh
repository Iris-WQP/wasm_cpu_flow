0000000: 0061 736d                                 ; WASM_BINARY_MAGIC
0000004: 0100 0000                                 ; WASM_BINARY_VERSION
; section "Type" (1)//initialize local memory
0000008: 01                                        ; section code
0000009: 00                                        ; section size (guess)
000000a: 01                                        ; num types
; func type 0
000000b: 60                                        ; func
000000c: 01                                        ; num params
000000d: 7f                                        ; i32
000000e: 00                                        ; num results
0000009: 05                                        ; FIXUP section size
; section "Function" (3)
000000f: 03                                        ; section code
0000010: 00                                        ; section size (guess)
0000011: 01                                        ; num functions
0000012: 00                                        ; function 0 signature index
0000010: 02                                        ; FIXUP section size
; section "Memory" (5)
0000013: 05                                        ; section code
0000014: 00                                        ; section size (guess)
0000015: 01                                        ; num memories
; memory 0
0000016: 01                                        ; limits: flags
0000017: 01                                        ; limits: initial
0000018: 02                                        ; limits: max
0000014: 04                                        ; FIXUP section size
; section "Global" (6)
0000019: 06                                        ; section code
000001a: 00                                        ; section size (guess)
000001b: 01                                        ; num globals
000001c: 7f                                        ; i32
000001d: 01                                        ; global mutability
000001e: 41                                        ; i32.const
000001f: 00                                        ; i32 literal
0000020: 0b                                        ; end
000001a: 06                                        ; FIXUP section size
; section "Code" (10)
0000021: 0a                                        ; section code
0000022: 00                                        ; section size (guess)
0000023: 01                                        ; num functions
; function body 0
0000024: 00                                        ; func body size (guess)
0000025: 00                                        ; local decl count
0000026: 41                                        ; i32.const
0000027: fb00                                      ; i32 literal
0000029: 28                                        ; i32.load
000002a: 02                                        ; alignment
000002b: 64                                        ; load offset
000002c: 41                                        ; i32.const
000002d: c803                                      ; i32 literal
000002f: 36                                        ; i32.store
0000030: 02                                        ; alignment
0000031: c801                                      ; store offset
0000033: 23                                        ; global.get
0000034: 00                                        ; global index
0000035: 20                                        ; local.get
0000036: 00                                        ; local index
0000037: 6a                                        ; i32.add
0000038: 1a                                        ; drop
0000039: 0b                                        ; end
0000024: 15                                        ; FIXUP func body size
0000022: 17                                        ; FIXUP section size
; section "name"
000003a: 00                                        ; section code
000003b: 00                                        ; section size (guess)
000003c: 04                                        ; string length
000003d: 6e61 6d65                                name  ; custom section name
0000041: 01                                        ; name subsection type
0000042: 00                                        ; subsection size (guess)
0000043: 01                                        ; num names
0000044: 00                                        ; elem index
0000045: 02                                        ; string length
0000046: 6631                                     f1  ; elem name 0
0000042: 05                                        ; FIXUP subsection size
0000048: 02                                        ; local name type
0000049: 00                                        ; subsection size (guess)
000004a: 01                                        ; num functions
000004b: 00                                        ; function index
000004c: 01                                        ; num locals
000004d: 00                                        ; local index
000004e: 01                                        ; string length
000004f: 61                                       a  ; local name 0
0000049: 06                                        ; FIXUP subsection size
0000050: 07                                        ; name subsection type
0000051: 00                                        ; subsection size (guess)
0000052: 01                                        ; num names
0000053: 00                                        ; elem index
0000054: 02                                        ; string length
0000055: 6731                                     g1  ; elem name 0
0000051: 05                                        ; FIXUP subsection size
000003b: 1b                                        ; FIXUP section size