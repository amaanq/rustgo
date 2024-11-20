package rustgo

import (
	"testing"
)

func TestAddNumbers(t *testing.T) {
	tests := []struct {
		a, b, want int64
	}{
		{1, 2, 3},
		{-1, 1, 0},
		{9223372036854775806, 1, 9223372036854775807},
	}

	for _, tt := range tests {
		got := AddNumbers(tt.a, tt.b)
		if got != tt.want {
			t.Errorf("AddNumbers(%d, %d) = %d; want %d", tt.a, tt.b, got, tt.want)
		}
	}
}

func TestProcessBytes(t *testing.T) {
	tests := []struct {
		input []byte
		want  int64
	}{
		{[]byte{1, 2, 3}, 6},
		{[]byte{255, 255}, 510},
		{nil, 0},
		{[]byte{}, 0},
	}

	for _, tt := range tests {
		got := ProcessBytes(tt.input)
		if got != tt.want {
			t.Errorf("ProcessBytes(%v) = %d; want %d", tt.input, got, tt.want)
		}
	}
}
