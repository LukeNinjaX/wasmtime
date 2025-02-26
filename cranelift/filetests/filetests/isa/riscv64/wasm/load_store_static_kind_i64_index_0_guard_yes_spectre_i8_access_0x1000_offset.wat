;;! target = "riscv64"
;;!
;;! settings = ['enable_heap_access_spectre_mitigation=true']
;;!
;;! compile = true
;;!
;;! [globals.vmctx]
;;! type = "i64"
;;! vmctx = true
;;!
;;! [globals.heap_base]
;;! type = "i64"
;;! load = { base = "vmctx", offset = 0, readonly = true }
;;!
;;! # (no heap_bound global for static heaps)
;;!
;;! [[heaps]]
;;! base = "heap_base"
;;! min_size = 0x10000
;;! offset_guard_size = 0
;;! index_type = "i64"
;;! style = { kind = "static", bound = 0x10000000 }

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0x1000)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load8_u offset=0x1000))

;; function u0:0:
;; block0:
;;   lui a4,65535
;;   addi a3,a4,-1
;;   ugt a5,a0,a3##ty=i64
;;   ld a2,0(a2)
;;   add a0,a2,a0
;;   lui a2,1
;;   add a0,a0,a2
;;   li a2,0
;;   sltu a3,zero,a5
;;   sub a3,zero,a3
;;   and a4,a2,a3
;;   not a2,a3
;;   and a2,a0,a2
;;   or a4,a4,a2
;;   sb a1,0(a4)
;;   j label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   lui a4,65535
;;   addi a2,a4,-1
;;   ugt a5,a0,a2##ty=i64
;;   ld a1,0(a1)
;;   add a0,a1,a0
;;   lui a1,1
;;   add a0,a0,a1
;;   li a1,0
;;   sltu a2,zero,a5
;;   sub a2,zero,a2
;;   and a4,a1,a2
;;   not a1,a2
;;   and a2,a0,a1
;;   or a4,a4,a2
;;   lbu a0,0(a4)
;;   j label1
;; block1:
;;   ret
