#include "gba.h"
#include "sound.h"

// Songs
#include "bitsong.h"
#include "pixelsong.h"

// Set up sound
void setupSounds() {

    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;

}

// Game sounds
void playSoundA(const signed char* data, int dataLength, int looping) {
    
    // DMA sound data into queue
    DMANow(1, data, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    // Set timer 0 register
    REG_TM0CNT = TIMER_OFF;
    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;
    REG_TM0D = 65536 - cyclesPerSample;
    REG_TM0CNT = TIMER_ON;

    // Set struct variables
    soundA.data = data;
    soundA.dataLength = dataLength;
    soundA.looping = looping;
    soundA.isPlaying = 1;
    soundA.durationInVBlanks = (VBLANK_FREQ * dataLength) / SOUND_FREQ;
    soundA.vBlankCount = 0;
}

// Game songs
void playSoundB(const signed char* data, int dataLength, int looping) {

    // DMA song data into queue
    DMANow(2, data, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    // Set timer 1 register
    REG_TM1CNT = TIMER_OFF;
    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;
    REG_TM1D = 65536 - cyclesPerSample;
    REG_TM1CNT = TIMER_ON;

    // Set struct variables
    soundB.data = data;
    soundB.dataLength = dataLength;
    soundB.looping = looping;
    soundB.isPlaying = 1;
    soundB.durationInVBlanks = (VBLANK_FREQ * dataLength) / SOUND_FREQ;
    soundB.vBlankCount = 0;
}

// Stop sounds
void stopSounds() {
    // Set sounds to not playing
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    // Turn off timers
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
    // Set DMA control registers to 0
    dma[1].cnt = 0;
    dma[2].cnt = 0;
}

void pauseSounds() {
    // Set sound to not playing
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    // Turn off timers
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
}

void unpauseSounds() {
    // Set sound to playing
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    // Turn on timers
    REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_ON;
}

// Play song
void playSong(unsigned int sampleRate, unsigned int length, const signed char* data) {
    // Set song struct variables
    song.sampleRate = sampleRate;
    song.length = length;
    song.data = (signed char*) data;

    // Play sound from song data
    playSoundB(song.data, song.length, 1);

    // Set timer controllers
    REG_TM2CNT = 0;
    REG_TM2D = 65536 - 16384;
    REG_TM3CNT = 0;
    REG_TM3D = 65536 - 60;
}