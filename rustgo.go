package rustgo

import (
	"unsafe"
)

//go:noescape
func asmAddNumbers(a, b int64) int64

//go:noescape
func asmProcessBytes(ptr unsafe.Pointer, len int) int64

// Calls the externally-linked Rust function above
func AddNumbers(a, b int64) int64 {
	return asmAddNumbers(a, b)
}

// Calls the externally-linked Rust function above
func ProcessBytes(data []byte) int64 {
	if len(data) == 0 {
		return 0
	}
	return asmProcessBytes(unsafe.Pointer(&data[0]), len(data))
}
