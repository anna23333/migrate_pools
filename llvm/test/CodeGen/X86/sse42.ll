; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-apple-darwin9 -mattr=sse4.2 | FileCheck %s --check-prefix=X32
; RUN: llc < %s -mtriple=x86_64-apple-darwin9 -mattr=sse4.2 | FileCheck %s --check-prefix=X64

declare i32 @llvm.x86.sse42.crc32.32.8(i32, i8) nounwind
declare i32 @llvm.x86.sse42.crc32.32.16(i32, i16) nounwind
declare i32 @llvm.x86.sse42.crc32.32.32(i32, i32) nounwind

define i32 @crc32_32_8(i32 %a, i8 %b) nounwind {
; X32-LABEL: crc32_32_8:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    crc32b {{[0-9]+}}(%esp), %eax
; X32-NEXT:    retl
;
; X64-LABEL: crc32_32_8:
; X64:       ## BB#0:
; X64-NEXT:    crc32b %sil, %edi
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
  %tmp = call i32 @llvm.x86.sse42.crc32.32.8(i32 %a, i8 %b)
  ret i32 %tmp
}


define i32 @crc32_32_16(i32 %a, i16 %b) nounwind {
; X32-LABEL: crc32_32_16:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    crc32w {{[0-9]+}}(%esp), %eax
; X32-NEXT:    retl
;
; X64-LABEL: crc32_32_16:
; X64:       ## BB#0:
; X64-NEXT:    crc32w %si, %edi
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
  %tmp = call i32 @llvm.x86.sse42.crc32.32.16(i32 %a, i16 %b)
  ret i32 %tmp
}


define i32 @crc32_32_32(i32 %a, i32 %b) nounwind {
; X32-LABEL: crc32_32_32:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    crc32l {{[0-9]+}}(%esp), %eax
; X32-NEXT:    retl
;
; X64-LABEL: crc32_32_32:
; X64:       ## BB#0:
; X64-NEXT:    crc32l %esi, %edi
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
  %tmp = call i32 @llvm.x86.sse42.crc32.32.32(i32 %a, i32 %b)
  ret i32 %tmp
}

