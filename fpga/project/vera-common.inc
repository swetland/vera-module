
PROJECT_SRCS += \
	source/top.v \
	source/reset_sync.v \
	source/main_ram.v \
	source/vram_if.v \
	source/dpram.v

PROJECT_SRCS += \
	source/graphics/layer_renderer.v \
	source/graphics/sprite_line_buffer.v \
	source/graphics/composer.v \
	source/graphics/layer_line_buffer.v \
	source/graphics/sprite_renderer.v \
	source/video/video_vga.v

PROJECT_SRCS += \
	source/audio/audio.v \
	source/audio/pcm.v \
	source/audio/dacif.v \
	source/audio/psg.v \
	source/audio/audio_fifo.v

PROJECT_SRCS += \
	source/spi/spictrl.v

PROJECT_SRCS += \
	source/compat/SP256K.v \
	source/compat/WARMBOOT.v \
	source/compat/sprite_ram.v \
	source/compat/palette_ram.v \
