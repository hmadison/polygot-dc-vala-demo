default: demo

clean:
	rm demo

demo:
	valac -o demo --pkg clutter-1.0 main.vala -X -lm
