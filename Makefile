default: demo

clean:
	rm main.c
	rm demo

demo: main.c
	gcc menu.m main.c -o demo -framework Foundation -framework AppKit -lm `pkg-config clutter-1.0 --cflags --libs`

main.c:
	valac -C --pkg clutter-1.0 main.vala -X -lm
